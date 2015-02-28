
Score sc = new Score();

int[] pitch2 = { 52,50,52, 50, 52, 50,52 ,55, 52,50,52, 50, 52,50,52 ,57};

double [] duration2 = { .65, .15, .15, .2, .65, .15,.15,.6,.65, .15, .15, .2, .65, .15,.15,.6};
int am = -7;
int bm = -5;
void setup()
{

   Phrase phrase3 = new Phrase();
  phrase3.addNoteList(pitch2, duration2);
   Mod.repeat(phrase3, 2);
    addToScore(phrase3, 2);
     Mod.transpose(phrase3, am);
        Phrase phrase4 = phrase3.copy();
  phrase3.addNoteList(pitch2, duration2);
   Mod.repeat(phrase4, 4);
    addToScore(phrase4, 4);
     Mod.transpose(phrase4, bm);

 addVariations(phrase3);
 addVariations(phrase4);







//  Mod.fadeOut(sc, 2);
  Play.midi(sc);
}

void addToScore(Phrase ph, int chan)
{
  Part part = new Part(40, chan);
  part.addPhrase(ph);
  sc.add(part);
}

void addVariations(Phrase p)
{    
  for (int i = 1; i <= 4; i++) {

    Phrase phr = p.copy();
    Part part = new Part(2, 1);
    part.addPhrase(phr);
 
    sc.add(part);
     Mod.transpose(phr, 31);
    phr.setStartTime(i * 0.25);
    phr.setTempo(i0);
    phr.setPan(i % 2);
    Mod.shuffle(phr);
   
    addToScore(phr, i);

  }
    for (int i = 1; i <= 4; i++) {

    Phrase phr = p.copy();
    Part part = new Part(1, 1);
    part.addPhrase(phr);
 
    sc.add(part);
     Mod.transpose(phr, 19);
    phr.setStartTime(i * 0.25);
    phr.setTempo(i0);
    phr.setPan(i % 2);
    Mod.shuffle(phr);
   
    addToScore(phr, i);
   
  }


}
