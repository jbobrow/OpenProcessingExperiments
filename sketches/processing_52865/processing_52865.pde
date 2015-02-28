

float x;
float y;

PShape forms;
PShape formOtop;
PShape formObottom;
PShape formsright;
PShape formCleft;
PShape formCtop;
PShape formCbottom;

void setup ()
{
 size(900, 400);
 smooth();
 forms = loadShape ("leftbarO.svg");
 formOtop= loadShape ("topbarO.svg");
 formObottom = loadShape ("botbarO.svg");
 formsright = loadShape ("rightbarO.svg");
 formCleft = loadShape ("rightbarC.svg");
 formCtop= loadShape ("topbarC.svg");
 formCbottom= loadShape ("botbarC.svg");
}

void draw ()
{
  background (255);
  fill(255, 37, 37);
  stroke(255, 37, 37);
  strokeWeight(29);
  strokeCap(SQUARE);
  line(80, 115, 80, 255); //Mleft
  line(215, 115, 215, 255); //Mright
  noStroke();
  shape (forms, 273, 115, 25, 140); 
  shape (formOtop, 298, 114);
  shape (formObottom, 298, 234);
  shape (formsright, 349, 115, 25, 140);
  shape (formCleft, 420, 115, 25, 140);
  shape (formCtop, 445, 114);
  shape (formCbottom, 445, 238);
  
  //M
noStroke();
  beginShape ();
  vertex (95, 115); 
  vertex (115, 115);
  vertex (150, 195);
  vertex (150, 220);
  vertex (130, 220);
  vertex (95, 135);
  endShape();
  
beginShape ();
  vertex (150, 195); 
  vertex (185, 115);
  vertex (201, 115);
  vertex (201, 135);
  vertex (165, 220);
  vertex (150, 220);
  vertex (150, 195);
  endShape();
  
}

