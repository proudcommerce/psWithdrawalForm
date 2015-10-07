[{capture append="oxidBlock_content"}]
    <h1 class="page-header">[{ oxmultilang ident="PSWDF_TITLE" }]</h1>

    [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
        [{ oxmultilang ident="PSWDF_MSG3" }] <a href="[{ $oContent->getLink() }]"><u>[{ oxmultilang ident="PSWDF_MSG4" }]</u></a>[{ oxmultilang ident="PSWDF_MSG5" }]
    [{/oxifcontent}]
    <br><br>

    [{if $oView->getDrawalFormSendStatus() }]
        [{assign var="_statusMessage" value="PSWDF_MSG_RECEIVED"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
        [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{ else }]
        [{assign var="editval" value=$oView->getUserData() }]
        [{oxscript include="js/widgets/oxinputvalidator.js" priority=10 }]
        [{oxscript add="$('form.js-oxValidate').oxInputValidator();"}]

        [{ oxmultilang ident="PSWDF_MSG1" }]
        <br><br>

        <b>[{ oxmultilang ident="PSWDF_MSG2" }]</b>

        <form class="js-oxValidate" action="[{ $oViewConf->getSslSelfLink() }]" method="post">
            <div>
                [{ $oViewConf->getHiddenSid() }]
                <input type="hidden" name="fnc" value="send"/>
                <input type="hidden" name="cl" value="pswithdrawalform"/>
                [{assign var="oCaptcha" value=$oView->getCaptcha() }]
                <input type="hidden" name="c_mach" value="[{$oCaptcha->getHash()}]"/>
                <input type="hidden" name="mailto" value="[{ $oxcmp_shop->oxshops__oxowneremail->value }]"/>
            </div>
            <p></p>
            <div class="col-sm-8 form clear">

                <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_ORDERNR" }]</label>
                    <input type="text" name="editval[pswdf_ordernr]" size="70" maxlength="40" value="[{$editval.pswdf_ordernr}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_ARTICLES" }]</label>
                    <input type="text" name="editval[pswdf_articles]" size="70" maxlength="40" value="[{$editval.pswdf_articles}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_ORDER" }]</label>
                    <input type="date" name="editval[pswdf_orderdate]" size="70" maxlength="40" value="[{$editval.pswdf_orderdate}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.oxuser__oxfname}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_RECEIVED" }]</label>
                    <input type="date" name="editval[pswdf_receiveddate]" size="70" maxlength="40" value="[{$editval.pswdf_receiveddate}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div>&nbsp;</div>
                <div class="form-group[{if $aErrors.pswdf_name}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_NAME" }]</label>
                    <input type="text" name="editval[pswdf_name]" size="70" maxlength="40" value="[{if $oxcmp_user && !$editval.pswdf_name}][{$oxcmp_user->oxuser__oxfname->value}][{else}][{$editval.oxuser__oxfname}][{/if}][{if $oxcmp_user && !$editval.oxuser__oxlname}] [{$oxcmp_user->oxuser__oxlname->value}][{else}] [{$editval.pswdf_name}][{/if}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.pswdf_address}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_ADDRESS" }]</label>
                    <input type="text" name="editval[pswdf_address]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_address}][{$oxcmp_user->oxuser__oxstreet->value}] [{$oxcmp_user->oxuser__oxstreetnr->value}], [{$oxcmp_user->oxuser__oxzip->value}] [{$oxcmp_user->oxuser__oxcity->value}][{else}][{$editval.pswdf_address}][{/if}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.pswdf_email}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_EMAIL" }]</label>
                    <input id="contactEmail" type="email" name="editval[pswdf_email]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_email}][{$oxcmp_user->oxuser__oxusername->value}][{else}][{$editval.pswdf_email}][{/if}]" class="form-control js-oxValidate js-oxValidate_notEmpty js-oxValidate_email">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        <span class="js-oxError_email">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL" }]</span>
                    </p>
                </div>
                <div class="form-group[{if $aErrors.pswdf_drawaldate}] oxInValid[{/if}]">
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_DRAWAL" }]</label>
                    <input type="date" name="editval[pswdf_drawaldate]" size="70" maxlength="40" value="[{$editval.pswdf_drawaldate}]" class="form-control js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
                    </p>
                </div>
                <div>&nbsp;</div>
                <div class="form-group">
                    <label class=""><b>[{ oxmultilang ident="PSWDF_TO" }]</b></label>
                    <span class="well well-sm">
                    [{ $oxcmp_shop->oxshops__oxcompany->value }], [{ if $oxcmp_shop->oxshops__oxfname->value }][{ $oxcmp_shop->oxshops__oxfname->value }] [{ $oxcmp_shop->oxshops__oxlname->value }], [{ /if }][{ $oxcmp_shop->oxshops__oxstreet->value }] [{ $oxcmp_shop->oxshops__oxstreetnr->value }], [{ $oxcmp_shop->oxshops__oxzip->value }] [{ $oxcmp_shop->oxshops__oxcity->value }]
                    </span>
                </div>
                <div>&nbsp;</div>
                <div class="verify">
                    <label class="req">[{ oxmultilang ident="VERIFICATION_CODE" suffix="COLON" }]</label>
                    [{assign var="oCaptcha" value=$oView->getCaptcha() }]
                    [{if $oCaptcha->isImageVisible()}]
                        <img src="[{$oCaptcha->getImageUrl()}]" alt="">
                    [{else}]
                        <span class="verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                    [{/if}]
                    <input type="text" data-fieldsize="verify" name="c_mac" value="" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty text-danger">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </div>
                <div>&nbsp;</div>
                <div>
                    <button class="btn btn-success submitButton largeButton" type="submit">[{ oxmultilang ident="PSWDF_SEND" }]</button>
                    <p>&nbsp;</p>
                </div>
            </div>
        </form>
    [{/if}]

    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
