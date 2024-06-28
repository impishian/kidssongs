\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "我的好妈妈"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

% a5
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
我 的 \sk 好 妈 妈 下 班 \sk 回 到 家 劳 \sk 动 了 一 \sk 天 多 么 辛 苦 呀 妈 妈 妈 妈 快 坐 下 妈 妈 妈 妈 快 坐 下 请 喝 一 杯 茶 让 我 \sk 亲 亲 您 \sk 吧 让 我 \sk 亲 亲 您 \sk 吧 我 的 好 妈 妈 我 的 好 妈 妈
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c' {
e'4 e'8 g'8 d'4 d'4 | %{ bar 2: %} c'1 | %{ bar 3: %} e'4 e'8 g'8 a'4 a'4 | %{ bar 4: %} g'1 | %{ bar 5: %} d'4 e'4 g'4 a'4 | %{ bar 6: %} e'4 d'4 e'2 | %{ bar 7: %} g'4 a4 g'4 e'4 | %{ bar 8: %} d'1 | %{ bar 9: %} e'4. d'8 e'4 d'4 | %{ bar 10: %} c'4 a4 g2 | %{ bar 11: %} e'4. d'8 e'4 d'4 | %{ bar 12: %} c'4 a4 g2 | %{ bar 13: %} g4 a4 c'4 d'4 | %{ bar 14: %} e'1 | %{ bar 15: %} g'4 e'8 g'8 a'4 a'4 | %{ bar 16: %} g'4 e'4 d'2 | %{ bar 17: %} g'4 e'8 g'8 a'4 a'4 | %{ bar 18: %} g'4 e'4 d'2 | %{ bar 19: %} g4 e'4 e'4 d'4 | %{ bar 20: %} c'1 | %{ bar 21: %} e'2. g'4 | %{ bar 22: %} d'2 d'2 | %{ bar 23: %} c'1 ( | %{ bar 24: %} c'1 )
  }
}

lower = \relative c {
  \clef tremble
  \key c \major
  \time 4/4
\transpose c c {
< c' e' g' >2 < b f' g' >2 | %{ bar 2: %} < c' e' g' >1 | %{ bar 3: %} < c' e' g' >2 < c' f' a' >2 | %{ bar 4: %} < c' e' g' >1 | %{ bar 5: %} < b f' g' >1 | %{ bar 6: %} < c' e' g' >1 | %{ bar 7: %} < a c' e' >1 | %{ bar 8: %} < a d' f' >1 | %{ bar 9: %} < b e' g' >1 | %{ bar 10: %} < a c' e' >1 | %{ bar 11: %} < b e' g' >1 | %{ bar 12: %} < a c' e' >1 | %{ bar 13: %} < f a c' >2 < g b d' >2 | %{ bar 14: %} < g c' e' >1 | %{ bar 15: %} < g c' e' >2 < a c' f' >2 | %{ bar 16: %} < g c' e' >2 < g b d' >2 | %{ bar 17: %} < g c' e ' >2 < a c' f' >2 | %{ bar 18: %} < g c' e' >2 < g b d' >2 | %{ bar 19: %} < g d' f' >1 | %{ bar 20: %} < g c' e' >1 | %{ bar 21: %} < g c' e' >1 | %{ bar 22: %} < g d' f' >1 | %{ bar 23: %} < g c' e' >1 ( | %{ bar 24: %} < g c' e' >1 )
}
}

\score {
    %\new Voice = "mel" { \autoBeamOff \melody }
    \new PianoStaff <<
      \new Voice = "upper" \upper
      \new Lyrics = "IX" \lyricsto "upper" \text
      \new Staff = "lower" \lower
    >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}
