\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "字母歌"
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
A B C D E F G H I J K L M N
O P Q \sk R S T U V W \sk X Y Z
Now I Know My A B Cs Next Time Won't You Sing With Me
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c {
c'4 c'4 g'4 g'4 | %{ bar 2: %} a'4 a'4 g'2 | %{ bar 3: %} f'4 f'4 e'4 e'4 | %{ bar 4: %} d'4 d'4 c'2 | %{ bar 5: %} g'4 g'4 f'4 f'4 | %{ bar 6: %} e'4 e'4 d'2 | %{ bar 7: %} g'4 g'4 f'4 f'4 | %{ bar 8: %} e'4 e'4 d'2 | %{ bar 9: %} c'4 c'4 g'4 g'4 | %{ bar 10: %} a'4 a'4 g'2 | %{ bar 11: %} f'4 f'4 e'4 e'4 | %{ bar 12: %} d'4 d'4 c'2
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
\transpose c c, {
c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 2: %} c'8 a'8 f'8 a'8 c'8 g'8 e'8 g'8 | %{ bar 3: %} c'8 a'8 f'8 a'8 c'8 g'8 e'8 g'8 | %{ bar 4: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 5: %} c'8 g'8 e'8 g'8 c'8 a'8 f'8 a'8 | %{ bar 6: %} c'8 g'8 e'8 g'8 c'8 g'8 f'8 g'8 | %{ bar 7: %} c'8 g'8 e'8 g'8 c'8 a'8 f'8 a'8 | %{ bar 8: %} c'8 g'8 e'8 g'8 c'8 g'8 f'8 g'8 | %{ bar 9: %} c'8 g'8 e'8 g'8 c'8 g'8 e'8 g'8 | %{ bar 10: %} c'8 a'8 f'8 a'8 c'8 g'8 e'8 g'8 | %{ bar 11: %} c'8 a'8 f'8 a'8 c'8 g'8 e'8 g'8 | %{ bar 12: %} c'8 g'8 f'8 g'8 c'2
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
