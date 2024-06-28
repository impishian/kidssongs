\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "小星星"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a6")
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
一 闪 一 闪 亮 晶 晶 \sk 满 天 都 是 小 星 星 \sk 挂 在 天 空 放 光 明 \sk 就 像 许 多 小 眼 睛 \sk 一 闪 一 闪 亮 晶 晶 \sk 满 天 都 是 小 星 星
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c {
  c'4 c'4 g'4 g'4 | a'4 a'4 g'2 |
  f'4 f'4 e'4 e'4 | d'4 d'4 c'2 |
  g'4 g'4 f'4 f'4 | e'4 e'4 d'2 |
  g'4 g'4 f'4 f'4 | e'4 e'4 d'2 |
  c'4 c'4 g'4 g'4 | a'4 a'4 g'2 |
  f'4 f'4 e'4 e'4 | d'4 d'4 c'2 |  
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  \transpose c c, { \key c \major  \time 4/4 < c' e' >1 | %{ bar 2: %} < c' f' >2 < c' e' >2 | %{ bar 3: %} < c' f' >1 | %{ bar 4: %} < b d' >2 < c' e' >2 | %{ bar 5: %} < c' g' >1 | %{ bar 6: %} < c' e' >2 < b d' >2 | %{ bar 7: %} < c' g' >1 | %{ bar 8: %} < c' e' >2 < b d' >2 | %{ bar 9: %} < c' e' >1 | %{ bar 10: %} < c' f' >2 < c' e' >2 | %{ bar 11: %} < c' f' >1 | %{ bar 12: %} < b d' >2 < c' e' >2 }

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
