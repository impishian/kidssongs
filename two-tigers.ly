\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "两只老虎"
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
两 只 老 虎 两 只 老 虎 跑 得 快 \sk 跑 得 快 \sk 一只 没有 眼 睛 一只 没有 尾 巴 真 奇 怪 \sk 真 奇 怪 \sk
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c' {
    c'4 d'4 e'4 c'4 | %{ bar 2: %} c'4 d'4 e'4 c'4 | %{ bar 3: %} e'4 f'4 g'2 | %{ bar 4: %} e'4 f'4 g'2 | %{ bar 5: %} g'8
    a'8 g'8 f'8 e'4 c'4 | %{ bar 6: %} g'8 a'8 g'8 f'8 e'4 c'4 | %{ bar 7: %} d'4 g4 c'2 | %{ bar 8: %} d'4 g4 c'2
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
\transpose c c, {
< c' e' g' >4 < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 | %{ bar 2: %} < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 < c' e'  g' >4 | %{ bar 3: %} < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 | %{ bar 4: %} < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 | %{ bar 5: %} < c' f' a' >4 < c' f' a' >4 < c' f' a' >4 < c' f' a' >4 | %{ bar 6: %} < c' f' a' >4 < c' f' a' >4 < c' f' a' >4 < c' f' a' >4 | %{ bar 7: %} < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 < c' e' g' >4 | %{ bar 8: %} < c' e' g' >4 < c' e' g' >4 c'8 e'8 g'8  c''8
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
