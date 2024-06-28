\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "小草"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  property-defaults.fonts.serif = "{Source Han Serif SC"
  property-defaults.fonts.sans = "{Source Han Sans SC"
  property-defaults.fonts.typewriter = "DejaVu Sans Mono"
  #(set-paper-size "a5")
  %top-margin = 20
  %bottom-margin = 20
  %left-margin = 20
  %right-margin = 20
}

sk = \skip 4

\layout {
  indent = 0.0
}

text = \lyricmode  {
没有 花 香 \sk 没有 树 高 \sk
我是 一棵 无人 知道的 小 \sk 草 \sk
从不 寂 寞 \sk 从不 烦 恼 \sk
你看 我的 伙伴 遍及 天涯 海 角 \sk
春风 啊 春风 你 把我 吹 绿 \sk
阳光 啊 阳光 你 把我 照 耀 \sk
河流 啊 山川 你 哺 育了 我 \sk
大地 啊 母亲 把 我紧 紧拥 抱 \sk
大地 啊 母亲 把 我紧 紧拥 抱
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c' {
a8 a8 c'8 b8 a2 | %{ bar 2: %} a8 a8 e'8 d'8 e'2 | %{ bar 3: %} e'8 e'8 g'8 e'8 d'8 d'8 c'8 b8 | %{ bar 4: %} a4. g8 e2 | %{ bar 5: %} a8 a8 c'8 b8 a2 | %{ bar 6: %} a8 a8 e'8 d'8 e'2 | %{ bar 7: %} e'8 e'8 g'8 e'8 d'8 d'8 c'8 b8 | %{ bar 8: %} a4. g8 a2 | %{ bar 9: %} b'8 a'4 e'8 b'8 a'4 e'8 | %{ bar 10: %} g'8 a'8 a'8 fis'8 e'2 | %{ bar 11: %} b'8 a'4 e'8 b'8 a'4 e'8 | %{ bar 12: %} g'8 a'8 a'8 fis'8 e'2 | %{ bar 13: %} d'8 d'4 a8 d'8 d'4 f'8 | %{ bar 14: %} e'8 d'8 d'8 c'8 d'2 | %{ bar 15: %} d'8 d'4 a8 c'8 c'4 d'8 | %{ bar 16: %} b8 a8 a8 g8 a2 | %{ bar 17: %} d'8 d'4 a8 c'8 c'4 d'8 | %{ bar 18: %} b8 a8 a8 g8 a2
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
\transpose c c, {
a2 a8 c'8 b8 a8 | %{ bar 2: %} a2 a8 e'8 d'8 e'8 | %{ bar 3: %} e'4 c'4 f'2 | %{ bar 4: %} e'4. d'8 c'8 b8 a8 g8 | %{ bar 5: %} a2 a8 c'8 b8 a8 | %{ bar 6: %} a2 a8 e'8 d'8 e'8 | %{ bar 7: %} e'4 c'4 f'2 | %{ bar 8: %} e'4. d'8 c'8 a8 g8 a8 | %{ bar 9: %} a2 c'2 | %{ bar 10: %} b2 b8 g8 e4 | %{ bar 11: %} a2 c'2 | %{ bar 12: %} b2 b8 g8 e4 | %{ bar 13: %} f2 a2 | %{ bar 14: %} a4 c'4 d'8 f'8 e'8 d'8 | %{ bar 15: %} f'2 e'2 | %{ bar 16: %} g2 a8 b8 c'8 a8 | %{ bar 17: %} f'2 e'2 | %{ bar 18: %} e'4 g'4 a'2
}
}

\score {
    %\new Voice = "mel" { \autoBeamOff \melody }
    \new PianoStaff <<
      \new Staff = "upper" \upper
      %\new Lyrics \text
      \new Lyrics = "IX" { \text }
      \new Staff = "lower" \lower
    >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}
