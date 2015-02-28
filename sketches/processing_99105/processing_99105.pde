
Score sc = new Score();
int[] pitch1 = { 68, 67, 67, 68, 68, 66, 68 };
int[] pitch2 = { 65, 65, 64, 65, 64, 63, 65 };
double [] duration1 = { .3, .3, .3, .3, .3, .3, 3 };


void setup()
{
  Phrase phrase = new Phrase();
  phrase.addNoteList(pitch1, duration1);
  phrase.addNoteList(pitch2, duration1);
  Mod.repeat(phrase, 10);
  addToScore(phrase, 0);

  addVariations(phrase);

  Mod.fadeOut(sc, 6);
  Play.midi(sc);
}

void addToScore(Phrase ph, int chan)
{
  Part part = new Part(10, chan);
  part.addPhrase(ph);
  sc.add(part);
}

void addVariations(Phrase p)
{    
  for (int i = 1; i <= 10; i++) {

    Phrase phr = p.copy();
    phr.setStartTime(i * 6.25);
    phr.setPan(i % 2);
    Mod.shuffle(phr);
    Mod.fadeIn(phr, 6);
    addToScore(phr, i);
  }
}



