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
  poet = \markup{ \fontsize #4 \smallCaps "Bethlehem, of Noblest Cities"  }
  meter = \markup { \small { Music: STUTTGART, 87.87.; C.F. Witt, 1715; adapt. H.J. Gauntlett, 1861; harm. \italic "The English Hymnal," 1906} }
  piece = \markup { \small {Text: \italic "O sola magnarum urbium," Prudentius, 4th cent.; tr. E. Caswall, 1851 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key g \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  d4 d g g |
  a a b g  \bar "||"

  d'4 d e c |
  a d b2 \bar "||" \break

  b4 b a b |
  g a g fs \bar "||"

  g e d g |
  g fs g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d d b |
  e d d d |

  a' g g g |
  g fs g2 |

  d4 d d fs |
  g e d d |

  d c d d |
  d d d2
}

tenor = \relative c {
  \global
  d4 fs g g |
  g fs g b |

  d b c c |
  d d d2 |

  g,4 g a d8[ c] |
  b4 c b a |

  g g8[ a] b4 b |
  a a b2
}

bass = \relative c {
  \global
  d4 d8[ c] b[ a] g4 |
  c d g, g' |

  fs g c, e |
  d d g,2 |

  b4 g' fs d |
  e c d d |

  b c g8[ a] b[ c] |
  d4 d g,2
}
verseOne = \lyricmode {
  \set stanza = "1. "
  Beth -- le -- hem, of no -- blest cit -- ies
  None can once with thee com -- pare;
  Thou a -- lone the Lord from heav -- en
  Didst for us In -- car -- nate bear.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Fair -- er than the sun at morn -- ing
  Was the star that told his birth;
  To the lands their God an -- nounc -- ing,
  Hid be -- neath a form of earth.
}

verseThree = \lyricmode {
  \set stanza = "3."
  By its lam -- bent beau -- ty guid -- ed,
  See, the East -- ern Kings ap -- pear;
  See them bend, their gifts to of -- fer,—
  Gifts of in -- cense, gold, and myrrh.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Of -- fer -- ings of my -- stic mean -- ing!—
  In -- cense doth the God dis -- close;
  Gold a Roy -- al child pro -- claim -- eth;
  Myrrh a fu -- ture tomb fore -- shows.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Ho -- ly Je -- sus! in thy bright -- ness
  To the Gen -- tile world dis -- play’d!
  With the Fa -- ther, and the Spir -- it,
  End -- less praise to Thee be paid.
}

%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%

melodya = \relative c' {
  \global
  d4 d g g |
  a a b g  \bar "||"

  d'4 d e c |
  a d b2 \bar "||" \break

  b4 b a b |
  g a g fs \bar "||"

  g e d g |
  g fs g2 \bar "|."
}

altoa = \relative c' {
  \global
  d4 d d d |
  fs fs g g |

  a b g g |
  g fs g2 |

  g4 g fs fs |
  e e d d |

  d c b d |
  d d d2

}

tenora = \relative c {
  \global
  d4 d b' b |
  d d d b |

  d d c e |
  d d d2 |

  e4 e c b |
  b a a a |

  g g g b |
  a a b2
}

bassa = \relative c {
  \global
  d4 d b g |
  d' d g g |

  fs g c, c |
  d d g,2 |

  e'4 e e ds |
  e cs d d |

  b c g g |
  d' d g,2
}
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%

melodyb = \relative c' {
  \global
  d4 d g g |
  a a b g  \bar "||"

  d'4 d e c |
  a d b2 \bar "||" \break

  b4 b a b |
  g a g fs \bar "||"

  g e d g |
  g fs g2 \bar "|."
}

altob = \relative c' {
  \global
  d4 d b b |
  e d d d |

  d g g g |
  g fs g2 |

  g4 g fs fs |
  b, e d d |

  d c b d |
  d d d2
}

tenorb = \relative c' {
  \global
  b4 a g g |
  g fs g b |

  g b c e |
  d d d2 |

  e4 b c b |
  b a a a |

  g g d' b |
  a8[ b] c4 b2
}

bassb = \relative c' {
  \global
  g4 fs e d |
  c d g g, |

  b g c a |
  d d g2 |

  e4 e e ds |
  e cs d c |

  b c g b8[ c] |
  d4 d g,2
}

%%%%%%%%%%%%%%%%
%% score 1 %%%%%
%%%%%%%%%%%%%%%%

%%%%%%%%%%%%
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}


%%%%%%%%%%%%%%%%
%% score 2 %%%%%
%%%%%%%%%%%%%%%%
\markup { \caps "Alternative Hamonizations"  }

\score {
  <<
    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \melodya >> }
        \context Voice =
        altos { \voiceTwo << \altoa >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenora >> }
        \context Voice =
        basses { \voiceTwo << \bassa >> }
      >>
    >>
  >>
  \header {
    piece = \markup { \small {Music: Harmony from  \italic "Hymns Ancient and Modern," 1861  }}
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}

%%%%%%%%%%%%%%%%
%% score 3 %%%%%
%%%%%%%%%%%%%%%


\score {
  <<
    \context ChoirStaff <<
      \context Staff = upper <<
        \context Voice =
        sopranos { \voiceOne << \melodyb >> }
        \context Voice =
        altos { \voiceTwo << \altob >> }

      >>
      \context Staff = lower <<
        \clef bass
        \context Voice =
        tenors { \voiceOne << \tenorb >> }
        \context Voice =
        basses { \voiceTwo << \bassb >> }
      >>
    >>
  >>
  \header {
    piece = \markup { \small {Music: Harmony from  \italic "The Hymnal," 1916 }}
  }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}
