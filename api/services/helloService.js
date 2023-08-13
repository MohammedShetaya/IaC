const HelloRepo = require('../repos/helloRepo')

class HelloService {
  constructor () {
    this.helloRepo = new HelloRepo()
  }

  getHelloMessage () {
    return this.helloRepo.getHelloMessage()
  }

}

module.exports = HelloService
