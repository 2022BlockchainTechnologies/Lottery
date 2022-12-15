const Hello = artifacts.require("lottery");

module.exports = function (deployer) {
    deployer.deploy(Hello);
}