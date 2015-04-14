Pod::Spec.new do |s|
  s.name             = "UIAlertController-BetterConstructor"
  s.version          = "0.1.0"
  s.summary          = "A better constructor for UIAlertController."
  s.description      = <<-DESC
                       A category on UIAlertController which provdes a constructor that takes title strings and button blocks for arbitrary alerts and sheets.
                       DESC
  s.homepage         = "https://git.pixio.com/"
  s.license          = 'MIT'
  s.author           = { "Daniel Blakemore" => "DanBlakemore@gmail.com" }
  s.source = {
    :git => "git@git.pixio.com:ios-pods/uialertcontroller-betterconstructor.git",
    :tag => s.version.to_s
  }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
end
