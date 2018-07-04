require "jsonrpc-client"

url = "https://pstest-maxmore6.odoo.com"
db = "pstest-maxmore6"
username = "hr1@maxmore.asia"
password = "1234567"

common = JSONRPC::Client.new('https://pstest-maxmore6.odoo.com/jsonrpc')

uid = common.call(service="common", method="login", args=[db, username, password])

# models = XMLRPC::Client.new2("#{url}/xmlrpc/2/object").proxy
# models.execute_kw(db, uid, password,
#     'res.partner', 'check_access_rights',
#     ['read'], {raise_exception: false})