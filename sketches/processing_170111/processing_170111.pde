
int angle;

void setup() {
  size(200, 200, P3D);
  
  angle = 0;  
}
 
void draw() {
  background(0);
  
lights();
directionalLight(255, 255, 255, 100, 100, 0);
  translate(width/2, height/2);  
  rotateX(radians(mouseY));    
  rotateY(radians(mouseX));  
  
  if(mousePressed){
    angle += 1;  
  if(angle > 360) angle = 0;   
  rotateY(radians(mouseX+angle)); 
  }
  
  beginShape();
  fill(0,255,0);
  vertex(0,  -50,-20);
  vertex(20, -30,-20);
  vertex(20, 30, -20);
  vertex(0,   50,-20);
  vertex(-20, 30,-20);
  vertex(-20,-30,-20);
  vertex(0,  -50,-20);
  endShape();
  
  beginShape();
  vertex(0,  -50,20);
  vertex(20, -30,20);
  vertex(20,  30,20);
  vertex(0,   50,20);
  vertex(-20, 30,20);
  vertex(-20,-30,20);
  vertex(0,  -50,20);
  endShape();
    
    beginShape(QUAD);
     vertex(0,  -50,-20);
     vertex(0,  -70,  0);
     vertex(-35, -35, 0);
     vertex(-20,-30,-20);
     
     vertex(-35,-35,  0);
     vertex(-20,-30,-20);
     vertex(-20, 30,-20);
     vertex(-35, 35,  0);
     
     vertex(-20,30,-20);
     vertex(-35,35,  0);
     vertex(0, 70,   0);
     vertex(0, 50, -20);
     
     vertex(0,  70,  0);
     vertex(0,  50,-20);
     vertex(20, 30,-20);
     vertex(35, 35,  0);
    
     vertex(20,30,-20);
     vertex(35, 35, 0);
     vertex(35, -35,0);
     vertex(20,-30,-20);

     vertex(35, -35, 0);
     vertex(20,-30,-20);
     vertex(0, -50,-20);
     vertex(0, -70,  0);
     
     
     
     vertex(0,  -50, 20);
     vertex(0,  -70,  0);
     vertex(-35, -35, 0);
     vertex(-20,-30, 20);

     vertex(-35,-35, 0);
     vertex(-20,-30,20);
     vertex(-20, 30,20);
     vertex(-35, 35, 0);
     
     vertex(-20,30,20);
     vertex(-35,35, 0);
     vertex(0, 70,  0);
     vertex(0, 50, 20);

     vertex(0, 70,  0);
     vertex(0, 50, 20);
     vertex(20, 30,20);
     vertex(35, 35, 0);
     
     vertex(20, 30, 20);
     vertex(35, 35,  0);
     vertex(35,-35,  0);
     vertex(20,-30, 20);

     vertex(35, -35,  0);
     vertex(20, -30, 20);
     vertex(0,  -50, 20);
     vertex(0,  -70,  0);
     
     endShape(CLOSE);
     
}




