#!/usr/bin/env node

unittest = require("./test-unittest");

const bytecodeFilename = "match-int.bytecode";
const abiFilename = "match-int.abi";

const testFunctions = [{name: "f", args: [], expectSuccess: true}];

unittest.deploy(bytecodeFilename, abiFilename, testFunctions);
