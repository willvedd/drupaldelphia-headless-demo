<?php
$databases['default']['default'] = array (
  'database' => 'd8_headless_demo',
  'username' => 'root',
  'password' => '',
  'prefix' => '',
  'host' => '127.0.0.1',
  'port' => '3306',
  'namespace' => 'Drupal\\Core\\Database\\Driver\\mysql',
  'driver' => 'mysql',
);
$settings['hash_salt'] = '7h5YzjklItkwCRL5g2cPElX7UNlqejjDAlYvfCKs0da8XIavjUnaXxiP9bOHLodbbCk2mNqlSQ';
$settings['install_profile'] = 'standard';
$config_directories['sync'] = 'sites/default/files/config_yhm6J0tqNTFKxRIAqm_vfZG6oHbD7hPR8ADNb4-zR_2YZ2CxjvXeV2859yWIIBquwozmN29m2A/sync';

 if (file_exists(__DIR__ . '/settings.local.php')) {
   include __DIR__ . '/settings.local.php';
 }