
PImage cupcakes;
PFont font;
int click = 0;
int h = 0;




void setup () {
  size (960, 750);
  background (156, 148, 16);
  cupcakes = loadImage ("cupcakes.jpg");
  font = loadFont("HiraKakuStdN-W8-48.vlw");
}

void draw () {
  
  image( cupcakes, 0, 0, 960, 750);

   if (click == 0) {
    textFont ( font, 32);
    fill (250, 100);
    text ("Hungry?", 50, 415);}

  if ( click == 1) {
  textFont ( font, 400);
  fill (random (250), 250);
  text ("YES", 10, 550);
  noStroke();
  fill(250,250);
  ellipse(random(960), random(750), 100, 100);}
 }

 


void mouseClicked () {  
  if (click == 0) {
    click = 1;
  } else {
  click = 0;
}
}

