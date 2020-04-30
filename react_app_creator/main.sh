#!/bin/bash

echo -e "\e[1;31m ** Creating app $1\e[0m"

create-react-app $1

# Get current working directoryj
dir=$PWD
fulldir=$dir/$1

echo -e "\e[1;31m ** Changing directory: $fulldir\e[0m"

cd $fulldir

# VSCode environment setup
echo -e '\e[1;31m - - Installing NPM Packages\e[0m'
npm i -D eslint prettier babel-eslint eslint-plugin-react eslint-plugin-import eslint-config-prettier eslint-config-airbnb eslint-plugin-prettier styled-components

echo -e '\e[1;31m ***** Styled Components installed.\e[0m'

echo -e '\e[1;31m - - Creating Files .eslintrc.js, prettier, jslint\e[0m'
cat > $fulldir/.eslintrc.js <<- EOM
module.exports = {
  env: {
    browser: true,
    es6: true,
  },
  parser: 'babel-eslint',
  extends: ['airbnb', 'prettier', 'prettier/react'],
  globals: {
    Atomics: 'readonly',
    SharedArrayBuffer: 'readonly',
  },
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
      modules: true,
    },
    ecmaVersion: 2018,
    sourceType: 'module',
  },
  plugins: ['react', 'prettier'],
  rules: {
    'prettier/prettier': 'error',
    'react/jsx-filename-extension': [1, { extensions: ['.js', '.jsx'] }],
    'react/forbid-prop-types': [0, { forbid: ['any'] }],
    'react/prop-types': 0,
  },
  env: {
    jest: true,
    browser: true,
    node: true,
  },
};
EOM
echo -e '\e[1;31m ***** .eslintrc.js file created.\e[0m'

cat > $fulldir/.prettierrc <<-EOM
{ 
  "printWidth": 100,
  "trailingComma": "all",
  "tabWidth": 2, 
  "semi": true, 
  "singleQuote": true
}
EOM
echo -e '\e[1;31m ***** .prettierrc file created.\e[0m'

cat > $fulldir/.jshintrc <<-EOM
{
  "esversion": 6
}
EOM
echo -e '\e[1;31m ***** .jshintrc file created.\e[0m'

# Remove all files from src folder and create new index.js & App.js
echo -e '\e[1;31m - - Deleting all files in src folder\e[0m'
rm $fulldir/src/*

echo -e '\e[1;31m - - Creating App.js & index.js in src folder\e[0m'

cat > $fulldir/src/App.js <<-EOM
import React from 'react';

function App() {
  return (
  );
}

export default App;
EOM
echo -e '\e[1;31m ***** App.js file created.\e[0m'

cat > $fulldir/src/index.js <<- EOM
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);
EOM
echo -e '\e[1;31m ***** index.js file created.\e[0m'
echo -e '\e[1;31m ********************************************\e[0m'
echo -e '\e[1;31m - - React App creator finished :) - - \e[0m'
echo -e '\e[1;31m ********************************************\e[0m'