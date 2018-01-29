apt_package 'install-prerequesits' do
  package ['apt-transport-https','curl','software-properties-common']
  options ['--no-install-recommends']
end

apt_repository 'docker' do
  uri        'https://packages.docker.com/1.12/apt/repo'
  components ['main']
  distribution 'ubuntu-trusty'
  key 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e'
end

apt_package 'install-decker-engine' do
  package 'docker-engine'
end

execuite 'Download Docker Image' do
  command ' docker run -e ELASTIC_PASSWORD=MagicWord docker.elastic.co/elasticsearch/elasticsearch-platinum:6.1.2'
end
