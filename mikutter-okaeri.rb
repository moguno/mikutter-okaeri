#coding: UTF-8

Plugin.create(:mikutter_okaeri) {
  # systemユーザのアイコンを@mikutter_botのに差し替える
  User.system.instance_eval {
    self[:profile_image_url] = "http://dev.mikutter.hachune.net/projects/mikutter/repository/revisions/master/raw/core/skin/data/icon.png"
  }

  # 感動の再会
  Delayer.new {
    defachievement(:okaeri_mikutter_chan,
                   description: "Debian派生版mikutterにみくったーちゃんが帰ってきた",
                   hidden: true) { |achievement|
      activity :system, "てへ、驚いた？帰ってきちゃった。\n\nただいまマスター！"
      achievement.take!
    }
  }
}
