`vendor/bin/phpcs -p --colors --extensions=php --standard=WordPress ./src/filename.php`

# compatibility check for WP
`vendor/bin/phpcs -p --colors --standard=PHPCompatibilityWP --runtime-set testVersion 5.6- src/filename.php`

# Multiple standards at a time
`vendor/bin/phpcs -p --colors --standard=PHPCompatibilityWP,WordPress --runtime-set testVersion 5.6- src/filename.php`

# ERROR: the "WordPress" coding standard is not installed.
`phpcs --config-set installed_paths $HOME/.config/composer/vendor/wp-coding-standards/wpcs,$HOME/.config/composer/vendor/phpcompatibility/php-compatibility,$HOME/.config/composer/vendor/phpcompatibility/phpcompatibility-paragonie,$HOME/.config/composer/vendor/phpcompatibility/phpcompatibility-wp`

# Linting:
`/usr/bin/php7.2 -l src/bootstrap.php free/bootstrap.php src/traits/defender-bootstrap.php`

---
# PHPCBF
## Targeting only specific rules
- First list all sniffs for crossreference
  - `./vendor/bin/phpcs --standard=phpcs.ruleset.xml  -e`
- Choose valid sniffs which are need to be automatically rectified
  - `vendor/bin/phpcbf --standard=phpcs.ruleset.xml --sniffs="NeutronStandard.AssignAlign.DisallowAssignAlign,NeutronStandard.Arrays.DisallowLongformArray,Generic.WhiteSpace.ScopeIndent,Generic.WhiteSpace.DisallowSpaceIndent,WordPress.WP.I18n,Squiz.ControlStructures.ControlSignature,WordPress.WhiteSpace.ControlStructureSpacing,WordPress.Arrays.ArrayIndentation,PSR2.ControlStructures.ElseIfDeclaration,Squiz.WhiteSpace.SuperfluousWhitespace,PEAR.Functions.FunctionCallSignature" src/path/filename.php`
