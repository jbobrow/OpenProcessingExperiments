
Etude e;
float notes[][] = {{79,0.5}, 
                   {84,1.0}, 
                   {72,0.3}, 
                   {65,0.2},
                   {84,0.5},
                   {65,1.0}
                   };
                   
float notes1[][] = {{65,1.0}, 
                   {61,1.0}, 
                   {60,1.0}, 
                   {61,1.0}};

float notes2[][] = {{79,0.5}, 
                   {84,1.0}, 
                   {72,0.3}, 
                   {65,0.2},
                   {84,0.5},
                   {72,0.5},
                   {65,1.0},
                   {72,0.5}};
                   
float notes3[][] = {{48,0.5}, 
                   {60,1.0}, 
                   {72,0.3} };


void setup() {
  noLoop();
  size(200, 100);

  e = new Etude(this);
  e.createScore("py");
  
  e.createPart("part1");
  e.createPart("beat");
  e.createPart("bass");

  e.createPhrase("intro",notes);
  e.createPhrase("phr1", notes2);
  e.createPhrase("phrbeat", notes1);
  e.createPhrase("phrbass", notes3);
  e.createPhrase("end",notes);
  
  e.setPartChannel("part1", 1);
  e.setPartChannel("beat", 2);
  e.setPartChannel("beat", 3);
  e.setPartChannel("bass", 3);
  
  e.setPhraseInstrument("intro", e.EPIANO);
  e.setPhraseInstrument("phr1", e.EPIANO2);
  e.setPhraseInstrument("phrbass", e.EPIANO);
  e.setPhraseInstrument("phrbeat", e.SYNTH_DRUM);
  e.setPhraseInstrument("end", e.SYNTH_BASS);
  

  e.addPartPhrase("part1", "intro");
  e.addPartPhrase("part1", "phr1");
  e.addPartPhrase("beat", "phrbeat");
  e.addPartPhrase("bass", "phrbass");
  e.addPartPhrase("part1", "end");

  e.addScorePart("py", "part1");
  e.addScorePart("py", "beat");
  e.addScorePart("py", "bass");
  
  e.repeatPhrase("phrbeat", 10);
  e.repeatPhrase("phr1", 16);
  e.repeatPhrase("phrbass", 5);
  e.repeatPhrase("end", 1);
  
  e.setPhraseStartTime("intro",1);
  e.setPhraseStartTime("end",20);
  e.setPhraseStartTime("phr1",8);
  e.setPhraseStartTime("phrbeat",8);
  e.setPhraseStartTime("phrbass",10);
  
}

void draw() {
  e.playMIDI("py");
  int inst = (int)random(0, 127);
  e.setPartInstrument("part1", inst);
  //e.stopMIDI();
}



