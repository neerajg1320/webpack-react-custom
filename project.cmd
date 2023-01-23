# https://www.educative.io/answers/how-to-create-a-react-application-with-webpack

npm init -y
npm i react react-dom

npm i -D @babel/core @babel/preset-env @babel/preset-react babel-loader
npm i -D css-loader html-webpack-plugin sass sass-loader style-loader
npm i -D url-loader webpack webpack-cli webpack-dev-server

# Create .babelrc file
touch .babelrc
# contents
{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}

# Create webpack.config.js file
touch webpack.config.js
# contents
const path = require("path");
const HtmlWebpackPlugin = require("html-webpack-plugin");

module.exports = {
  output: {
    path: path.join(__dirname, "/dist"), // the bundle output path
    filename: "bundle.js", // the name of the bundle
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: "src/index.html", // to import index.html file inside index.js
    }),
  ],
  devServer: {
    port: 3030, // you can change the port
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/, // .js and .jsx files
        exclude: /node_modules/, // excluding the node_modules folder
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.(sa|sc|c)ss$/, // styles files
        use: ["style-loader", "css-loader", "sass-loader"],
      },
      {
        test: /\.(png|woff|woff2|eot|ttf|svg)$/, // to import images and fonts
        loader: "url-loader",
        options: { limit: false },
      },
    ],
  },
};

# Create src folder
mkdir src

# Create following files in src
cd src
touch App.js App.scss index.html index.js

# Add the content in the files
Refer the link

# Create serve and build scripts
cd ..
vi package.json
