\version "2.22.0"

\header {
  title = \markup {
    \override #'(font-size . 6) "我有一头小毛驴"
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
\sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk 我 有 一 只 小 毛 驴 我 从 来 也 不 骑 有 一 天 我 心 血 来 潮 骑 着 去 赶 集 \sk
我 手 里 拿 着 小 皮 鞭 我 心 里 正 得 意 不 知 怎 么 哗 啦 啦 啦 啦 我 摔 了 \sk 一 身 泥
}

upper = \relative c {
  \clef treble
  \key c \major
  \time 2/4
\transpose c c {
a'16 a'16 a'16 a'16 f'8 a'8 | %{ bar 2: %} g'16 g'16 g'16 g'16 e'8 g'8 | %{ bar 3: %} f'8 d'8 e'8 b8 | %{ bar 4: %} c'8 c'8 c'4 | %{ bar 5: %} c'8 c'8 c'8 e'8 | %{ bar 6: %} g'8 g'8 g'8 g'8 | %{ bar 7: %} a'8 a'8 a'8 c''8 | %{ bar 8: %} g'2 | %{ bar 9: %} f'8 f'8 f'8 a'8 | %{ bar 10: %} e'8 e'8 e'8 g'8 | %{ bar 11: %} d'8 d'8 d'8 d'8 | %{ bar 12: %} g'4. g'8 | %{ bar 13: %} c'8 c'16 c'16 c'8 e'8 | %{ bar 14: %} g'8 g'8 g'8 g'8 | %{ bar 15: %} a'8 a'8 a'8 c''8 | %{ bar 16: %} g'2 | %{ bar 17: %} f'8 f'8 f'8 a'8 | %{ bar 18: %} e'16 e'16 e'16 e'16 e'8 g'8 | %{ bar 19: %} d'8 d'16 d'16 d'8 e'8 | %{ bar 20: %} c'2
  }
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 2/4
\transpose c c, {
d'8 a'8 f'8 a'8 | %{ bar 2: %} c'8 g'8 e'8 g'8 | %{ bar 3: %} c'8 g'8 e'8 g'8 | %{ bar 4: %} c'8 g'8 e'8 g'8 | %{ bar 5: %} c'8 g'8 e'8 g'8 | %{ bar 6: %} c'8 g'8 e'8 g'8 | %{ bar 7: %} c'8 a'8 f'8 a'8 | %{ bar 8: %} c'8 g'8 e'8 g'8 | %{ bar 9: %} d'8 a'8 f'8 a'8 | %{ bar 10: %} c'8 g'8 e'8 g'8 | %{ bar 11: %} d'8 a'8 f'8 a'8 | %{ bar 12: %} c'2 | %{ bar 13: %} c'8 g'8 e'8 g'8 | %{ bar 14: %} c'8 g'8 e'8 g'8 | %{ bar 15: %} c'8 a'8 f'8 a'8 | %{ bar 16: %} c'8 g'8 e'8 g'8 | %{ bar 17: %} d'8 a'8 f'8 a'8 | %{ bar 18: %} c'8 g'8 e'8 g'8 | %{ bar 19: %} b8 f'8 d'8 f'8 | %{ bar 20: %} < c' e' g' >2
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
