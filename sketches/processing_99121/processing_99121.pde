

Score sc = new Score();
int[] pitch = { 60, 60, 62, 64, 72, 64, 60 };
int[] pitch2 = { 72, 70, 67, 72, 62, 65, 72 };
int pitch3 = (int) random(60, 72);
int pitch4 = (int) random(60, 65);
double [] duration = { .5, .5, .5, .5, .5, .5, 1 };
double [] duration2 = { .1, .3, .5, .5, 1 };

void setup()
{
  Phrase phrase = new Phrase();
  phrase.addNoteList(pitch, duration);
  Mod.repeat(phrase, 8);
  addToScore(phrase, 0);
  
  Phrase phrase2 = new Phrase();
  for (int i = 0; i < pitch2.length; i++) {
  Note n = new Note(pitch2[i], random(0,.3), 30);
  phrase2.addNote(n);
  Part piano = new Part(1,1);
  piano.addPhrase(phrase2);
  Mod.repeat(phrase2,2);
  sc.addPart(piano);
  }
  
  Phrase phrase3 = phrase2.copy();
  phrase3.setStartTime(5.0);
  Mod.transpose(phrase3,5);

  Phrase phrase4 = new Phrase();
  phrase.addNoteList(pitch, duration);
  Mod.repeat(phrase4, 8);
  addToScore(phrase4, 1);
  
  Phrase phrase5 = new Phrase();
  phrase5.setStartTime(8.0);
  addToScore2(phrase5, 1);
  //Mod.palindrome(phrase5);
  phrase5.addNoteList(pitch4, duration2);

  addVariations(phrase);
  addVariations(phrase3);

  Mod.fadeOut(sc, 6);
  View.notate(sc); 
  Play.midi(sc);
  Write.midi(sc, "file3.midi");
}

void addToScore(Phrase ph, int chan)
{
  Part part = new Part(11, chan);
  part.addPhrase(ph);
  sc.add(part);
}

void addToScore2(Phrase ph2, int chan)
{
  Part part2 = new Part(74, chan);
  part2.addPhrase(ph2);
  sc.add(part2);
}

void addVariations(Phrase p)
{    
  for (int i = 1; i <= 8; i++) {

    Phrase phr = p.copy();
    phr.setStartTime(i * 5.25);
    phr.setPan(i % 2);
    Mod.shuffle(phr);
    Mod.palindrome(phr);
    Mod.fadeIn(phr, 6);
    addToScore(phr, i);
  }
}



