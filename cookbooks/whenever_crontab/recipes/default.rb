node[:applications].each do |app,data|

execute "run whenever script" do
    user node[:owner_name]
    group node[:owner_name]
    command("if [ -e /data/#{app}/current/config/schedule.rb ] ; " +
            "then cd /data/#{app}/current && " +
            "whenever --update-crontab '#{app}' --set environment=production; " +
            "fi")
    action :run
  end

end
