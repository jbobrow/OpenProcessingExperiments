
float[] xpos = new float[100];
float[] ypos = new float[100];

void setup() {
  size(600,600);   
  for ( int i = 0 ; i < xpos.length; i++ ) {
    xpos[i] = 0; 
    ypos[i] = 0; 
  } 
  

}

void draw() {
 background(0); 
 
 
//   for (int i = 0; i < width; i++ ) {
//   float r = map(i, 0, width, 100, 255);
//   float g = map(i, 0, width, 200, 150); 
//   stroke(r,g,100); 
//   line(i, 0, i, height);
// } 
 
 
  xpos[xpos.length - 1] = mouseX;
  ypos[ypos.length - 1] = mouseY; 
  
  for ( int i = 0 ; i < xpos.length-1; i++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  } 
  noCursor();
  noStroke(); 
  for (int i = 0 ; i < xpos.length - 1; i++ ) {
    float b = map(i, 0, xpos.length, 0, 255);
    float sz = map(i, 0, xpos.length, 0, 50); 
    //fill(b); 
    //ellipse(xpos[i], ypos[i], sz, sz); 
    stroke(b);  
    strokeWeight(sz); 
    line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]); 
  } 
  
  //ellipse(mouseX, mouseY, 25, 25); 
    
} 


