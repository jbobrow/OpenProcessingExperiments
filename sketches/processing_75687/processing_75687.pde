
//Nahyung Kim
//Introduction to Digital Media Fall 2012
//Section A
//9.11.12

float randomDiameter=10;
float strokeGray = 198;

void setup () {
  size (1200,600);
  background(54,92,173);
}

void draw () {
  noStroke ();
  fill (171, 195, 245,2);
  rect (0,0,width,height);
  
  stroke(strokeGray);
  
  strokeWeight(2);
  
  smooth ();
  
  fill (255,248,100);
  
  if (randomDiameter < 150) {
    randomDiameter++;
  }
  
  else {
    randomDiameter=10;
  }
  
  ellipse (mouseX,mouseY,randomDiameter,randomDiameter);
}

void mouseClicked () {
  
  if(strokeGray == 198){
    strokeGray = 240;
  }
  
  else{
    strokeGray=198;
  }
}
