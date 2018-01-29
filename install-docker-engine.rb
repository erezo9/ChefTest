apt_package 'install-prerequesits' do
  package_name ['apt-transport-https','curl','software-properties-common']
  options ['--no-install-recommends']
end

apt_repository 'docker' do
  uri        'https://packages.docker.com/1.12/apt/repo'
  components ['main']
  distribution 'ubuntu-trusty'
  key 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e'
end

apt_package 'install-decker-engine' do
  package_name 'docker-engine'
end

execute 'Download Docker Image' do
  command 'docker run -d -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.1.2'
end
