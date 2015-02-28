
//Dan Sztanga
//dan.sztanga@gmail.com
//(C) Dan Sztanga 2012. All Rights Resserved.
//
//HW_8 While Loops
//
//Controls
//
//Mouse_ Move to change width of rectangles and change color
//Up/Down_ Changtes height of rectangles


float x, ydelt, wd, ht;
color col;

void setup(){
  size(1000, 500);
  background(255);
  smooth();
  
  x = width*.5;
  ydelt = 60; 
  wd = width;
  ht = 50;
  col = color(20, 225, 235, 50);
}

void draw(){
  function();
}

void function(){
  background(255);
  noStroke();
  //Color Change
  //Lower Left Quad
  if (mouseX < width * .5 && mouseY < height * .5) {
    col = color(255, (mouseX/width)*255, (mouseY/height)*255, 50);
  }
  //Upper Left Quad
  else if (mouseX < width * .5 && mouseY > height * .5) {
    col = color((mouseY/height)*255, 255, (mouseX/width)*255, 50);
  }
  //Lower Right Quad
  if (mouseX > width * .5 && mouseY < height * .5) {
    col = color((mouseX/width)*255, (mouseY/height)*255, 255, 50);
  }
  //Upper Right Quad
  if (mouseX > width * .5 && mouseY > height * .5) {
    col = color(255, (mouseX/width)*255, 255, 50);
  }
  fill(col);
  
  //Changes width of rectangles
  wd = (width-mouseX);
  
  //Draws rectangles
  float y = 10;
  while(y < height){
    rectMode(CENTER);
    rect(x, y, wd, ht);
    y = y+ydelt;
  }
}

//Changes height of rectangles
void keyPressed(){
  if(key == CODED){
    if(keyCode == UP){
      if(ht == 1000){
        ht = 1000;
    }
    else{
      ht = ht+50;
      ydelt = ydelt+50;
    }
  }
  else if(keyCode == DOWN){
    if(ht == 50){
      ht = 50;
      }
      else{
        ht = ht-50;
        ydelt = ydelt-50;
      }
    }
  }
}



