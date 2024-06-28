\version "2.20.0"
#(set-global-staff-size 20)

% un-comment the next line to remove Lilypond tagline:
% \header { tagline="" }
\header {
  title = \markup {
    \override #'(font-size . 4) "萱草花"
  }
  subtitle = " "
  % Remove default LilyPond tagline
  tagline = ##f
}

\pointAndClickOff

sk = \skip1
\paper {
  #(set-paper-size "a5")
  top-margin = 8
  bottom-margin = 10
  left-margin = 10
  right-margin = 10
  %print-all-headers = ##t %% allow per-score headers

  % un-comment the next line for A5:
  % #(set-default-paper-size "a5" )

  % un-comment the next line for no page numbers:
  % print-page-number = ##f

  % un-comment the next 3 lines for a binding edge:
  % two-sided = ##t
  % inner-margin = 20\mm
  % outer-margin = 10\mm

  % un-comment the next line for a more space-saving header layout:
  % scoreTitleMarkup = \markup { \center-column { \fill-line { \magnify #1.5 { \bold { \fromproperty #'header:dedication } } \magnify #1.5 { \bold { \fromproperty #'header:title } } \fromproperty #'header:composer } \fill-line { \fromproperty #'header:instrument \fromproperty #'header:subtitle \smaller{\fromproperty #'header:subsubtitle } } } }

  % As jianpu-ly was run on a Mac, we include a Mac fonts workaround.
  % The Mac version of Lilypond 2.18 used Arial Unicode MS as a
  % fallback even in the Serif font, but 2.20 drops this in Serif
  % (using it only in Sans), which means any Serif text (titles,
  % lyrics etc) that includes Chinese will likely fall back to
  % Japanese fonts which don't support all Simplified hanzi.
  % This brings back 2.18's behaviour on 2.20+:
  #(define fonts
    (set-global-fonts
     #:factor (/ staff-height pt 19)
    ))

  % Might need to enforce a minimum spacing between systems, especially if lyrics are below the last staff in a system and numbers are on the top of the next
  system-system-spacing = #'((basic-distance . 7) (padding . 5) (stretchability . 1e7))
  score-markup-spacing = #'((basic-distance . 9) (padding . 5) (stretchability . 1e7))
  score-system-spacing = #'((basic-distance . 9) (padding . 5) (stretchability . 1e7))
  markup-system-spacing = #'((basic-distance . 2) (padding . 2) (stretchability . 0))
}

%{ The jianpu-ly input was:
1=C
3/4 4=80
6,. q1 6, 5, 1 3 2. q1 q2 q1 1 - 0 
3 3 3 5. q6 5 1. q2 q3 q1 5, 0 0 q6, q1 6, 0
q5, q1 5, 0 6,. q7, q1 q3 2 0 q1 q2 3 3 3 5. q6 5
1. q2 q3 q5 3 0 0 q6, q1 6, 0 q5, q1 5, 3 2 q0 q6, q1 q2 1 - 0 Fine 
1. q6, q1 q3 5 - 0 q6 q5 q3 q1 2 3 - 0 1. q6, q1 q3
5 3 1 6,. q7, q1 q3 2 - 0 1. q6, q1 q3 5 - 0 
6 7 1' 5 - 0 6. q7 1' 5 3 1 5, 3 2 1 - 0 DC
L: 1.高 高 的 青 山 上 萱 草 花 开 放 采 一 朵 送 给 我 小 小 的 姑 娘 把 它 别 在 你 的 发 梢 捧 在 我 心 上 陪 着 你 长 大 了 再 看 你 做 新 娘 如 果 有 一 天 心 事 去 了 远 方 摘 朵 花 瓣 做 翅 膀 迎 着 风 飞 扬 如 果 有 一 天 懂 了 忧 伤 想 着 它 就 会 有 好 梦 一 场
L: 2.遥 遥 的 天 之 涯 萱 草 花 开 放 每 一 朵 可 是 我 牵 挂 的 模 样 让 它 开 遍 我 等 着 你 回 家 的 路 上 好 像 我 从 不 曾 离 开 你 的 身 旁
%}


\score {
<< \override Score.BarNumber #'break-visibility = #center-visible
\override Score.BarNumber #'Y-offset = -1
\set Score.barNumberVisibility = #(every-nth-bar-number-visible 5)

%% === BEGIN JIANPU STAFF ===
    \new RhythmicStaff \with {
    \consists "Accidental_engraver" 
    %% Get rid of the stave but not the barlines:
    \override StaffSymbol #'line-count = #0 %% tested in 2.15.40, 2.16.2, 2.18.0, 2.18.2, 2.20.0 and 2.22.2
    \override BarLine #'bar-extent = #'(-2 . 2) %% LilyPond 2.18: please make barlines as high as the time signature even though we're on a RhythmicStaff (2.16 and 2.15 don't need this although its presence doesn't hurt; Issue 3685 seems to indicate they'll fix it post-2.18)
    }
    { \new Voice="X" {
    \override Beam #'transparent = ##f
    \override Stem #'direction = #DOWN
    \override Tie #'staff-position = #2.5
    \tupletUp
    \override Stem #'length-fraction = #0
    \override Beam #'beam-thickness = #0.1
    \override Beam #'length-fraction = #0.5
    \override Voice.Rest #'style = #'neomensural % this size tends to line up better (we'll override the appearance anyway)
    \override Accidental #'font-size = #-4
    \override TupletBracket #'bracket-visibility = ##t
\set Voice.chordChanges = ##t %% 2.19 bug workaround

    \override Staff.TimeSignature #'style = #'numbered
    \override Staff.Stem #'transparent = ##t
     \mark \markup{1=C} \time 3/4 \tempo 4=80 #(define (note-six grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "6")))))))
  \applyOutput #'Voice #note-six a4.-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-one grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "1")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[]
  \applyOutput #'Voice #note-six a4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-five grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "5")))))))
| %{ bar 2: %}
  \applyOutput #'Voice #note-five g4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-one c'4 #(define (note-three grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "3")))))))
  \applyOutput #'Voice #note-three e'4
#(define (note-two grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "2")))))))
| %{ bar 3: %}
  \applyOutput #'Voice #note-two d'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 4: %}
  \applyOutput #'Voice #note-one c'4
 ~ #(define (note-dashone grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashone c'4
#(define (note-nought grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "0")))))))
  \applyOutput #'Voice #note-nought r4
| %{ bar 5: %}
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-three e'4   \applyOutput #'Voice #note-three e'4 | %{ bar 6: %}
  \applyOutput #'Voice #note-five g'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[]
  \applyOutput #'Voice #note-five g'4 | %{ bar 7: %}
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
| %{ bar 8: %}
  \applyOutput #'Voice #note-five g4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-nought r4   \applyOutput #'Voice #note-nought r4 | %{ bar 9: %} \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
  \applyOutput #'Voice #note-six a4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-nought r4 | %{ bar 10: %} \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
  \applyOutput #'Voice #note-five g4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-nought r4 | %{ bar 11: %}
  \applyOutput #'Voice #note-six a4.-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
#(define (note-seven grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "7")))))))
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
| %{ bar 12: %}
  \applyOutput #'Voice #note-two d'4
  \applyOutput #'Voice #note-nought r4 \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
| %{ bar 13: %}
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-three e'4   \applyOutput #'Voice #note-three e'4 | %{ bar 14: %}
  \applyOutput #'Voice #note-five g'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[]
  \applyOutput #'Voice #note-five g'4 | %{ bar 15: %}
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8[]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
| %{ bar 16: %}
  \applyOutput #'Voice #note-three e'4
  \applyOutput #'Voice #note-nought r4   \applyOutput #'Voice #note-nought r4 | %{ bar 17: %} \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
  \applyOutput #'Voice #note-six a4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-nought r4 | %{ bar 18: %} \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g8[-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
  \applyOutput #'Voice #note-five g4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4 | %{ bar 19: %}
  \applyOutput #'Voice #note-two d'4
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-nought r8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-two d'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 20: %}
  \applyOutput #'Voice #note-one c'4
 ~   \applyOutput #'Voice #note-dashone c'4   \applyOutput #'Voice #note-nought r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "Fine" \bar "|."
| %{ bar 21: %}
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8[]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 22: %}
  \applyOutput #'Voice #note-five g'4
 ~ #(define (note-dashfive grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashfive g'4
  \applyOutput #'Voice #note-nought r4 | %{ bar 23: %} \set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-five g'8]
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8]
  \applyOutput #'Voice #note-two d'4 \once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 24: %}
  \applyOutput #'Voice #note-three e'4
 ~ #(define (note-dashthree grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashthree e'4
  \applyOutput #'Voice #note-nought r4 | %{ bar 25: %}
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8[]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
| %{ bar 26: %}
  \applyOutput #'Voice #note-five g'4
  \applyOutput #'Voice #note-three e'4   \applyOutput #'Voice #note-one c'4 | %{ bar 27: %}
  \applyOutput #'Voice #note-six a4.-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b8[]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 28: %}
  \applyOutput #'Voice #note-two d'4
 ~ #(define (note-dashtwo grob grob-origin context)
  (if (and (eq? (ly:context-property context 'chordChanges) #t)
      (or (grob::has-interface grob 'note-head-interface)
        (grob::has-interface grob 'rest-interface)))
    (begin
      (ly:grob-set-property! grob 'stencil
        (grob-interpret-markup grob
          (make-lower-markup 0.5 (make-bold-markup "–")))))))
  \applyOutput #'Voice #note-dashtwo d'4
  \applyOutput #'Voice #note-nought r4 | %{ bar 29: %}
  \applyOutput #'Voice #note-one c'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-six a8[]-\tweak #'X-offset #0.6 _.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-one c'8[
\set stemLeftBeamCount = #1
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-three e'8]
\once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 30: %}
  \applyOutput #'Voice #note-five g'4
 ~   \applyOutput #'Voice #note-dashfive g'4   \applyOutput #'Voice #note-nought r4 | %{ bar 31: %}
  \applyOutput #'Voice #note-six a'4
  \applyOutput #'Voice #note-seven b'4   \applyOutput #'Voice #note-one c''4^. \once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 32: %}
  \applyOutput #'Voice #note-five g'4
 ~   \applyOutput #'Voice #note-dashfive g'4   \applyOutput #'Voice #note-nought r4 | %{ bar 33: %}
  \applyOutput #'Voice #note-six a'4.
\set stemLeftBeamCount = #0
\set stemRightBeamCount = #1
  \applyOutput #'Voice #note-seven b'8[]
  \applyOutput #'Voice #note-one c''4^. | %{ bar 34: %}
  \applyOutput #'Voice #note-five g'4
  \applyOutput #'Voice #note-three e'4   \applyOutput #'Voice #note-one c'4 | %{ bar 35: %}
  \applyOutput #'Voice #note-five g4-\tweak #'Y-offset #-1.2 -\tweak #'X-offset #0.6 _.
  \applyOutput #'Voice #note-three e'4   \applyOutput #'Voice #note-two d'4 \once \override Tie #'transparent = ##t \once \override Tie #'staff-position = #0 | %{ bar 36: %}
  \applyOutput #'Voice #note-one c'4
 ~   \applyOutput #'Voice #note-dashone c'4   \applyOutput #'Voice #note-nought r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "D.C. al Fine" \bar "||" } }
% === END JIANPU STAFF ===

\new Lyrics = "IY" { \lyricsto "X" { \set stanza =  \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk # "" 高 高 的 青 山 上 萱 草 花 开 放 采 一 朵 送 给 我 小 小 的 姑 娘 把 它 别 在 你 的 发 梢 捧 在 我 心 上 陪 着 你 长 大 了 再 看 你 追 梦 想 如 果 有 一 天 心 事 去 了 远 方 摘 朵 花 瓣 做 翅 膀 迎 着 风 飞 扬 如 果 有 一 天 懂 了 忧 伤 想 着 它 就 会 有 好 梦 一 场 } }
\new Lyrics = "IZ" { \lyricsto "X" { \set stanza =  \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk \sk # "" 遥 遥 的 天 之 涯 萱 草 花 开 放 每 一 朵 可 是 我 牵 挂 的 模 样 让 它 开 遍 我 等 着 你 回 家 的 路 上 好 像 我 从 不 曾 离 开 你 的 身 旁 } } 
>>
\layout{} }
\score {
\unfoldRepeats
<< 

% === BEGIN MIDI STAFF ===
    \new Staff { \new Voice="a" { \transpose c c, { \key c \major  \time 3/4 \tempo 4=80 a4. c'8 a4 | %{ bar 2: %} g4 c'4 e'4 | %{ bar 3: %} d'4. c'8 d'8 c'8 | %{ bar 4: %} c'2 r4 | %{ bar 5: %} e'4 e'4 e'4 | %{ bar 6: %} g'4. a'8 g'4 | %{ bar 7: %} c'4. d'8 e'8 c'8 | %{ bar 8: %} g4 r2 | %{ bar 9: %} a8 c'8 a4 r4 | %{ bar 10: %} g8 c'8 g4 r4 | %{ bar 11: %} a4. b8 c'8 e'8 | %{ bar 12: %} d'4 r4 c'8 d'8 | %{ bar 13: %} e'4 e'4 e'4 | %{ bar 14: %} g'4. a'8 g'4 | %{ bar 15: %} c'4. d'8 e'8 g'8 | %{ bar 16: %} e'4 r2 | %{ bar 17: %} a8 c'8 a4 r4 | %{ bar 18: %} g8 c'8 g4 e'4 | %{ bar 19: %} d'4 r8 a8 c'8 d'8 | %{ bar 20: %} c'2 r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "Fine" \bar "|."
| %{ bar 21: %} c'4. a8 c'8 e'8 | %{ bar 22: %} g'2 r4 | %{ bar 23: %} a'8 g'8 e'8 c'8 d'4 | %{ bar 24: %} e'2 r4 | %{ bar 25: %} c'4. a8 c'8 e'8 | %{ bar 26: %} g'4 e'4 c'4 | %{ bar 27: %} a4. b8 c'8 e'8 | %{ bar 28: %} d'2 r4 | %{ bar 29: %} c'4. a8 c'8 e'8 | %{ bar 30: %} g'2 r4 | %{ bar 31: %} a'4 b'4 c''4 | %{ bar 32: %} g'2 r4 | %{ bar 33: %} a'4. b'8 c''4 | %{ bar 34: %} g'4 e'4 c'4 | %{ bar 35: %} g4 e'4 d'4 | %{ bar 36: %} c'2 r4 \once \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT \mark "D.C. al Fine" \bar "||"
} } }
% === END MIDI STAFF ===

>>
\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 84 4)}} }
