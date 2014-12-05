<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.1';

/**
 * Module information
 */
$aModule = array(
    'id'           => 'psWithdrawalForm',
    'title'        => 'psWithdrawalForm',
    'description'  => array(
        'de' => 'Formular zum Handling von R&uuml;cksendungen (Widerruf) von Bestellungen.',
        'en' => 'Form for handling returns (withdrawal) of orders.'
    ),
    'thumbnail'    => 'logo-ps.jpg',
    'version'      => '1.1.3',
    'author'       => 'Proud Sourcing GmbH',
    'url'          => 'http://www.proudcommerce.com/',
    'email'        => 'support@proudcommerce.com',
    'extend'       => array(
    ),
    'files' => array(
        'pswithdrawalform'      => 'proudsourcing/psWithdrawalForm/application/controllers/pswithdrawalform.php',
    ),
    'templates' => array(
        'pswithdrawalform.tpl'  => 'proudsourcing/psWithdrawalForm/application/views/azure/tpl/page/info/pswithdrawalform.tpl',
    ),
    'blocks' => array(

    ),
    'settings' => array(
    ),
);
