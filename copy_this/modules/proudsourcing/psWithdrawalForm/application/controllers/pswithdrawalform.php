<?php
/**
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * @copyright (c) Proud Sourcing GmbH | 2014
 * @link www.proudcommerce.com
 * @package psWithdrawalForm
 * @version 1.1.0
 **/
class psWithdrawalForm extends oxUBase
{
    /**
     * Entered user data.
     * @var array
     */
    protected $_aUserData = null;

    /**
     * Class handling CAPTCHA image.
     * @var object
     */
    protected $_oCaptcha = null;

    /**
     * Drawal from email send status.
     * @var object
     */
    protected $_blDrawalFormSendStatus = null;

    /**
     * Current class template name.
     * @var string
     */
    protected $_sThisTemplate = 'pswithdrawalform.tpl';

    /**
     * Current view search engine indexing state
     *
     * @var int
     */
    protected $_iViewIndexState = VIEW_INDEXSTATE_NOINDEXNOFOLLOW;

    /**
     * Composes and sends drawal form, returns false if some parameters are missing
     *
     * @return bool
     */
    public function send()
    {
        $aParams = oxConfig::getParameter( 'editval' );

        // checking email address
        if ( !oxRegistry::getUtils()->isValidEmail( $aParams['pswdf_email'] ) )
        {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( 'ERROR_MESSAGE_INPUT_NOVALIDEMAIL' );
            return false;
        }

        // spam spider prevension
        $sMac     = oxConfig::getParameter( 'c_mac' );
        $sMacHash = oxConfig::getParameter( 'c_mach' );
        $oCaptcha = $this->getCaptcha();

        if ( !$oCaptcha->pass( $sMac, $sMacHash ) )
        {
            // even if there is no exception, use this as a default display method
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( 'MESSAGE_WRONG_VERIFICATION_CODE' );
            return false;
        }

        $sSubject = oxConfig::getParameter( 'c_subject' );
        if ( !$aParams['pswdf_ordernr'] || !$aParams['pswdf_articles'] || !$aParams['pswdf_orderdate'] || !$aParams['pswdf_receiveddate'] || !$aParams['pswdf_name'] || !$aParams['pswdf_address'] || !$aParams['pswdf_email'] || !$aParams['pswdf_drawaldate'])
        {
            // even if there is no exception, use this as a default display method
            oxRegistry::get("oxUtilsView")->addErrorToDisplay( 'ERROR_MESSAGE_INPUT_NOTALLFIELDS' );
            return false;
        }

        $oLang = oxRegistry::getLang();
        $sMessage  = $oLang->translateString( 'PSWDF_MSG2' ) . "<br><br>" .
                     $oLang->translateString( 'PSWDF_ORDERNR' )." ".$aParams['pswdf_ordernr'] . "<br>" .
                     $oLang->translateString( 'PSWDF_DATE_ARTICLES' )." ".$aParams['pswdf_articles'] . "<br>" .
                     $oLang->translateString( 'PSWDF_DATE_ORDER' )." ".$aParams['pswdf_orderdate'] . "<br>" .
                     $oLang->translateString( 'PSWDF_DATE_RECEIVED' )." ".$aParams['pswdf_receiveddate'] . "<br><br>" .
                     $oLang->translateString( 'PSWDF_NAME' )." ".$aParams['pswdf_name'] . "<br>" .
                     $oLang->translateString( 'PSWDF_ADDRESS' )." ".$aParams['pswdf_address'] . "<br>" .
                     $oLang->translateString( 'PSWDF_EMAIL' )." ".$aParams['pswdf_email'] . "<br>" .
                     $oLang->translateString( 'PSWDF_DATE_DRAWAL' )." ".$aParams['pswdf_drawaldate'];

        $oEmail = oxNew( 'oxemail' );
        $blSendToOwner = $oEmail->sendContactMail( $aParams['mailto'], $oLang->translateString( 'PSWDF_SUBJECT' )." ".$aParams['pswdf_name']." (#".$aParams['pswdf_ordernr'].")", $sMessage );
        $oEmail = oxNew( 'oxemail' );
        $blSendToCustomer = $oEmail->sendContactMail( $aParams['pswdf_email'], $oLang->translateString( 'PSWDF_SUBJECT_CUSTOMER' )." ".$aParams['pswdf_name']." (#".$aParams['pswdf_ordernr'].")", $sMessage );
        
        if ( $blSendToOwner &&  $blSendToCustomer )
        {
            $this->_blDrawalFormSendStatus = 1;
        }
        else
        {
            oxRegistry::get("oxUtilsView")->addErrorToDisplay('ERROR_MESSAGE_CHECK_EMAIL');
        }
    }

    /**
     * Template variable getter. Returns entered user data
     *
     * @return object
     */
    public function getUserData()
    {
        if ( $this->_oUserData === null )
        {
            $this->_oUserData = oxConfig::getParameter( 'editval' );
        }
        return $this->_oUserData;
    }

    /**
     * Template variable getter. Returns object of handling CAPTCHA image
     *
     * @return object
     */
    public function getCaptcha()
    {
        if ( $this->_oCaptcha === null )
        {
            $this->_oCaptcha = oxNew('oxCaptcha');
        }
        return $this->_oCaptcha;
    }

    /**
     * Template variable getter. Returns status if email was send succesfull
     *
     * @return object
     */
    public function getDrawalFormSendStatus()
    {
        return $this->_blDrawalFormSendStatus;
    }

    /**
     * Returns Bread Crumb - you are here page1/page2/page3...
     *
     * @return array
     */
    public function getBreadCrumb()
    {
        $aPaths = array();
        $aPath = array();

        $aPath['title'] = oxRegistry::getLang()->translateString( 'PSWDF_TITLE', oxRegistry::getLang()->getBaseLanguage(), false );
        $aPath['link']  = $this->getLink();
        $aPaths[] = $aPath;

        return $aPaths;
    }
}
