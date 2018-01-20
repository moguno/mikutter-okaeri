#coding: UTF-8

Plugin.create(:mikutter_okaeri) {
  # systemユーザのアイコンを@mikutter_botのに差し替える
  User.system.class.class_eval {
    def icon
      Enumerator.new{ |y|
        Plugin.filtering(:photo_filter, "http://dev.mikutter.hachune.net/projects/mikutter/repository/revisions/master/raw/core/skin/data/icon.png", y)
      }.map{|photo|
        Plugin.filtering(:miracle_icon_filter, photo)[0]
      }.first
    end
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
