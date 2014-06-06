[{capture append="oxidBlock_content"}]
    <h1 class="pageHead">[{ oxmultilang ident="PSWDF_TITLE" }]</h1>

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
            <ul class="form clear">
                <li>&nbsp;</li>
                <li [{if $aErrors.oxuser__oxfname}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_ORDERNR" }]</label>
                    <input type="text" name="editval[pswdf_ordernr]" size="70" maxlength="40" value="[{$editval.pswdf_ordernr}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.oxuser__oxfname}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_ARTICLES" }]</label>
                    <input type="text" name="editval[pswdf_articles]" size="70" maxlength="40" value="[{$editval.pswdf_articles}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.oxuser__oxfname}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_ORDER" }]</label>
                    <input type="text" name="editval[pswdf_orderdate]" size="70" maxlength="40" value="[{$editval.pswdf_orderdate}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.oxuser__oxfname}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_RECEIVED" }]</label>
                    <input type="text" name="editval[pswdf_receiveddate]" size="70" maxlength="40" value="[{$editval.pswdf_receiveddate}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li>&nbsp;</li>
                <li [{if $aErrors.pswdf_name}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_NAME" }]</label>
                    <input type="text" name="editval[pswdf_name]" size="70" maxlength="40" value="[{if $oxcmp_user && !$editval.pswdf_name}][{$oxcmp_user->oxuser__oxfname->value}][{else}][{$editval.oxuser__oxfname}][{/if}][{if $oxcmp_user && !$editval.oxuser__oxlname}] [{$oxcmp_user->oxuser__oxlname->value}][{else}] [{$editval.pswdf_name}][{/if}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.pswdf_address}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_ADDRESS" }]</label>
                    <input type="text" name="editval[pswdf_address]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_address}][{$oxcmp_user->oxuser__oxstreet->value}] [{$oxcmp_user->oxuser__oxstreetnr->value}], [{$oxcmp_user->oxuser__oxzip->value}] [{$oxcmp_user->oxuser__oxcity->value}][{else}][{$editval.pswdf_address}][{/if}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.pswdf_email}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_EMAIL" }]</label>
                    <input id="contactEmail" type="text" name="editval[pswdf_email]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_email}][{$oxcmp_user->oxuser__oxusername->value}][{else}][{$editval.pswdf_email}][{/if}]" class="js-oxValidate js-oxValidate_notEmpty js-oxValidate_email">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        <span class="js-oxError_email">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOVALIDEMAIL" }]</span>
                    </p>
                </li>
                <li [{if $aErrors.pswdf_drawaldate}]class="oxInValid"[{/if}]>
                    <label class="req">[{ oxmultilang ident="PSWDF_DATE_DRAWAL" }]</label>
                    <input type="text" name="editval[pswdf_drawaldate]" size="70" maxlength="40" value="[{$editval.pswdf_drawaldate}]" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                        [{include file="message/inputvalidation.tpl" aErrors=$aErrors.oxuser__oxfname}]
                    </p>
                </li>
                <li>&nbsp;</li>
                <li>
                    <label class=""><b>[{ oxmultilang ident="PSWDF_TO" }]</b></label>
                    [{ $oxcmp_shop->oxshops__oxcompany->value }], [{ if $oxcmp_shop->oxshops__oxfname->value }][{ $oxcmp_shop->oxshops__oxfname->value }] [{ $oxcmp_shop->oxshops__oxlname->value }], [{ /if }][{ $oxcmp_shop->oxshops__oxstreet->value }] [{ $oxcmp_shop->oxshops__oxstreetnr->value }], [{ $oxcmp_shop->oxshops__oxzip->value }] [{ $oxcmp_shop->oxshops__oxcity->value }]
                </li>
                <li>&nbsp;</li>
                <li class="verify">
                    <label class="req">[{ oxmultilang ident="VERIFICATION_CODE" suffix="COLON" }]</label>
                    [{assign var="oCaptcha" value=$oView->getCaptcha() }]
                    [{if $oCaptcha->isImageVisible()}]
                        <img src="[{$oCaptcha->getImageUrl()}]" alt="">
                    [{else}]
                        <span class="verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                    [{/if}]
                    <input type="text" data-fieldsize="verify" name="c_mac" value="" class="js-oxValidate js-oxValidate_notEmpty">
                    <p class="oxValidateError">
                        <span class="js-oxError_notEmpty">[{ oxmultilang ident="ERROR_MESSAGE_INPUT_NOTALLFIELDS" }]</span>
                    </p>
                </li>
                <li>&nbsp;</li>
                <li>
                    <button class="submitButton largeButton" type="submit">[{ oxmultilang ident="PSWDF_SEND" }]</button>
                </li>
            </ul>
        </form>
    [{/if}]
    <p>&nbsp;</p>

    [{ insert name="oxid_tracker" title=$template_title }]
[{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
