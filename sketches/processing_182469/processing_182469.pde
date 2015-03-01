
void setup() {
  size (750, 750);
  noFill();
  stroke(100, 120, 120);
  smooth();
}

void draw() {
  background(255);
 
  float maxX = (float)120/width*mouseX;
  float maxY = (float)120/width*mouseY;
  
translate(width/2, height/2);
for (float i = 0; i < 360; i+=2) {
  float x = sin(radians(i)) * maxX;
    float y = cos(radians(i)) * maxY;
   
    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount));
    rect(100, 100, 100, 100);
    stroke(0);
    popMatrix();
    
  
    pushMatrix(); 
    translate(-x, -y);
    rotate(radians(i-frameCount));
    rect(100, 100, 100, 100);
    stroke(0);
    popMatrix();
    
    pushMatrix();
    translate(x, y);
    rotate(radians(i-frameCount));
    rect(50, 50, 50, 50);
    stroke(0);
    popMatrix();
    
 
    pushMatrix(); 
    translate(-x, -y);
    rotate(radians(i-frameCount));
    rect(50, 50, 50, 50 );
    stroke(0);
    popMatrix();

   }
}


