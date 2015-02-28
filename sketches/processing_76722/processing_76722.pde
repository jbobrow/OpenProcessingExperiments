
float a = 0;

float[] x = new float[20];
float[] y = new float[20];
float segLength = 9;



void setup(){
 size (1000,250);
 background ( 170,170,170);
 }



void draw(){
a = a + 0.4;

background ( 170,170,170);  

  fill( 238,238,238);
    line (200,0,200,height);
    line (400,0,400,height);
    line (600,0,600,height);
    line (800,0,800,height);

rect (0,75,1000,80);

fill (0,0,0); 
    ellipse (a,115,20,20);
    fill (255,255,255);
    
    rect (990,85,10,60);
    
    rect (120,15,10,60);
    rect (320,15,10,60);
    rect (520,15,10,60);
    rect (720,15,10,60);
    rect (920,15,10,60);
 
    rect (120,155,10,60);
    rect (320,155,10,60);
    rect (520,155,10,60);
    rect (720,155,10,60);
    rect (920,155,10,60); 
  
  if (a > 25) {
       rect (0,85,10,60);  
   }
   
   
  if ( a > 60) {
        fill (51,51,51);
        rect (0,75,1000,80);
        ellipse (a,115,20,20);
            
        fill (255,255,255);
        rect (0,85,10,60);
        fill (255,255,255);
        rect (990,85,10,60);
}

  if (a >75) {
       fill (51,51,51);
       rect (120,65,60,10); 
       rect (120,155,60,10);
}
   if (a > 85) {
       fill (51,51,51);
       rect (320,65,60,10);
       rect (320,155,60,10);
     
   
}
   if (a > 90) {
       fill (51,51,51);
       rect (520,65,60,10);
       rect (520,155,60,10);
     
    
}
    if (a > 95) {
       fill (51,51,51);
       rect (720,65,60,10);
       rect (720,155,60,10);
     
    
}
    if (a > 100) {
       fill (51,51,51);
       rect (920,65,60,10);
       rect (920,155,60,10);
          
}

    if (a > 105) {
      
      float[] x = new float[20];
      float[] y = new float[20];
      float segLength = 9;

 
  smooth(); 
  strokeWeight(5);
  stroke(0, 100);
 
    
}
    if (a > 120) {
       fill (0,187,0);
       rect (990,85,10,60);
  }
  
  
   if (a >135 && a <300) {
     
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
 
  }
if (a >700 && a <900) {
     
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
   }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

