const fs = require('fs');
const path = require('path');

const distribFile = path.join(__dirname, '../_Distrib/MSF_Map.sql');
let sql = fs.readFileSync(distribFile, 'utf8');

// The file currently has NO DELIMITER tags at all
// Split by `DROP FUNCTION IF EXISTS` or `CREATE FUNCTION` or `DROP PROCEDURE IF EXISTS` or `CREATE PROCEDURE`
// Actually, it's easier to just use the original repos files because we stripped them all natively.
// Let's restore the original repository so we have the DELIMITER lines back natively
