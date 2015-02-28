
float vitesse = 0.05;
float angle = 0;
float rayon = 50;
float centreX,centreY;

void setup() {
  size(400,400);
  smooth();
 
}

void draw() {
  
  background(0);
  
  fill(255);
  
   centreX = mouseX;
   centreY = mouseY;
   
  
  angle += vitesse;
  
  float x = cos(angle) * rayon + centreX;
  float y = sin(angle) * rayon + centreY;
   noStroke();
  ellipse(x,y,15,15);
  stroke(255);
  line(mouseX,mouseY,x,y);
  
  
  
}
