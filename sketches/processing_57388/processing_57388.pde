
PImage fern;

  int x=150;
  int y=150;

void setup(){
  size(300, 250);
  background(255);
  smooth();
  fern = loadImage("fern.jpg");
}

void draw(){
 image(fern, 0, 0); 
  
  //legR
  line(x, y, x+60, y+60);
 //legL
  line(x, y, x-60, y+60);
 //footR
 fill(161, 86, 237); 
 ellipse(x+60, y+60, 20, 20);
 //footL
 ellipse(x-60, y+60, 20, 20);

noStroke();
//body
fill(161, 86, 237);
  ellipse(x, y, 100, 100);
//head
fill(6, 196, 137);
  ellipse(x, y-50, 60, 60);
//eyeL
fill(31, 83, 222);
  ellipse(x-40, y-40, 40, 40);
 fill(0);
  ellipse(x-40, y-40, 20, 20);
//eyeR
fill(31, 83, 222);
  ellipse(x+40, y-40, 40, 40);
fill(0);
  ellipse(x+40, y-40, 20, 20);



 //eyebrowL
 noFill();
 stroke(0);
 strokeWeight(4);
  arc(x-40, y-40, 60, 60, PI, PI+HALF_PI);
  
  //eyebrowR
    arc(x+40, y-40, 60, 60, PI+HALF_PI, TWO_PI);
}

