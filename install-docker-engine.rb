apt_repository 'docker' do
  uri        'https://packages.docker.com/1.12/apt/repo'
  components ['main']
  distribution 'ubuntu-trusty'
  key 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e'
end
