
//  very simple accumulative drawing experiment
//  stephen monslow www.monzP5.wordpress.com
//  hold f to draw
//  press s before f to add lines
//  click mouse to add in a background
//  press g to export as an image

float osc,depth=400;
int inc;


void setup(){
size(800,600,P3D);

  smooth();
  frameRate(60);
  colorMode(HSB, 100);
//  noStroke();



noCursor();
}


void draw(){


 
 if(key == 's') {
   stroke(0);
 } else {
   noStroke();
 }
 
    lights();
 

  translate(width/2, height/2, -depth/2);

  rotateY(frameCount*PI/500);
  

 
if(mousePressed) {
  background(random(255)); 
}
   

  
}


void keyPressed() { 
 
  if (key == 'g') {
      save("image"+random(1000)+".tif");
  }
 
 if (key == 'f'){
 boxx();
 }
}

void  boxx() {
 pushMatrix();
  
  osc = sin(frameCount*0.001)*600;
  
  translate(width/2,height/2);
  rotateX(frameCount/60);
   rotateY(frameCount/60);
    rotateZ(frameCount/50);
    
    
  fill(inc,30,90,100);
  
  box(50,osc*4,50);
  popMatrix();
  inc++;
  if(inc>100) inc = 0;
  
}

