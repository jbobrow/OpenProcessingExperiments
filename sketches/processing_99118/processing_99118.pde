
Score sc = new Score();
Part part1 = new Part("Piano", 1, 0);
Part part2 = new Part("Harmonica", 23, 0);

int[] pitch = {
  83, 74, 81, 74, 83, 74, 81, 74, 83, 74, 83, 81, 74,
};
double [] duration = { 
  .3, .3, .3, .3, .3, .3, .3, .3, .3, .3, .3, .6, 1.1
};
int[] pitch2 = {
  48, 55, 60, 48, 55, 60
};
double [] duration2 = {
  .6, .6, 1.2, .6, .6, 1.35
};

void setup()
{
  Phrase phrase = new Phrase();
  phrase.addNoteList(pitch, duration);
  Mod.repeat(phrase, 6);
  
  Phrase phrase2 = new Phrase();
  phrase2.addNoteList(pitch2, duration2);
  Mod.repeat(phrase2, 4);
  phrase2.setStartTime(10);
  
  Phrase phrase3 = phrase.copy();
  Mod.transpose(phrase3, 12);
  Mod.repeat(phrase3, 5);
  Mod.inversion(phrase3);
  Mod.increaseDynamic(phrase3,20);
  Mod.expandIntervals(phrase3,1.6);
  phrase3.setStartTime(30);
  
  Phrase phrase4 = phrase2.copy();
  Mod.transpose(phrase4,5);
  Mod.inversion(phrase4);
  Mod.shuffle(phrase4);
  Mod.repeat(phrase4, 3);
  Mod.expandIntervals(phrase4,1.2);
  phrase4.setStartTime(30);
  
  Phrase phrase5 = phrase.copy();
  Mod.repeat(phrase5,5);
  phrase5.setStartTime(58);
  
  Phrase phrase6 = phrase.copy();
  Mod.repeat(phrase6,5);
  phrase6.setStartTime(58);
  
  part1.addPhrase(phrase);
  part1.addPhrase(phrase2);
  part2.addPhrase(phrase3);
  part2.addPhrase(phrase4);
  part1.addPhrase(phrase5);
  part1.addPhrase(phrase6);
  
  sc.add(part1);
  sc.add(part2);

  View.notate(sc); 
  Play.midi(sc);
}

