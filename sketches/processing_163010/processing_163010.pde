
//Most popular words on Merriam Webster in the past 7 days.

import wordcram.*;

size(500, 500);

background(255, 127, 13);

Word[] wordArray = new Word[] {
    new Word("culture", 100),
    new Word("pedantic", 60),
    new Word("asthetic", 120),
    new Word("ensure", 90),
    new Word("holistic", 20),
    new Word("love", 170),
    new Word("voracious", 75),
    new Word("federalism", 25),
    new Word("comradery", 55),
    new Word("pedagogical", 45),
    new Word("sovereignty", 100),
    new Word("empathy", 80),
    new Word("feminism", 120),
    new Word("integrity", 60),
    new Word("roister", 20),
    new Word("cognitive", 90),
    new Word("diversity", 100),
    new Word("succint", 75),
    new Word("paradigm", 100),
    
    new Word("telegraphic", 10),
    new Word("snuggle", 60),
    new Word("fascism", 10),
    new Word("biweekly", 90),
    new Word("socialism", 20),
    new Word("irony", 150),
    new Word("didactic", 75),
    new Word("caveat", 25),
    new Word("democracy", 145),
    new Word("metaphor", 65),
    new Word("bona-fide", 100),
    new Word("pretentious", 10),
    new Word("hypocrite", 120),
    new Word("disposition", 60),
    new Word("pragmatic", 20),
    new Word("esoteric", 90),
    new Word("ubiquitous", 110),
    new Word("nostalgia", 75),
    new Word("et al", 100),
    new Word("insidious", 30)
  };

WordCram wordcram = new WordCram(this)

  .fromWords(wordArray);

wordcram.drawAll();



