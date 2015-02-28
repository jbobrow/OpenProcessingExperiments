

//
//  ARRAY HOMEWORK
//
//------------------------------------------

PFont font;

String[]arraySubject = {
  "Der Mann ", 
  "Wolf ", 
  "Peter ", 
  "Wolf Peter ",
  "Mr. Wolf ",
  "Hero ",
  "Der Barbar ",
  "Der Stirnlappenbasilisk ",
  "Knecht Ruprecht ",
  "Captain Obvious ", //10
  "Wolfs Mama ",
  "Gi ",
  "Ein Pinguin ",
  "Eine Gruppe Touristen ",
  "Gott ",
  "Hannah "
  
  
};

String[]arrayDescriptor = {
  "hackt ", 
  "trinkt ", 
  "isst ", 
  "spritzt ",
  "sticht ",
  "leckt ",
  "nimmt ",
  "piekst ",
  "kriegt ",
  "kocht ",
  "belabert ",
  "massakriert ",
  "rüttelt ",
  "streichelt ",
  "züngelt ",
  "schlägt "
};

String[]arrayObject = {
  "den Patienten.", 
  "Wolf.", 
  "die Banane.", 
  "den kasten Bier.",
  "den Knaben.",
  "Hannah.",
  "die Kokosnuss.",
  "den Lebenstrank.",
  "China.",
  "Niemanden.",
  "einen Krebskranken.",
  "das Brötchen.",
  "Desoxyribonukleinsäure.",
  "den Bundesverteidungsminister.",
  "eine Leber.",
  "den kleinen Finger."
};


//------------------------------------------


void setup() {
  size(600, 500);
  //background(0); 
  frameRate(5);
  /*font = loadFont("Helvetica");*/
//textFont(font);
  textSize(14);
  
}

//------------------------------------------

void draw() {
  
  background(0);
  for(int i= 0;i<16;i++){
  int w = int(random(0,16));
  int t = int(random(0,16));
  int f = int(random(0,16));
  textAlign(CENTER);
  text("Alles gute zum Geburtstag", width/2, 20);
  fill(#25E309);
  
  text(arraySubject[w] + arrayDescriptor[t] + arrayObject[f], width/2, 40 + 30*i);
  
  }
}

void mousePressed(){
  noLoop();
  
}

void mouseReleased(){
  loop();
}


String name(String begin)
{
  String name = begin;
  if(day()<10) name+="0";
  name+=String.valueOf(day());
  name+=".";
  if(month()<10) name+="0";
  name+=String.valueOf(month());
  name+=".";
  name+=String.valueOf(year());
  name+="_";
  if(hour()<10) name+="0";
  name+=String.valueOf(hour());
  name+=":";
  if(minute()<10) name+="0";
  name+=String.valueOf(minute());
  name+=".jpg";
  return name;
}


