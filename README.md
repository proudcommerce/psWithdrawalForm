psWithdrawalForm
=========

Form for handling returns (withdrawal) of orders.
Free Module for OXID eShop.


Features

	Shop frontend view for withdrawal form
	Sends email with all information to shop owner
	Sends confirmation email to customer
	 

Installation

	1. copy content from copy_this folder into your shop root
	2. activate module psWithdrawalForm in shop admin
	3. open form at yourshop.tld/?cl=psWithdrawalForm


SEO-URL

	If you would like to have an SEO-URL for this view, execute the following sql statement:
	INSERT INTO `oxseo` (`OXOBJECTID`, `OXIDENT`, `OXSHOPID`, `OXLANG`, `OXSTDURL`, `OXSEOURL`, `OXTYPE`, `OXFIXED`, `OXEXPIRED`, `OXPARAMS`, `OXTIMESTAMP`) VALUES
	('fa9d03b28fc249bb9740dbeb84fd7fcb', '0ae3efa3dbb98ab21c4bdfe641cd54ba', 'oxbaseshop', 0, 'index.php?cl=psWithdrawalForm', 'Widerrufsformular/', 'static', 0, 0, '', '2014-06-05 17:04:54');
	
	
Screenshot

![psWithdrawalForm](https://raw.github.com/proudcommerce/psWithdrawalForm/master/psWithdrawalForm_screen_frontend.png)
![psWithdrawalForm](https://raw.github.com/proudcommerce/psWithdrawalForm/master/psWithdrawalForm_screen_mail.png)


Changelog

	1.0.0 - Module release
	1.1.0 - Add email notification for customer
	1.1.1 - Fix email notification for customer
	1.1.2 - Fix translation special chars email body
	1.1.3 - Support for OXID 4.9
	
	
License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

Copyright

	Proud Sourcing GmbH 2014
	www.proudcommerce.com
