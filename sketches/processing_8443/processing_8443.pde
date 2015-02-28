

void setup() {  
  size (500, 500);  
  tint (random (0,255), random (0,255), random (0,255));
  smooth();  
  noCursor (); 
  strokeWeight(1); 
  frameRate (100);  
}  
void draw() {  
  
  if (keyPressed == true) {   
    saveFrame();  
    background (random (0,255), random (0,255), random (0,255));   
  } 

  float a = random ( mouseY+100, mouseX+100 ) ;  
  stroke (random (0,255),random (0,255), random (0,255));
  line ( 0, a, mouseX, mouseY ); 
  stroke (random (0,255),random (0,255), random (0,255)); 
  line( 500, a, mouseX, mouseY ); 
} 







