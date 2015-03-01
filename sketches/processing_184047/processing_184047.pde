
// Tyler Ocwieja
// DMS 110
// Assignment 1
// 2-3-14

int x = 1;
int y = 0;

void setup(){
 // executed only once
 // things you want to stay the same throughout
  size(500,500);
  background (1, 180, 200);
  frameRate(60); // 60 is the max, dont go higher than 60
}

void draw(){
  //executed every frame
  rect(x, y, 50, 50); // (x,y,height,width)
  fill(x, y, 0); // changine variable to change color
  x = x + y; 
  x = x%500;
  y = y + 1; // increases y by one each time
  y = y%500;
}

