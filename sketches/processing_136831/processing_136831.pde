
/*
the Tears :
Let the tears bring out the sorrow.

Click LEFT mouse to decide the eye's position;
Click RIGHT mouse to clear all
*/


//Global
int x;
int y;
int i;
int j;
int k;
int turn;


void setup(){
 size (800, 600);
 colorMode(HSB, 360, 100, 100, 100);
 background(0);
 
}

void draw() {

  if (turn==1){
    //tears down to water level
    strokeWeight(5);
    for (i=y; i<=height-j; i++){
      stroke(random(200,250), random(50,100), random(0,50), 100);
      point(x, random(y, height-j));  
    }
    //water level up
    for (k=0; k<=j; k++){
      stroke(random(210,240), random(50,100), random(0,50), 50);
      point(random(0, width), random(height-j, height));
    }  
  } 
}

//Click left mouse to decide the eye's position
//Click right mouse to clear all
void mousePressed() {
  if (mouseButton == LEFT){
    turn = 1;
    //If click point is higher than water level
    if (mouseY <= height-j) { 
      //Clean last clicked point eye arc
      noFill();
      stroke(0);
      strokeWeight(5);
      arc(x, y-20, 50, 25, QUARTER_PI, QUARTER_PI+HALF_PI);
      //Clean last line down to water level  
      for (i=y; i < (height-j-1); i++){
        stroke(0);
        point(x, i);      
      }  
      //the click point eye
      noFill();
      stroke(360);
      strokeWeight(1);
      arc(mouseX, mouseY-20, 50, 25, QUARTER_PI, QUARTER_PI+HALF_PI);
  
      x = mouseX;
      y = mouseY;
      //water level upper 5 pixels next time
      j+=5;    
      } 
    } else{ // clear all
      background(0);
      x=0;
      y=0;
      i=0;
      j=0;
      k=0;
      turn=0;
    }
}

