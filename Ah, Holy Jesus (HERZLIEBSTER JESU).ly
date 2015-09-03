%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Ah, Holy Jesus"  }
  meter = \markup { \small { "Music: HERZLIEBSTER JESU, 11.11.11.5.; Johann Crüger, 1640" } }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack") "Herzliebster Jesu," Johann Heermann, c. 1630; Tr. Robert Bridges, 1899 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \minor
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  g2 g4 g4 |
  f2 d2 |
  g4 a bf bf |
  c2 a \bar "||"
  
  a bf4 c |
  d2 bf |
  ef4 ef d d |
  c2 bf2 \bar "||"
  
  bf a4 g |
  f2 d |
  f4 f g f |
  ef2 d \bar "||"
  
  d' c4 bf |
  a2 g \bar "|."
}

alto = \relative c' {
  \global
  d2 ef4 ef |
  c2 d2 |
  d4 d g f |
  ef2 d |
  
  d d4 f |
  f2 g2 |
  g4 g f f |
  f2 d |
  
  g f4 ef |
  d2 bf |
  d4 c d d |
  c4( bf) a2 |
  
  d ef4 d |
  d4.( c8) bf2 |
}

tenor = \relative c' {
  \global
  bf2 bf4 c |
  a2 f |
  bf4 a g bf |
  g2 fs |
  
  fs g4 a |
  bf2 g2 |
  c4 g8[ a] bf4 bf |
  bf( a) bf2 |
  
  d d4 bf |
  bf2 f |
  f4 a bf bf |
  g2 fs |
  
  f4( bf) g g |
  g( fs) g2 \bar "|."
}

bass = \relative c' {
  \global
  g2 ef4 c |
  f2 bf, |
  g'4 f ef d |
  c2 d |
  
  d g4 f |
  bf,2 ef |
  c4 c d4. ef8 |
  f2 bf, |
  
  g d'4 ef |
  bf2 bf |
  bf4 a g bf |
  c2 d |
  
  bf c4 g |
  d'2 g, |
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ah, ho -- ly Je -- sus, how hast Thou of -- fen -- ded,
  That man to judge Thee hath in hate pre -- ten -- ded?
  By foes de -- rid -- ed, by Thine own re -- jec -- ted
  O most af -- flic -- ted.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Who was the guil -- ty? Who brought this up -- on Thee?
  A -- las, my trea -- son, Je -- sus, hath un -- done Thee.
  ’Twas I, Lord, Je -- sus, I it was de -- nied Thee!
  I cru -- ci -- fied Thee.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Lo, the Good Shep -- herd for the sheep is of -- fered;
  The slave hath sin -- ned, and the Son hath suf -- fered;
  For man’s a -- tone -- ment, while he noth -- ing heed -- eth,
  God in -- ter -- ced -- eth.
}

verseFour = \lyricmode {
  \set stanza = "4."
  For me, kind Je -- sus, was Thy in -- car -- na -- tion,
  Thy mor -- tal sor -- row, and Thy life’s ob -- la -- tion;
  Thy death of an -- guish and Thy bit -- ter pas -- sion,
  For my sal -- va -- tion.
}

verseFive = \lyricmode {
  \set stanza = "5."
  There -- fore, kind Je -- sus, since I can -- not pay Thee,
  I do a -- dore Thee, and will ev -- er pray Thee,
  Think on Thy pi -- ty and Thy love un -- swerv -- ing,
  Not my de -- serv -- ing.
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
      sopranos { \voiceOne << \melody >> }
      \context Voice =
      altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
      \context Lyrics = two \lyricsto sopranos \verseTwo
      \context Lyrics = three \lyricsto sopranos \verseThree
      \context Lyrics = four \lyricsto sopranos \verseFour
      \context Lyrics = five \lyricsto sopranos \verseFive
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
      tenors { \voiceOne << \tenor >> }
      \context Voice =
      basses { \voiceTwo << \bass >> }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}
