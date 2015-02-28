
float yPos = 50;

void setup () {
  size (250, 250);
  
  for(int y=20; y<=300; y+=4){
  for(int x=20; x<=300; x+=4){
    strokeWeight (2);
    stroke (88);
    point (x-20, y-20);
    //repetitive points
  }
}
  
  frameRate (30);
}

void draw () {

  yPos = yPos -5;
  if (yPos < 0 ) {
    yPos = 300;
  }
  strokeWeight (3);
  smooth ();
  stroke (143,213,232,80);
  fill (28,128,155,80);
  ellipse (mouseX, mouseY, yPos, 30);
  //follow mouse, and shrink the size according to yPos
  
  stroke (234,163,226,80);
  fill (137,41,126,80);
  ellipse (mouseY, mouseX, 30, yPos);


}

