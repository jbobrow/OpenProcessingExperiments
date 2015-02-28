

void setup() {
 
  size(440,440);
  background(255);
  frameRate(60);
  }
 
 
 void draw(){
   background(255);
    for(int x = 10; x<width-50; x+=60) {
    for(int y = 10; y<height-50; y+=60) {

      float colr = mouseY;
      float sz = mouseX;
      float m = map (colr, 0, 440, 0, 255);
      float s = map (sz, 0, 440, 0.0, 5.0);
      stroke (m);
      strokeWeight(s);
      triantopright(x,y);
      trianbottomright(x,y); 
      trianbottomleft(x,y);
    
  } // for x
 } // for y
} // draw
 
 
 
//Draw a diagonal line every 5px.
//It's actually diagonal lines in areas on 5x5px.
void triantopright(int x, int y) {
  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      // draw: random color for each stroke
      line(x+i,y+j,x+i+5,y+j+5);  
    }
  } 
}


void trianbottomright(int x, int y) {
  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      // Save (freeze) the pattern
      pushMatrix(); 
      // Rotate de pattern
      translate(width-5,0);
      float radianes = HALF_PI;
      rotate(radianes);
      // draw: random color for each stroke
      line(x+i,y+j,x+i+5,y+j+5);  
      // release de pattern
      popMatrix();
    }
  } 
}


void trianbottomleft(int x, int y) {

  for(int i = 0; i <= 50; i+=5) {
    for(int j = 0; j <= i; j+=5) {
      // Save (freeze) the pattern
      pushMatrix(); 
      // Rotate de pattern
      translate(width-5,height-5);
      float radianes = PI;
      rotate(radianes);
      // draw: random color for each stroke
      line(x+i,y+j,x+i+5,y+j+5);  
      // release de pattern
      popMatrix();
    }
  } 
}

