url = "https://pstest-maxmore6.odoo.com"
db = "pstest-maxmore6"
username = "hr1@maxmore.asia"
password = "1234567"

require "xmlrpc/client"
# info = XMLRPC::Client.new2('https://demos.odoo.com').call('start')
# url, db, username, password = \
#     info['host'], info['database'], info['user'], info['password']

common = XMLRPC::Client.new2("#{url}/xmlrpc/2/common")
common.call('version')
{
    "server_version": "8.0",
    "server_version_info": [8, 0, 0, "final", 0],
    "server_serie": "8.0",
    "protocol_version": 1,
}

uid = common.call('authenticate', db, username, password, {})

models = XMLRPC::Client.new2("#{url}/xmlrpc/2/object").proxy
models.execute_kw(db, uid, password,
    'res.partner', 'check_access_rights',
    ['read'], {raise_exception: false})

models.execute_kw(db, uid, password,
    'res.partner', 'search',
    [[['is_company', '=', true], ['customer', '=', true]]])