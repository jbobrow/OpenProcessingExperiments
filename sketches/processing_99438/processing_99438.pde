
Score score = new Score();
float tempo = 200;
float S = 60/tempo/4;
Phrase phr1 = new Phrase();
Part part1 = new Part(8);


void setup(){
  phrase();
  
  part1.addPhrase(phr1);
  sectA(phr1);
  sectB(phr1);
  sectA2(phr1);
  part1.addPhrase(phr1);
  score.addPart(part1);
  Play.midi(score);
}

void phrase(){
  for(int p=24; p<=84; p++){
  Note note = new Note(p,S,p);
  float m = map(p,24,84,0.0,1.0);
  note.setPan(m);
  phr1.addNote(note);
  }
  for(int p=84; p>=24; p--){
  Note note = new Note(p,S,p);
  float m = map(p,24,84,0.0,1.0);
  note.setPan(m);
  phr1.addNote(note);
  }
}

void sectA(Phrase p){    
  for (int i = 1; i <= 3; i++) {

    Phrase phr = p.copy();
    phr.setStartTime(i*120*S);
    Mod.randomize(phr,i*2);
    part1.addPhrase(phr);
  }
}

void sectB(Phrase p){    
  for (int i = 1; i <= 3; i++) {

    Phrase phr = p.copy();
    phr.setStartTime((i+5)*120*S);
    Mod.shuffle(phr);
    Mod.transpose(phr,i*3);
    part1.addPhrase(phr);
  }
}

void sectA2(Phrase p){    
  for (int i = 1; i <= 3; i++) {

    Phrase phr = p.copy();
    phr.setStartTime(i*120*S);
    Mod.randomize(phr,(4-i)*2);
    part1.addPhrase(phr);
  }
}



