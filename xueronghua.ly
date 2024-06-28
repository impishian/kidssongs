\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "雪绒花"
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
雪 绒 花 雪 绒 花 清 晨 迎 着 我 开 放 小 而 白 洁 而 亮 向 我 快 乐 地 摇 晃 白 雪 般 的 花 儿 愿 你 芬 芳 永 远 开 花 生 长 雪 绒 花 雪 绒 花 永 远 祝 福 我 家 乡
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 3/4
\transpose c c {
e'2 g'4 | %{ bar 2: %} c''2. | %{ bar 3: %} b'2 g'4 | %{ bar 4: %} e'2. | %{ bar 5: %} e'2 e'4 | %{ bar 6: %} e'4 f'4 g'4 | %{ bar 7: %} a'2. | %{ bar 8: %} g'2. | %{ bar 9: %} e'2 g'4 | %{ bar 10: %} d''2. | %{ bar 11: %} c''2 g'4 | %{ bar 12: %} e'2. | %{ bar 13: %} e'2 g'4 | %{ bar 14: %} g'4 a'4 b'4 | %{ bar 15: %} c''2. | %{ bar 16: %} c''2.
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 3/4
\transpose c c, {
< c' e' g' >2. | %{ bar 2: %} < b d' g' >2. | %{ bar 3: %} < c' e' g' >2. | %{ bar 4: %} < c' f' a' >2. | %{ bar 5: %} < c' e' g' >2. | %{ bar 6: %} < c' e' g' >2. | %{ bar 7: %} < c' f' a' >2. | %{ bar 8: %} < b d' g' >2. | %{ bar 9: %} < c' e' g' >2. | %{ bar 10: %} < b d' g' >2. | %{ bar 11: %} < c' e' g' >2. | %{ bar 12:%} < c' f' a' >2. | %{ bar 13: %} < c' e' g' >2. | %{ bar 14: %} < b d' g' >2. | %{ bar 15: %} < c' e' g' >2. | %{ bar 16: %} < c' e' g' >2.
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
