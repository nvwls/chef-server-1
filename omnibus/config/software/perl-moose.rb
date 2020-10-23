#
# Copyright 2020 Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name "perl-moose"
default_version "2.2013"

dependency "perl"

version "2.2013" do
  source sha256: "df74dc78088921178edf72d827017d6c92737c986659f2dadc533ae24675e77c"
end

source url: "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Moose-#{version}.tar.gz"

relative_path "Moose-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path).merge(
    "INSTALL_BASE" => "#{install_dir}/embedded"
  )

  command "#{install_dir}/embedded/bin/perl Makefile.PL", env: env

  make env: env
  make "install", env: env
end
