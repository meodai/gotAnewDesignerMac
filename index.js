'use strict';

var inquirer  = require('inquirer');
var yaml      = require('js-yaml');
var fs        = require('fs');
var doc       = yaml.safeLoad(fs.readFileSync('app-list.yml', 'utf8'));

//console.log(JSON.stringify(doc, null, '  '));

var questions = [];
var flatAppList = [];

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
    flatAppList.push(app);
  }

  questions.push({
    type: doc.categories[category].multiple ? 'checkbox' : 'list',
    message: 'Choose ' + category + ' to install',
    name: category,
    choices: appChoises
  });
}

function flattenList (list) {
  var flatList = [];
  for (var key in list) {
    var content = list[key];
    if (typeof content == 'string' ) {
      flatList.push(content);
    } else {
      flatList = flatList.concat(flattenList(content));
    }
  }
  return flatList;
}

function createBrewfileBody (answers) {
  var body = [];
  var appDescriptions = flattenList(answers);

  for (var tap in doc.taps) {
    body.push("tap '" + doc.taps[tap] + "'");
  }

  for(var app in appDescriptions) {
    var match = flatAppList.find(function(entry){
      return entry.description == appDescriptions[app];
    });
    body.push(match.type + " '" + match.package + "'" + (match.type == "mas" ? ", id: " + match.id : ""));
  }
  return body.join('\n')
}

inquirer.prompt(questions).then(function (answers) {
  //console.log(JSON.stringify(answers, null, '  '));
  fs.writeFile('Brewfile', createBrewfileBody(answers), function(err) {
    if(err) {
        return console.log(err);
    }
    console.log('Brewfile was generated!');
  });
});
