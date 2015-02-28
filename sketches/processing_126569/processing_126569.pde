


boolean isMousePressed = false;

void setup(){
  size(302,242);
  background(255);
  smooth();
  rectMode(CORNER);
  drawKeys();
}

// not used, but needed in order for
// things to work
void draw(){ 
}

void mousePressed(){
  isMousePressed = true;
  drawKeys();
}

void mouseReleased(){
  isMousePressed = false;
  drawKeys();
}


void drawKeys(){
  drawWhiteKey(0,0,75,240,0,15);
  drawWhiteKey(75,0,75,240,15,15);
  drawWhiteKey(150,0,75,240,15,15);
  drawWhiteKey(225,0,75,240,15,0);
  
  drawBlackKey(60,0,30,150);
  drawBlackKey(135,0,30,150);
  drawBlackKey(210,0,30,150);
}




void drawBlackKey(int myX,int myY,int myWidth,int myHeight){
  
  if (isMousePressed) {
    if((mouseX > myX)&&(mouseX < myX + myWidth)&&(mouseY < myHeight)){
        fill(100);
    }else{
        fill(0);
    } 
  } else{
    fill(0);
  }
  
  rect(myX, myY, myWidth, myHeight); 
}




void drawWhiteKey(int myX,int myY,int myWidth,int myHeight, int addToLeft, int subtractFromRight){

  if (isMousePressed){
    
    if(mouseY < 150){
      if( (mouseX > (myX + addToLeft)) && (mouseX < (myX + (myWidth - subtractFromRight )))){
        fill(220);
      }else{
        fill(255);
      }
  }else{
    if( (mouseX > (myX)) && (mouseX < (myX + myWidth ))){
      fill(220);
    }else{
      fill(255);
    } 
  }
    
  }else{
    fill(255);
  }

  stroke(0);
  strokeWeight(2); 

  rect(myX, myY, myWidth, myHeight); 
}

