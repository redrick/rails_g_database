# Rails_g_database

Missing rails database generator (now supporting rails 4)
I have found many and many tutorials how to use more than one DB with Ruby on Rails
finally I found [THIS](https://gist.github.com/redrick/7335229) gist forked from [rafaelchiti](https://github.com/rafaelchiti) that I believe is the right one and works for me the best :)
I am still using multiple appplications with more databases, so I thought this would ease my pain :)

## Installation

Add this line to your application's Gemfile (this way you get the most recent one):

    gem 'rails_g_database'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_g_database

## Usage

For now it lacks comments, but is functional for me :) here is the way to use it:

    rails g database NAME adapter:adapter_name db:database_name login:username psswd:password host:host_name port:port_number

#### NAME

  name your database here (also applies on directory names and so on ...)


#### adapter

  for now it supports:

  * MySQL (as 'mysql')
  * PostgreSQL (as 'pg')
  * SQLite (as 'sqlite')

#### db

  you can change the name of your database othervise it falls back to the NAME of your db (in most cases leave blank :) )

#### login

  except sqlite, you can specify your DB credentials (this one stand for username)

#### psswd

  except sqlite, you can specify your DB credentials (this one stands for password)

#### host

  except sqlite, you can specify your DB credentials (this one stands for host, in most cases localhost)

#### port

  except sqlite, you can specify your DB credentials (this one stands for port, in case of postgresql 5432)

After generating all files we need, basically what you have to do is not to inherit from Activerecord::Base, but from newly created NAME::Base and there you go, you are working with another database :)

More info is on the way ...


## Thanks

To [rafaelchiti](https://github.com/rafaelchiti) for his [README](https://gist.github.com/rafaelchiti/5575309) that solved my problems

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/redrick/rails_g_database/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
