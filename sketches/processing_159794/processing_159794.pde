
void setup() {
  size(600,600);
  
}


void draw() {
  beginShape();
   noStroke();
fill(102,51,51);
vertex(450, 400);
vertex(160, 400);
vertex(100, 550);
vertex(500, 550);
endShape(CLOSE);
  
  if (mouseX > width/2)
  {
    float x = 0;
 PFont f; 
  f = createFont("DamascusBold-48",16,true); 
    textFont(f,48);                 
  fill(255,245,92); 
  textAlign(CENTER);  
  text("ROSEBUD",300,480);
 
  float theta;
float globeRadius=100;
frameRate(5);
ellipseMode(CENTER);
float distance=random(0,globeRadius);
theta=(random(0, 2*PI));
noStroke();
fill(255);
ellipse(.5*width+distance*cos((PI/2)*theta), .5*width+distance*sin((PI/2)*theta),10,10); 


  }else{
 
  fill(235,255,255,30);
stroke(235,255,255,30);
ellipse(300,250,400,400);

  }
}


