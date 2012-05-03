class pound {


	$config_tpl = "pound.cfg.erb"

	package { 'pound':
		ensure => latest,
  }

	file { 'pound config':
		ensure => present,
		path => $operatingsystem ? {
			debian => '/etc/pound/pound.cfg',
			ubuntu => '/etc/pound/pound.cfg',
			redhat => '/etc/pound.cfg',
			centos => '/etc/pound.cfg',
		},
		owner => root,
		group => root,
		mode => 0644,
		content =>	template("${module_name}/${config_tpl}"),
    require => Package['pound'], 
	}
		
}
