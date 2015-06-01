task :localtest do
  sh 'rubocop'
  sh 'foodcritic -t ~FC003 -t ~FC034 .'
  sh 'rspec --color -f d'
end
