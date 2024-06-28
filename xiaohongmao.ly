\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "小红帽"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
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
我 独 自 走 在 郊 外 的 小 路 上
我 把 糕 点 带 给 外 婆 尝 一 尝
她 家 住 在 悠 远 又 僻 静 的 地 方
我 要 当 心 附 近 是 否 有 大 灰 狼
当 太 阳 下 山 岗 我 要 赶 回 家
同 妈 妈 一 起 进 入 甜 蜜 梦 乡
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 2/4
\transpose c c {
c'8 ( d'8 ) e'8 f'8 | %{ bar 2: %} g'4 e'8 ( c'8 ) | %{ bar 3: %} c''4 a'8 f'8 | %{ bar 4: %} g'8 g'8 e'4 | %{ bar 5: %} c'8 d'8 e'8 f'8 | %{ bar 6: %} g'8 e'8 d'8 c'8 | %{ bar 7: %} d'4 e'4 | %{ bar 8: %} d'4 ( g'4 ) | %{ bar 9: %} c'8 d'8 e'8 f'8 | %{ bar 10: %} g'4 e'8 c'8 | %{ bar 11: %} c''4 a'8 f'8 | %{ bar 12: %} g'4 e'4 | %{ bar 13: %} c'8 d'8 e'8 f'8 | %{ bar 14: %} g'8 e'8 d'8 c'8 | %{ bar 15: %} d'4 e'4 | %{ bar 16: %} c'4 c'4 | %{ bar 17: %} \repeat volta 2 {  c''4 a'8 f'8 | %{ bar 18: %} g'8 g'8 c'4 | %{ bar 19: %} c''4 a'8 f'8 | %{ bar 20: %} g'4 e'4 | %{ bar 21: %} c'8 ( d'8 ) e'8 f'8 | %{ bar 22: %} g'8 e'8 d'8 c'8 | %{ bar 23: %} d'4 e'4 | %{ bar 24: %} c'4 c'4 }
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 2/4
\transpose c c, {
c'2 | %{ bar 2: %} e'2 | %{ bar 3: %} f'2 | %{ bar 4: %} e'2 | %{ bar 5: %} c'2 | %{ bar 6: %} e'2 | %{ bar 7: %} g'2 | %{ bar 8: %} g'2 | %{ bar 9: %} c'2 | %{ bar 10: %} e'2 | %{ bar 11: %} f'2 | %{ bar 12: %} e'2 | %{ bar 13: %} c'2 | %{ bar 14: %} e'2 | %{ bar 15: %} g'2 | %{ bar 16: %} c'2 | %{ bar 17: %} f'2 | %{ bar 18:%} e'2 | %{ bar 19: %} f'2 | %{ bar 20: %} e'2 | %{ bar 21: %} c'2 | %{ bar 22: %} e'2 | %{ bar 23: %} g'2 | %{ bar 24: %} c'2
}
}

\score {
    %\new Voice = "mel" { \autoBeamOff \melody }
    \new PianoStaff <<
      \new Voice = "upper" \upper
      \new Lyrics = "IX" \lyricsto "upper"   \text
      \new Staff = "lower" \lower
    >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}
