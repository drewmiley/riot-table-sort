const webpack = require('webpack');

module.exports = {  
	cache: true,
	debug: true,
	devtool: 'source-map',
	entry: [
		'webpack-dev-server/client?http://localhost:8080',
		'webpack/hot/only-dev-server',
		'./src/main'
	],
	module: {
		preLoaders: [{
			test: /\.tag$/,
			exclude: /node_modules/,
			loader: 'riotjs',
			query: { type: 'none' }
		}],
		loaders: [{
			test: /\.js|tag$/,
			exclude: /node_modules/,
			loader: 'babel',
			query: {
				presets: ['es2015']
			}
		}]
	},
	output: {
		path: __dirname + '/dist',
		publicPath: '/',
		filename: 'bundle.js'
	},
	resolve: {
		extensions: ['', '.js', '.tag']
	},
	devServer: {
		contentBase: './dist',
		hot: true
	},
	plugins: [
		new webpack.HotModuleReplacementPlugin(),
		new webpack.ProvidePlugin({riot: 'riot'})
	]
};
