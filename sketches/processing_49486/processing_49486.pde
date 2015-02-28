
void setup () {
  size (200,200);
  frameRate (30);
}

void draw () {
  background (92,155,123);
  stroke (0);
  fill (frameCount/2);
  rectMode (CENTER);
  rect (width/2,height/2,mouseX+10,mouseY+10);
}

void keyPressed () {
  println (key);
}

