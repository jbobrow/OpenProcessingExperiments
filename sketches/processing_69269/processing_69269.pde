
void setup(){
  size(800, 800);
  background(170);
  smooth();
  noFill();
 
}

int tileHeight = 400;
int tileWidth = 400;
//setting a fucntion to draw a spiral as this has to be repeated throughout the pattern
void drawSpiral() {
  stroke(58, 222, 1);
  beginShape();
  for(int i=0; i<435; i++)
  {
    float stretch = 3.5;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape();
  
  //green pattern  
  stroke(58, 222, 105);
  beginShape();
  for(int i=0; i<435; i++)
  {
    float stretch = 3;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape();
  
  //light green pattern
  stroke(58, 222, 135);
  beginShape();
  for(int i=0;i<435;i++)
  {
    float stretch = 2.5;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape();
  
  //light blue pattern
  stroke(58, 222, 165);
  beginShape();
  for(int i=0;i<435;i++)
  {
    float stretch = 2;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape();
  
  //blue pattern
  stroke(58, 222, 195);
  beginShape();
  for(int i=0;i<435;i++)
  {
    float stretch = 1.5;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape();
  
  //inner most blue pattern
  stroke(26, 179, 225);
  beginShape();
  for(int i=0;i<435;i++)
  {
    float stretch = 1;
    float x = (i*stretch)*sin(i/0.4) + tileWidth/2;
    float y = (i*stretch)*cos(i/0.4) + tileHeight/2;
    if(x >= 0 && x <= tileWidth && y >= 0 && y <= tileHeight) {
      curveVertex(x,y);
    } else {
      break;
    }
  }
  endShape(); 

}

//repeating the pattern in a 4x4 grid
void draw() {
  for(int row = 0; row < 2; row++) {
      translate(0, tileHeight * row);
      drawSpiral();
  }
  translate(tileWidth, -tileHeight);
  for(int row = 0; row < 2; row++) {
      translate(0, tileHeight * row);
      drawSpiral();
  }
  //repeating the pattern on the far ends
  translate(-tileWidth/2, -tileHeight/2);
  drawSpiral();
  translate(-tileWidth, 0);
  drawSpiral();
  translate(2*tileWidth, 0);
  drawSpiral();
 
}
