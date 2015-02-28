







////////* How to use *////////

// Click=Change to yellow
// Key up=Change to white
// Key down=Change to blue
// Space key=Reset

//////////////////////////////







//////////* Source Code *//////////

int MaxColor;
int CurrentColor;

void setup() {
  size(400, 400);
  MaxColor=100;
  colorMode(RGB, MaxColor);
  background(CurrentColor);
  frameRate(25);
  smooth();  
}

void draw() {  
  fadeOut();
  
  float rx=pmouseX+random(-60, 60);
  float ry=pmouseY+random(-60, 60);
  
  stroke(CurrentColor, CurrentColor, MaxColor, 30);
  strokeWeight(random(0.7, 5));
  point(rx, ry);
  strokeWeight(1);
  line(width/2, height/2, pmouseX, pmouseY);
   
  for(int e=0; e<7; e++) {
  ////////////////////
  pushMatrix();
  ////////////////////
  for(int i=0; i<25; i++) {
    strokeWeight(random(1, 2.3)); 
    point(pmouseX, pmouseY);
    rotate(radians(20));
    translate(8, 0);
  }
  ////////////////////
  popMatrix();
  ////////////////////
  
  rotate(radians(51.4));
  translate(10, 0);
}
 
}



void fadeOut() {
  noStroke();
  fill(0, 0.43);
  rectMode(CORNER);
  rect(0, 0, width, height);
}

void keyPressed() {
  switch(keyCode) {
    /////////////////////////////
    case UP: 
      if(CurrentColor < MaxColor) 
          CurrentColor+=10;
    break;
    /////////////////////////////
    case DOWN: 
      if(CurrentColor > 0)
          CurrentColor-=10;
    break; 
    /////////////////////////////
    case ' ': 
      background(0);
    break;
    /////////////////////////////    
  }
}

void mousePressed() {
  if(mouseButton==LEFT) { 
      /////////////////////////////
      if(mouseButton==LEFT) {
        if(CurrentColor < MaxColor) 
          MaxColor-=10;
          CurrentColor+=10;
      }  
      /////////////////////////////
  }
}




