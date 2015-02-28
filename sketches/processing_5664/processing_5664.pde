
float cy, cx;
float angle;



void setup (){

size (500, 500);

background (0);

fill (255);

frameRate (30);



}

void draw(){
  
  float radius = sqrt (sq (mouseX-width/2) + sq (mouseY-height/2));
  
  translate (width/2, height/2);
  
  smooth();
  
  cx = cos (radians(angle));
  cy = sin (radians (angle));
  
  noStroke();
  
  ellipse (radius*cx, radius*cy, 10, 10);
  
  angle -= 5;
  
  if (angle <= -360){
    
    angle=0;
    
    fill (random(255), random(255), random (255));
    
     }
    
    if (mousePressed){
      
      background (0);
      
    }
    
 
    
}





