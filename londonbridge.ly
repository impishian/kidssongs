\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "伦敦桥"
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
伦 敦 大 桥 垮 下 来 垮 下 来 垮 下 来
伦 敦 大 桥 垮 下 来 就 要 垮 下来
}

texten = \lyricmode {
Lon don Bridge is fal ling down 
Fal ling down Fal ling down 
Lon don Bridge is fal ling down
My fair la dy
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 4/4
\transpose c c {
g'4. a'8 g'4 f'4 | %{ bar 2: %} e'4 f'4 g'2 | %{ bar 3: %} d'4 e'4 f'2 | %{ bar 4: %} e'4 f'4 g'2 | %{ bar 5: %} g'4. a'8 g'4 f'4 | %{ bar 6: %} e'4 f'4 g'2 | %{ bar 7: %} d'2 g'2 | %{ bar 8: %} e'4 c'2.
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4
\transpose c c, {
c'4 g'4 e'4 g'4 | %{ bar 2: %} c'4 g'4 e'4 g'4 | %{ bar 3: %} b4 g'4 d'4 g'4 | %{ bar 4: %} c'4 g'4 e'4 g'4 | %{ bar 5:%} c'4 g'4 e'4 g'4 | %{ bar 6: %} c'4 g'4 e'4 g'4 | %{ bar 7: %} b4 g'4 d'4 g'4 | %{ bar 8: %} c'4 g'4 e'4 g'4
}
}

\score {
    %\new Voice = "mel" { \autoBeamOff \melody }
    \new PianoStaff <<
      \new Voice = "upper" \upper
      \new Lyrics = "IX" \lyricsto "upper" \text
      \new Lyrics = "IY" \lyricsto "upper" \texten
      \new Staff = "lower" \lower
    >>
  \layout {
    \context { \Staff \RemoveEmptyStaves }
  }
  \midi { }
}
