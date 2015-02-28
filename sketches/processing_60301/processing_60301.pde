
//modified cod
//source: http://www.reddit.com/r/processing/comments/lm78l/some_quick_sketches_using_rotating_concentric/

int numCrescentsPerSide=4;
int numPixelsPerColumn= 900/numCrescentsPerSide;
int numConcentricCircles=7;

void setup () {
  size(800,900);
  frameRate(120);
  background(200,150,100);
  noStroke();
  smooth();
}

void draw () {
  
  background(mouseY,0,0,75);
  for(int i = 1; i <= numCrescentsPerSide; i++) {
   for(int j = 1; j <= numCrescentsPerSide; j++) {
     
    int x = i*numPixelsPerColumn-numPixelsPerColumn/2;
    int y = j*numPixelsPerColumn-numPixelsPerColumn/2;
    int size = (int)(numPixelsPerColumn/numConcentricCircles*.5)+30;
    
    fill(0,100,0,50);
    int borderSize =(int)(numPixelsPerColumn*0.8);
    ellipse(x, y, borderSize, borderSize);
    
    for(int k=numConcentricCircles; k>=1;k--) {
      drawCrescentOrbiters(x, y, k*size, (j+i)*10, 0, k*1.2);
    }
    
   }
  }
  
}



void drawCrescentOrbiters(int x, int y, int cSize, int startingOffset, int differenceOffset, float speed) {

  fill(200,0,50);
  drawOrbitingCircle(x, y, cSize+50, 10, speed, startingOffset);
  
  fill(100,0,0);
  drawOrbitingCircle(x, y, cSize+20, 30, speed, startingOffset+differenceOffset);
}

void drawOrbitingCircle(int x, int y, int cSize,  int distance, float speed, int offset) {

     ellipse(x+sin(radians(frameCount+offset)*speed)*distance, 
          y+cos(radians(frameCount+offset)*speed)*distance, cSize, cSize);
}

