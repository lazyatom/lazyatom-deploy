class lazyatom {
  class users {
    include freerange

    freerange::user {"james@lazyatom.com":
      user => "james",
      key => "AAAAB3NzaC1yc2EAAAABIwAAAQEA2hsOv1phLQ6OsNMSLWMoXmV2q4qcaOZy6EDsX7+89WX1BQ/iCRckdvwhCc+KTYbIcCZA91JFhXtVwQ3tKDrJbdSYwTg3Y2a4dakbK87H63s7z5oIuM1KWXHGRV4RQGwqIgxNqkEwRUdbYkZ+Ct8X2W7bLTBkLA3zhOT7etxyg8WXRjGUdP6rpnAoJzVbnrn36SDKkWs+6yp5aNDhU4929En/8logAgBD3ByMAg9f/ndbVNA34ZuLWp6LYo2lZDrNxuAE4caseht+ovBWGiq84MmIMpVMuF0HuNNSh24CA8cF2DB7r+vYcmjHBz4VY7u4wkXBsPIbOjVwXVls5F7Hnw=="
    }
  }

  define app($deploy_to, $domain=$name, $vhost_additions=nil) {
    include lazyatom::users
    include xml
    include rack

    rack::host { $name:
      content => template("lazyatom/vhost.erb"),
      ensure => enabled
    }
  }

  define db($environment, $password) {
    include lazyatom::users
    include freerange
    include mysql::server

    mysql::server::db { "$name_$environment":
      user => $name,
      password => $password
    }
  }
}