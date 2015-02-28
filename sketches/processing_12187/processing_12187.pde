
void setup(){
  //the canvas
  size(100,200);
  //background image
  PImage b;
  b = loadImage("sushi.jpg");
  b.resize(100,200);
  background(b);
}

void draw(){
 
  
  //this is a black and white hairmonster with a red headband
  fill(0);
  //top of the head
  rect(20,150,66,20);
  //left side of hair
  rect(20,170,12,30);
  //right side of hair
  rect(74,170,12,30);
  //toptrihead
  triangle(20,150,86,140,86,150);

  //face
  stroke(0);
  fill(255);
  rect(32,170,42,30);

  //eyes
  stroke(0);
  //left
  line(40,184,45,184);
  line(43,182,43,186);
  //right
  line(61,184,66,184);
  line(64,182,64,186);

  //mouth
  stroke(255,0,0);
  fill(255,0,0);
  ellipseMode(CENTER);
  ellipse(53,198,6,3);

  //headband
  stroke(255,0,0);
  line(20,160,86,160);
  line(20,161,86,161); 
}


