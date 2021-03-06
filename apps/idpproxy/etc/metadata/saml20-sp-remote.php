<?php
/**
 * SAML 2.0 remote SP metadata for SimpleSAMLphp.
 *
 * See: https://simplesamlphp.org/docs/stable/simplesamlphp-reference-sp-remote
 */

/*
 * Example SimpleSAMLphp SAML 2.0 SP
 */
$metadata['https://gitlab.docker.local/'] = array(
	'AssertionConsumerService' => 'https://gitlab.docker.local/users/auth/saml/callback',
	'NameIDFormat' => 'urn:oasis:names:tc:SAML:2.0:nameid-format:transient',
	'authproc' => array(
		101 => array(
			'class' => 'authorize:Authorize',
			'regex' => FALSE,
			'eduPersonEntitlement' => ['users']
		),
		103 => array(
			'class' => 'saml:AttributeNameID',
			'attribute' => 'eduPersonPrincipalName',
			'Format' => 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress'
		),
	),
);

/*
 * This example shows an example config that works with Google Apps for education.
 * What is important is that you have an attribute in your IdP that maps to the local part of the email address
 * at Google Apps. In example, if your google account is foo.com, and you have a user that has an email john@foo.com, then you
 * must set the simplesaml.nameidattribute to be the name of an attribute that for this user has the value of 'john'.
 */
$metadata['google.com'] = array(
	'AssertionConsumerService' => 'https://www.google.com/a/g.feide.no/acs',
	'NameIDFormat' => 'urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress',
	'simplesaml.nameidattribute' => 'uid',
	'simplesaml.attributes' => FALSE,
);
