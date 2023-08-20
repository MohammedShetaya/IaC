const chai = require('chai');
const chaiHttp = require('chai-http');
const app = require('../app'); 
const expect = chai.expect;

chai.use(chaiHttp);

// this tests /hello api that returns a hello message and 200
describe('Hello API', () => {
    it('should return "Hello World!"', (done) => {
        chai
        .request(app)
        .get('/hello')
        .end((err, res) => {
            expect(res).to.have.status(200);
            expect(res.text).to.equal('Hello World!');
            done();
        });
    });

});
