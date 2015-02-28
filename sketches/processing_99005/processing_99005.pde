
Score sc = new Score();
int[] pitch = { 
  77, 76, 74, 76, 77, 79, 76, 76, 72, 74, 76, 74, 72, 72
};


double [] duration = {
  .2, .3, .3, .3, .3, .3, .5, .5, .5, .3, .3, .5, .5, 2.2
};

Score sc2 = new Score();
int[] pitch2 = {
  62, 60, 58, 64, 60, 64
};
double [] duration2 = {
  1.7, 1.5, 1.6, 0.6, 0.6, 1
};


void setup()
{
  Phrase phrase = new Phrase();
  phrase.addNoteList(pitch, duration);
  Mod.repeat(phrase, 5);
  addToScore(phrase, 0);

  Phrase phrase2 = new Phrase();
  phrase2.addNoteList(pitch2, duration2);
  Mod.repeat(phrase2, 5);
  addToScore(phrase2, 0);


  addVariations(phrase);

  Mod.fadeOut(sc, 6);
  View.notate(sc);
  Play.midi(sc);
  Write.midi(sc, "/Users/agnes128628/Desktop/a.mid");
 
}

void addToScore(Phrase ph, int chan)
{
  Part part = new Part(1, chan);
  part.addPhrase(ph);
  sc.add(part);
  sc2.add(part);
}

void addVariations(Phrase p)
{    
  for (int i = 1; i <= 3; i++) {

    Phrase phr = p.copy();
    phr.setStartTime(i *3.86);
    phr.setPan(i % 1.5);
    Mod.shuffle(phr);
    Mod.palindrome(phr);
    Mod.elongate(phr,.9);
    Mod.transpose(phr, 5);
    Mod.fadeIn(phr, 3);
    Mod.fadeOut(phr, 6);
    
    addToScore(phr, i);
  }
}




