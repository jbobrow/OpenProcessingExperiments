
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
  
   pushMatrix();
   translate(mouseX,mouseY);
   rotate(angle);
   
   stroke(255);
   line(0,0,50,0);
   
   noStroke();
   translate(50,0);
   ellipse(0,0,15,15);
   
   
  
  
  popMatrix();
  
}
