class lampserver {
exec {'apt-update': 
command => '/usr/bom/apt-get update'
}

package {'apache2':
ensure => running,
}
package {'mysql-server':
require => Exec['apt-update'],
ensure => installed,
}

service { 'mysql':
ensure => running,
}

package {'php5':
require => Exec['apt-update'],
ensure => installed,
}

file {'/var/www/html/info.php':
ensure => file,
content => '<?php phpinfo();?>',
require => Package['apache2'],
}
}