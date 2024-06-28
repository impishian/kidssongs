%\version "2.24.3"
\version "2.20.0"

\include "jianpu/work/jianpu.ly"

\header {
  title = \markup {
    \override #'(font-size . 6) "萱草花"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

\paper {
  #(set-paper-size "a4")
  top-margin = 20
  bottom-margin = 20
  left-margin = 20
  right-margin = 20
}

global = {
  \numericTimeSignature
  \time 3/4
  \tempo 4=80
}


melody = {
  \key c \major
  \transpose  c c  {
  
  a4. c'8 a4 | %{ bar 2: %} g4 c'4 e'4 | %{ bar 3: %} d'4. c'8 d'8 c'8 | %{ bar 4: %} c'2 r4 | %{ bar 5: %} e'4 e'4 e'4 |
  %{ bar 6: %} g'4. a'8 g'4 | %{ bar 7: %} c'4. d'8 e'8 c'8 | %{ bar 8: %} g4 r2 | %{ bar 9: %} a8 c'8 a4 r4 | %{ bar 10: %} g8 c'8 g4 r4 |
  %{ bar 11: %} a4. b8 c'8 e'8 | %{ bar 12: %} d'4 r4 c'8 d'8 | %{ bar 13: %} e'4 e'4 e'4 | %{ bar 14: %} g'4. a'8 g'4 | %{ bar 15: %} c'4. d'8 e'8 g'8 |
  %{ bar 16: %} e'4 r2 | %{ bar 17: %} a8 c'8 a4 r4 | %{ bar 18: %} g8 c'8 g4 e'4 | %{ bar 19: %} d'4 r8 a8 c'8 d'8 | %{ bar 20: %} c'2 r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "Fine" \bar "|."  |
  %{ bar 21: %} c'4. a8 c'8 e'8 | %{ bar 22: %} g'2 r4 | %{ bar 23: %} a'8 g'8 e'8 c'8 d'4 | %{ bar 24: %} e'2 r4 | %{ bar 25: %} c'4. a8 c'8 e'8 |
  %{ bar 26: %} g'4 e'4 c'4 | %{ bar 27: %} a4. b8 c'8 e'8 | %{ bar 28: %} d'2 r4 | %{ bar 29: %} c'4. a8 c'8 e'8 | %{ bar 30: %} g'2 r4 |
  %{ bar 31: %} a'4 b'4 c''4 | %{ bar 32: %} g'2 r4 | %{ bar 33: %} a'4. b'8 c''4 | %{ bar 34: %} g'4 e'4 c'4 | %{ bar 35: %} g4 e'4 d'4 |
  %{ bar 36: %} c'2 r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "D.C. al Fine" \bar "||"
  }
} 


melody_change = {
  \key c \major
  \transpose c c { 
    \melody
  }
}

sk = \skip1
verse = \lyricmode {
    \sk \sk \sk \sk  \sk \sk  \sk \sk \sk \sk \sk
    高 高 的 青 山 上 萱 草 花 开 放
    采 一 朵 送 给 我 小 小 的 姑 娘
    把 它 别 在 你 的 发 梢 捧 在 我 心 上
    陪 着 你 长 大 了 再 看 你 追 梦 想
    如 果 有 一 天 心 事 去 了 远 方 
    摘 朵 花 瓣 做 翅 膀 迎 着 风 飞 扬
    如 果 有 一 天 懂 了 忧 伤 想 着 它 就 会 有 好 梦 一 场
}

verserr = \lyricmode {
    \sk \sk \sk \sk  \sk \sk  \sk \sk \sk \sk \sk
    遥 遥 的 天 之 涯 萱 草 花 开 放
    每 一 朵 可 是 我 牵 挂 的 模 样
    让 它 开 遍 我 等 着 你 回 家 的 路 上
    好 像 我 从 不 曾 离 开 你 的 身 旁
   
}


chord = \chordmode {   
   \override ChordName.color = #(rgb-color 0.8 0.2 0.2)
   a:m s4 s4 c/g s4 s4 d:m s4 s4 c s4 s4 c s4 s4 g s4 s4  a:m s4 s4
   e:m s4 s4 f:maj7 s4 s4 c s4 s4 d:m7 s4 s4 g s4 s4 c s4 s4 g s4 s4 a:m  s4 s4
   a:m s4 s4 f:maj7 s4 s4 c s4 s4 d:m7 s4 g4 c s4 s4  
   a:m s4 s4 e:m s4 s4 f:maj7 s4 s4 c s4 s4 a:m s4 s4 e:m s4 s4 f:maj7 s4 s4 g s4 s4 a:m s4 s4 e:m s4 s4 f:maj7 s4 s4  c s4 s4 f:maj7 s4 s4 c s4 s4 d:m7 s4 g c s4 s4
}

%\include "predefined-guitar-fretboards.ly"

theChords = \chordmode {
  % insert chords for chordnames and fretboards here
  c4 d:m e:m f g a:m
}

%\score {
%<<
%  \context ChordNames { \theChords }
%  \context FretBoards { \theChords }  
%>>
%}

\score {
<<
  \new ChordNames {
    %\set chordChanges = ##t

    \set instrumentName = #"italian"
    \italianChords

    \chord
 }
 
  \new Staff \new Voice = number { \global  \melody }
  %\new JianpuStaff \jianpuMusic \new Voice = number { \global  \melody }

  \new Lyrics = "IX" { \lyricsto number {  \verse } } 

  \new Lyrics = "IY" { \lyricsto number {  \verserr } } 
>>

 \layout { 
   #(layout-set-staff-size 24)
   \context {
      \Lyrics
      \override VerticalAxisGroup.staff-affinity = ##f
      \override VerticalAxisGroup.staff-staff-spacing =
        #'((basic-distance . 0)
	   (minimum-distance . 1)
	   (padding . 1))
    }
 }

}
