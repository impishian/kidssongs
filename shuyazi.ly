\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "数鸭子"
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
\sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk 门 前 大 桥 下 游 过 一 群 鸭 快 来 快 来 数 一 数 二 四 六 七 八 嘎 嘎 嘎 嘎 真 呀 真 多 呀  数 不 清 到 底 多 \sk 少 \sk 鸭 数 不 清 到 底 多 \sk 少 \sk 鸭
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c {
c''8 c''8 g'8 g'8 e'8 a'8 g'8 e'8 | %{ bar 2: %} d'8 c'8 d'8 e'8 c'4 r4 | %{ bar 3: %} e'4 c'4 e'8 e'8 c'4 | %{ bar 4: %} e'8 e'8 g'8 a'8 g'4 r4 | %{ bar 5: %} a'8 a'8 a'8 g'8 f'8 f'8 f'4 | %{ bar 6: %} d'8 e'8 d'8 c'8 d'4 r4 | %{ bar 7: %} e'4 c'8 r8 e'4 c'8 r8 | %{ bar 8: %} e'8 e'8 g'8 a'8 a'4 r4 | %{ bar 9: %} c''4 g'8 g'8 a'4 e'4 | %{ bar 10: %} d'8 c'8 d'8 e'8 g'2 | %{ bar 11: %} c''4 g'8 g'8 a'4 e'4 | %{ bar 12: %} d'8 c'8 d'8 e'8 c'2 ( | %{ bar 13: %} c'2 ) r2
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
\transpose c c, {
c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 2: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 3: %} c'8 g'8 e'8 g'8 c'8 g'8 e' 8 g'8 | %{ bar 4: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 5: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 6: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 7: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 8: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 9: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 10: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 11: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 12: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 13: %} c'2 r2
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
