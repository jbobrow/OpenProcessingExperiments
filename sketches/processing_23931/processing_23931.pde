
void setup () {
  size (100,100);
  smooth ();
  frameRate(30);
}

void draw () {
  // Background
  background (169,250,226);
  
  //head
  stroke (0);
  fill (246,250,149);
  rect (25,20,50,30);
  //left eye
  fill (149,250,247);
  ellipse (40,30,10,10);
  // right eye
  fill (149,250,247);
  ellipse (60,30,10,10);
  //mouth
  stroke (250,149,152);
  line(32,42,70,42);
  //body
  stroke(0);
  fill (252,166,231);
  ellipse (50,65,30,30);
  //left arm
  stroke (0);
  line(20,70,40,55);
  //right arm
  line (80,70,60,55);
  //left leg
  line (45,80,45,90);
  //right lef
  line (55,80,55,90);
  //left antenna
  line (40,10,45,20);
  //right antenna
  line (45,20,55,10);
  
}

