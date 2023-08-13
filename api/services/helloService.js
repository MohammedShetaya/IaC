const HelloRepo = require('../repos/helloRepo')

class HelloService {
  constructor () {
    this.helloRepo = new HelloRepo()
  }

  getHelloMessage () {
    return this.helloRepo.getHelloMessage()
  }

  getTwoHelloMessages () {
    return this.helloRepo.getHelloMessage() + ' ' + this.helloRepo.getHelloMessage()
  }
}

module.exports = HelloService
