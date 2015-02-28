
// SIMONE ROTH, PS1_1, emotion: shock // 

void setup() {
  size(400, 400);
  smooth ();
}

void draw() {
  background (162,240,181); // R G B
  
  // head fill 
  strokeWeight (3);
  fill (229, 109, 109);
  ellipse (200, 200, 250, 250);

  // left eye
  strokeWeight (5);
  fill(109, 196, 229);
  ellipse (140, 160, 40, 40);
  
  // right eye
 strokeWeight (5); 
 fill (109, 196, 229);
 ellipse (260, 160, 40, 40);

  // nose
  strokeWeight (5);
  fill (8, 26, 33);
  ellipse(200, 200, 15, 15);

  // mouth
  strokeWeight (5);
  fill (124, 56, 64);
  ellipse (200, 260, 80, 80);

PFont font;
font = loadFont("CharcoalCY-48.vlw"); 
textFont(font);
fill(250, 250, 250);
text("SHOCKED!", 95, 370 );


}


