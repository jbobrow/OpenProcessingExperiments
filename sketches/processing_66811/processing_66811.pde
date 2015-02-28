
int moveY;
int moveX;

int valueR = 0;
int valueG = 0;
int valueB = 0;

void setup(){
  size(500, 520);
  smooth();
  background(255);
 frameRate(120); 

  moveX = width/2;
  moveY = height/2;
}

void draw(){  
//eraser-rectangle


  fill(255);
  stroke(0);
  rect (moveX,moveY,40,40);
  
//drawingEllipse
  fill(valueR,valueB,valueG);
  noStroke();
  ellipse(mouseX,mouseY,60,60);

}

void keyPressed() {
  if (key == 'a') {
    moveX-=20;
  }  
  else if (key =='d') {
    moveX+=20;
  }
  
    else if (key =='s') {
    moveY+=20;
  }
  
      else if (key =='w') {
    moveY-=20;
  }
  
        else if (key =='r') {
    valueR=255;
  }
        else if (key =='g') {
    valueG=255;
  }
        else if (key =='b') {
    valueB=255;
  }
  
          else if (key =='t') {
    valueR=0;
  }
        else if (key =='h') {
    valueG=0;
  }
        else if (key =='n') {
    valueB=0;
  }
} 


