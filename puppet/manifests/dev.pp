stage { 
    'prepare':
}
stage { 
    'prepareenv':
}
stage { 
    'tools':
}

Stage['prepare'] -> Stage['prepareenv'] -> Stage['tools'] ->  Stage['main']

class {
    'ubuntu':  stage => prepare;
    
    'dev':      stage => prepareenv;
    'mysql':    stage => tools;
    
    'php-cli': stage => main;
    'php-dev': stage => main;

    'apache':   stage => main;
    
    
}
apache::vhost { 'thack-berlin':
    site => 'thack-berlin',
    server_name => 'thack-berlin.vagrant.netanday.it',
    docroot => '/vagrant/web'
}

