
void setup () {
  size (250, 250);
  background (255);
  smooth ();
  frameRate (5);
};
 
float a;
float b;
 
void draw () {
  fill (#258ABF, 25);
  noStroke ();
 
 
  a += 10;
  stroke (#258ABF,10);
   
  for (b = random(b); b < 350; b += 10) {
    line (width/2, height/2, random(b), random(b));
     
    line (width/2+50, height/2+250, random(b), random(b));
    line (width/2-250, height/2-250, random(b), random(b));
    line (width/2+250, height/2+250, random(b), random(b));
    line (width/2-250, height/2-250, random(b), random(b));
     
    line (width/2, height/2+250, random(b), random(b));
    line (width/2, height/2-250, random(b), random(b));
    line (width/2, height/2+260, random(b), random(b));
    line (width/2, height/2-260, random(b), random(b));   
  }
   
};            
