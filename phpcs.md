`vendor/bin/phpcs -p --colors --extensions=php --standard=WordPress ./src/filename.php`

# compatibility check for WP
`vendor/bin/phpcs -p --colors --standard=PHPCompatibilityWP --runtime-set testVersion 5.6- src/filename.php`

# Multiple standards at a time
`vendor/bin/phpcs -p --colors --standard=PHPCompatibilityWP,WordPress --runtime-set testVersion 5.6- src/filename.php`

# ERROR: the "WordPress" coding standard is not installed.
`phpcs --config-set installed_paths $HOME/.config/composer/vendor/wp-coding-standards/wpcs,$HOME/.config/composer/vendor/phpcompatibility/php-compatibility,$HOME/.config/composer/vendor/phpcompatibility/phpcompatibility-paragonie,$HOME/.config/composer/vendor/phpcompatibility/phpcompatibility-wp`

# Linting:
`/usr/bin/php7.2 -l src/bootstrap.php free/bootstrap.php src/traits/defender-bootstrap.php`
