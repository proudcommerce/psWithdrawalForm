[{capture append="oxidBlock_content"}]
    <h1 class="pageHead">[{ oxmultilang ident="PSWDF_TITLE" }]</h1>
<div class="">
    [{oxifcontent ident="oxrightofwithdrawal" object="oContent"}]
    [{ oxmultilang ident="PSWDF_MSG3" }] <a href="[{ $oContent->getLink() }]"><u>[{ oxmultilang ident="PSWDF_MSG4" }]</u></a>[{ oxmultilang ident="PSWDF_MSG5" }]
    [{/oxifcontent}]
<br><br>

    [{if $oView->getDrawalFormSendStatus() }]
    [{assign var="_statusMessage" value="PSWDF_MSG_RECEIVED"|oxmultilangassign:$oxcmp_shop->oxshops__oxname->value}]
    [{include file="message/notice.tpl" statusMessage=$_statusMessage}]
    [{ else }]
    [{oxscript include="js/libs/jqBootstrapValidation.min.js" priority=10}]
    [{oxscript add="$('input,select,textarea').not('[type=submit]').jqBootstrapValidation();"}]

    [{assign var="editval" value=$oView->getUserData()}]
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
        <div class="form-group[{if $aErrors.oxuser__oxfname}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_ORDERNR" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_ordernr]" size="70" maxlength="40" value="[{$editval.pswdf_ordernr}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.oxuser__oxfname}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_DATE_ARTICLES" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_articles]" size="70" maxlength="40" value="[{$editval.pswdf_articles}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.oxuser__oxfname}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_DATE_ORDER" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_orderdate]" size="70" maxlength="40" value="[{$editval.pswdf_orderdate}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.oxuser__oxfname}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_DATE_RECEIVED" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_receiveddate]" size="70" maxlength="40" value="[{$editval.pswdf_receiveddate}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.pswdf_name}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_NAME" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_name]" size="70" maxlength="40" value="[{if $oxcmp_user && !$editval.pswdf_name}][{$oxcmp_user->oxuser__oxfname->value}][{else}][{$editval.oxuser__oxfname}][{/if}][{if $oxcmp_user && !$editval.oxuser__oxlname}] [{$oxcmp_user->oxuser__oxlname->value}][{else}] [{$editval.pswdf_name}][{/if}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.pswdf_address}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_ADDRESS" }]</label>
            <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_address]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_address}][{$oxcmp_user->oxuser__oxstreet->value}] [{$oxcmp_user->oxuser__oxstreetnr->value}], [{$oxcmp_user->oxuser__oxzip->value}] [{$oxcmp_user->oxuser__oxcity->value}][{else}][{$editval.pswdf_address}][{/if}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.pswdf_email}]oxInValid"[{/if}]">
            <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_EMAIL" }]</label>
            <div class="col-lg-10 controls">
                <input id="contactEmail" type="text" name="editval[pswdf_email]"  size=70 maxlength=40 value="[{if $oxcmp_user && !$editval.pswdf_email}][{$oxcmp_user->oxuser__oxusername->value}][{else}][{$editval.pswdf_email}][{/if}]" class="form-control" required="required">
            </div>
        </div>
        <div class="form-group[{if $aErrors.pswdf_drawaldate}]oxInValid"[{/if}]">
        <label class="control-label col-lg-2 req">[{ oxmultilang ident="PSWDF_DATE_DRAWAL" }]</label>
        <div class="col-lg-10 controls">
                <input type="text" name="editval[pswdf_drawaldate]" size="70" maxlength="40" value="[{$editval.pswdf_drawaldate}]" class="form-control" required="required">
        </div>
        </div>
        <div class="form-group">
        <label class="control-label col-lg-2">[{ oxmultilang ident="PSWDF_TO" }]</label>
        <div class="col-lg-10 controls">
            <adress>[{ $oxcmp_shop->oxshops__oxcompany->value }],<br> [{ if $oxcmp_shop->oxshops__oxfname->value }][{ $oxcmp_shop->oxshops__oxfname->value }] [{ $oxcmp_shop->oxshops__oxlname->value }],<br> [{ /if }][{ $oxcmp_shop->oxshops__oxstreet->value }] [{ $oxcmp_shop->oxshops__oxstreetnr->value }],<br> [{ $oxcmp_shop->oxshops__oxzip->value }] [{ $oxcmp_shop->oxshops__oxcity->value }]<br></adress>
            <p> </p>
        </div>
        </div>
        <div class="form-group verify">
            <label class="control-label col-lg-2 req ">[{oxmultilang ident="VERIFICATION_CODE"}]</label>
            <div class="col-lg-10 controls">
                [{assign var="oCaptcha" value=$oView->getCaptcha()}]
                <div class="input-group">
                    [{if $oCaptcha->isImageVisible()}]
                    <span class="input-group-addon">
                        <img src="[{$oCaptcha->getImageUrl()}]" alt="">
                    </span>
                    [{else}]
                    <span class="input-group-addon verificationCode" id="verifyTextCode">[{$oCaptcha->getText()}]</span>
                    [{/if}]
                    <input type="text" name="c_mac" value="" class="form-control" required="required">
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-lg-offset-2 col-lg-10">
                <p class="alert alert-info">[{oxmultilang ident="COMPLETE_MARKED_FIELDS"}]</p>
                <button class="btn btn-primary" type="submit">
                    <i class="fa fa-envelope"></i> [{oxmultilang ident="SEND"}]
                </button>
            </div>
        </div>

    </form>
    [{/if}]
    </div>

    [{ insert name="oxid_tracker" title=$template_title }]
    [{/capture}]

[{include file="layout/page.tpl" sidebar="Left"}]
