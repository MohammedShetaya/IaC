const HelloModel = require('../models/helloModel')

class HelloRepo {
  constructor () {
    this.helloModel = new HelloModel()
  }

  getHelloMessage () {
    return this.helloModel.getMessage()
  }
}

module.exports = HelloRepo
