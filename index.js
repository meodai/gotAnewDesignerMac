'use strict';

var inquirer  = require('inquirer');
var yaml      = require('js-yaml');
var fs        = require('fs');

var doc        = yaml.safeLoad(fs.readFileSync('apps.yml', 'utf8'));

//console.log(JSON.stringify(doc, null, '  '));

var questions = [];

for (var category in doc.categories) {
  var apps = doc.categories[category].items;
  //appChoises.push( new inquirer.Separator(' = ' + category + ' = ') );
  var appChoises = [];

  for (var i in apps) {
    var app = apps[i];
    appChoises.push({
      name: app.description,
      checked: app.default
    });
  }

  questions.push({
    type: doc.categories[category].multiple ? 'checkbox' : 'list',
    message: 'Choose ' + category + ' to install',
    name: category,
    choices: appChoises
  });
}

inquirer.prompt(questions).then(function (answers) {
  console.log(JSON.stringify(answers, null, '  '));
  fs.writeFile('Brewfile.test', JSON.stringify(answers, null, '  '), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log('Brewfile was generated!');
});
});
