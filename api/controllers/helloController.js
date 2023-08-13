const HelloService = require('../services/helloService')

class HelloController {
  constructor () {
    this.helloService = new HelloService()
  }

  getHello (req, res) {
    const message = this.helloService.getHelloMessage()
    res.send(message)
  }
}

module.exports = HelloController
