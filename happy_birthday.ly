\version "2.20.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "Happy Birthday"
  }
  subtitle = " "
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20
  bottom-margin = 20
  left-margin = 20
  right-margin = 20
}

\layout {
  indent = 0.0
}

% 定义共享的乐谱片段
melody = {
  \clef treble
  \time 3/4
  \set Score.barNumberVisibility = ##f % 隐藏小节编号
  \partial 4
   g'8 g'8 
   a'4 g'4 c''4 |
   b'2 g'8 g'8 |
   a'4 g'4 d''4 |
   c''2 g'8 g'8 |
   g''4 e''4  c''4 |
   b'4 ( a'4 ) f''8 f''8 |
   e''4 c''4  d''4 |

   \partial 2
   c''2 |
}

\new Staff { \key c   \major                  \melody }
\skip1
\new Staff { \key g   \major \transpose c g   \melody }
\new Staff { \key d   \major \transpose c d   \melody }
\new Staff { \key a   \major \transpose c a   \melody }
\new Staff { \key e   \major \transpose c e   \melody }
\new Staff { \key b   \major \transpose c b   \melody }
\new Staff { \key fis \major \transpose c fis \melody }
\new Staff { \key cis \major \transpose c cis \melody }
\new Staff { \key f   \major \transpose c f   \melody }
\new Staff { \key bes \major \transpose c bes \melody }
\new Staff { \key ees \major \transpose c ees \melody }
\new Staff { \key aes \major \transpose c aes \melody }
\new Staff { \key des \major \transpose c des \melody }
\new Staff { \key ges \major \transpose c ges \melody }
\new Staff { \key ces \major \transpose c ces \melody }

 \layout { 
   #(layout-set-staff-size 22)
 }
