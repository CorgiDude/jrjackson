require 'benchmark'
require 'json'
require 'jr_jackson'

def benchmark(label, hash)
  json = JrJackson.json.generate(hash)
  bson = JrJackson.smile.generate(hash)

  run = 6000

  puts "Benchmark for #{label} (#{run} iterations)"
  puts "==========================================\n\n"

  Benchmark.bmbm("jackson generate: plus some margin".size) do |x|
    x.report("jackson generate:") do
      run.times { JrJackson.json.generate(hash)  }
    end

    x.report("smile generate:") do
      run.times { JrJackson.smile.generate(hash)  }
    end

    x.report("ruby fast generate:") do
      run.times { JSON.fast_generate(hash) }
    end

    x.report("ruby generate:") do
      run.times { JSON.generate(hash) }
    end

    x.report("jackson parse:") do
      run.times { JrJackson.json.parse(json) }
    end

    x.report("jackson parse (rubyify):") do
      jackson = JrJackson::Json.new(:rubyify)
      run.times { jackson.parse(json) }
    end

    x.report("jackson parse (symbolize):") do
      jackson = JrJackson::Json.new(:symbolize)
      run.times { jackson.parse(json) }
    end

    x.report("smile parse:") do
      run.times { JrJackson.smile.parse(bson)  }
    end

    x.report("ruby parse:") do
      run.times { JSON.parse(json) }
    end
  end
end

small_hash = {"type"=>"configure", "job"=>{"id"=>1271419, "commit"=>"7de9976b5189a87078adc21659d06550d8c0d023", "branch"=>"master", "config_url"=>"https://raw.github.com/rubytij/usergroup/7de9976b5189a87078adc21659d06550d8c0d023/.travis.yml"}, "repository"=>{"id"=>13970, "slug"=>"rubytij/usergroup"}, "queue"=>"builds.configure"}
big_hash   = {"type"=>"pull_request", "credentials"=>{"login"=>"technoweenie", "token"=>"lahglahgldahglahgla"}, "request"=>"{\"number\":315,\"repository\":{\"name\":\"gollum\",\"size\":272,\"has_wiki\":false,\"created_at\":\"2010-03-29T18:30:53Z\",\"clone_url\":\"https://github.com/github/gollum.git\",\"private\":false,\"watchers\":2001,\"updated_at\":\"2012-05-07T20:29:22Z\",\"git_url\":\"git://github.com/github/gollum.git\",\"ssh_url\":\"git@github.com:github/gollum.git\",\"fork\":false,\"url\":\"https://api.github.com/repos/github/gollum\",\"language\":\"Ruby\",\"id\":585285,\"pushed_at\":\"2012-05-07T20:29:22Z\",\"svn_url\":\"https://github.com/github/gollum\",\"open_issues\":36,\"has_downloads\":true,\"mirror_url\":null,\"has_issues\":true,\"homepage\":\"\",\"description\":\"A simple, Git-powered wiki with a sweet API and local frontend.\",\"forks\":281,\"html_url\":\"https://github.com/github/gollum\",\"owner\":{\"avatar_url\":\"https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png\",\"gravatar_id\":\"61024896f291303615bcd4f7a0dcfb74\",\"url\":\"https://api.github.com/users/github\",\"id\":9919,\"login\":\"github\"}},\"pull_request\":{\"head\":{\"repo\":{\"master_branch\":\"livepreview\",\"name\":\"gollum\",\"created_at\":\"2012-05-02T18:04:40Z\",\"has_wiki\":false,\"size\":136,\"clone_url\":\"https://github.com/bootstraponline/gollum.git\",\"watchers\":1,\"updated_at\":\"2012-05-07T20:26:58Z\",\"private\":false,\"url\":\"https://api.github.com/repos/bootstraponline/gollum\",\"language\":\"JavaScript\",\"fork\":true,\"ssh_url\":\"git@github.com:bootstraponline/gollum.git\",\"git_url\":\"git://github.com/bootstraponline/gollum.git\",\"pushed_at\":\"2012-05-07T20:26:58Z\",\"svn_url\":\"https://github.com/bootstraponline/gollum\",\"id\":4205940,\"mirror_url\":null,\"open_issues\":0,\"has_downloads\":true,\"homepage\":\"\",\"has_issues\":false,\"forks\":0,\"description\":\"A simple, Git-powered wiki with a sweet API and local frontend.\",\"html_url\":\"https://github.com/bootstraponline/gollum\",\"owner\":{\"gravatar_id\":\"561bbf9efca77cffa73af63ee20a92f4\",\"avatar_url\":\"https://secure.gravatar.com/avatar/561bbf9efca77cffa73af63ee20a92f4?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png\",\"url\":\"https://api.github.com/users/bootstraponline\",\"id\":1173057,\"login\":\"bootstraponline\"}},\"label\":\"bootstraponline:gollum2\",\"sha\":\"7fa6708483ef2bcfe3cfda9aa17e5943fad9b7bb\",\"ref\":\"gollum2\",\"user\":{\"gravatar_id\":\"561bbf9efca77cffa73af63ee20a92f4\",\"avatar_url\":\"https://secure.gravatar.com/avatar/561bbf9efca77cffa73af63ee20a92f4?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png\",\"url\":\"https://api.github.com/users/bootstraponline\",\"id\":1173057,\"login\":\"bootstraponline\"}},\"number\":315,\"issue_url\":\"https://github.com/github/gollum/issues/315\",\"created_at\":\"2012-05-05T19:54:33Z\",\"merged\":false,\"merged_by\":null,\"changed_files\":16,\"body\":\"Adds support for headers.\",\"title\":\"Header\",\"comments\":5,\"additions\":66,\"updated_at\":\"2012-05-07T21:00:21Z\",\"diff_url\":\"https://github.com/github/gollum/pull/315.diff\",\"url\":\"https://api.github.com/repos/github/gollum/pulls/315\",\"_links\":{\"html\":{\"href\":\"https://github.com/github/gollum/pull/315\"},\"self\":{\"href\":\"https://api.github.com/repos/github/gollum/pulls/315\"},\"comments\":{\"href\":\"https://api.github.com/repos/github/gollum/issues/315/comments\"},\"issue\":{\"href\":\"https://api.github.com/repos/github/gollum/issues/315\"},\"review_comments\":{\"href\":\"https://api.github.com/repos/github/gollum/pulls/315/comments\"}},\"id\":1294595,\"patch_url\":\"https://github.com/github/gollum/pull/315.patch\",\"mergeable\":null,\"merged_at\":null,\"closed_at\":null,\"commits\":3,\"user\":{\"gravatar_id\":\"561bbf9efca77cffa73af63ee20a92f4\",\"avatar_url\":\"https://secure.gravatar.com/avatar/561bbf9efca77cffa73af63ee20a92f4?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png\",\"url\":\"https://api.github.com/users/bootstraponline\",\"id\":1173057,\"login\":\"bootstraponline\"},\"deletions\":7,\"html_url\":\"https://github.com/github/gollum/pull/315\",\"review_comments\":0,\"base\":{\"repo\":{\"name\":\"gollum\",\"created_at\":\"2010-03-29T18:30:53Z\",\"has_wiki\":false,\"size\":272,\"clone_url\":\"https://github.com/github/gollum.git\",\"watchers\":2001,\"updated_at\":\"2012-05-07T20:29:22Z\",\"private\":false,\"url\":\"https://api.github.com/repos/github/gollum\",\"language\":\"Ruby\",\"fork\":false,\"ssh_url\":\"git@github.com:github/gollum.git\",\"git_url\":\"git://github.com/github/gollum.git\",\"pushed_at\":\"2012-05-07T20:29:22Z\",\"svn_url\":\"https://github.com/github/gollum\",\"id\":585285,\"mirror_url\":null,\"open_issues\":36,\"has_downloads\":true,\"homepage\":\"\",\"has_issues\":true,\"forks\":281,\"description\":\"A simple, Git-powered wiki with a sweet API and local frontend.\",\"html_url\":\"https://github.com/github/gollum\",\"owner\":{\"gravatar_id\":\"61024896f291303615bcd4f7a0dcfb74\",\"avatar_url\":\"https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png\",\"url\":\"https://api.github.com/users/github\",\"id\":9919,\"login\":\"github\"}},\"label\":\"github:master\",\"sha\":\"9a1dddaccfd49b855b91cd89151c5c70bd423b70\",\"ref\":\"master\",\"user\":{\"gravatar_id\":\"61024896f291303615bcd4f7a0dcfb74\",\"avatar_url\":\"https://secure.gravatar.com/avatar/61024896f291303615bcd4f7a0dcfb74?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-orgs.png\",\"url\":\"https://api.github.com/users/github\",\"id\":9919,\"login\":\"github\"}},\"state\":\"open\"},\"sender\":{\"avatar_url\":\"https://secure.gravatar.com/avatar/a86224d72ce21cd9f5bee6784d4b06c7?d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-140.png\",\"gravatar_id\":\"a86224d72ce21cd9f5bee6784d4b06c7\",\"url\":\"https://api.github.com/users/atmos\",\"id\":38,\"login\":\"atmos\"},\"action\":\"reopened\"}"}

benchmark("small hash", small_hash)
puts "\n\n\n\n"
benchmark("big hash", big_hash)
