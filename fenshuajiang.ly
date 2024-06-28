\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "粉刷匠"
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
我 是 一 个 粉 刷 匠 粉 刷 本 领 强 我 要 把 那 新 房 子 刷 得 很 漂 亮  刷 了 房 顶 又 刷 墙 刷 子 象飞 一 样 哎 呀 我 的 小 鼻 子 变 呀 变 了 样
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c {
  g'4 e'4 g'4 e'4 | %{ bar 2: %} g'4 e'4 c'2 | %{ bar 3: %} d'4 f'4 e'4 d'4 | %{ bar 4: %} g'1 | %{ bar 5: %} g'4 e'4 g'4 e'4 | %{ bar 6: %} g'4 e'4 c'2 | %{ bar 7: %} d'4 f'4 e'4 d'4 | %{ bar 8: %} c'1 | %{ bar 9: %} d'4 d'4 f'4 f'4 | %{ bar 10: %} e'4 c'4 g'2 | %{ bar 11: %} d'4 f'4 e'4 d'4 | %{ bar 12: %} g'1 | %{ bar 13: %} g'4 e'4 g'4 e'4 | %{ bar 14: %} g'4 e'4 c'2 | %{ bar 15: %} d'4 f'4 e'4 d'4 | %{ bar 16: %} c'1
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  \transpose c c, { \key c \major  \time 4/4 c'4 g'4 c'4 g'4 | %{ bar 2: %} c'4 g'4 c'4 g'4 | %{ bar 3: %} g4 g'4 g4 g'4 | %{ bar 4: %} g4 g'4 g4 g'4 | %{ bar 5: %} c'4 g'4 c'4 g'4 | %{ bar 6: %} c'4 g'4 c'4 g'4 | %{ bar 7: %} c'2 < e' g' >2 | %{ bar 8: %} < c' e' g' >1 | %{ bar 9: %} g4 e'4 g4 e'4 | %{ bar 10: %} c'4 g'4 c'4 g'4 | %{ bar 11: %} g4 g'4 g4 g'4 | %{ bar 12: %} g4 g'4 g4 g'4 | %{ bar 13: %} c'4 g'4 c'4 g'4 | %{ bar 14: %} c'4 g'4 c'4 g'4 | %{ bar 15: %} c'2 < e' g' >2 | %{ bar 16: %} < e' g' c'' >1 }

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
