
// 1
size(400, 400);
background(255);
stroke(0);

float xPos = width/5;
float space = 10;

while(xPos <= 4*width/5){
  line(xPos, width/5, xPos, 4*width/5);
  xPos = xPos + space;
}



// 2
/*
size(400, 400);
background(255);
stroke(0);

float yPos = height/5;
float space = 10;

while(yPos <= 4*height/5){
  line(height/5, yPos, 4*height/5, yPos);
  yPos = yPos + space;
}
*/



// 3
/*
size(400, 400);
background(255);
stroke(0);

float xPos = width/6;
float xPos2 = width/6 + 60;
float space = 10;

while(xPos2 <= 5*width/6){
  line(xPos2, width/6, xPos, 5*width/6);
  xPos = xPos + space;
  xPos2 = xPos2 + space;
}
*/



// 4
/*
size(400, 400);
background(255);
stroke(0);

float yPos = height/6;
float yPos2 = height/6 + 60;
float space = 10;

while(yPos2 <= 5*height/6){
  line(height/6, yPos2, 5*height/6, yPos);
  yPos = yPos + space;
  yPos2 = yPos2 + space;
}
*/



// 5
/*
size(400, 400);
background(255);
stroke(0);

float xPos = width/5;

for(
  float space = 10;
  xPos <= 4*width/5; 
  space = space + 5
  ){
  
  line(xPos, width/5, xPos, 4*width/5);
  xPos = xPos + space;
  }
*/


// 6
/*
size(400, 400);
background(255);
stroke(0);

float yPos = height/5;

for(
  float space = 10;
  yPos <= 4*height/5; 
  space = space + 5
  ){
  
  line(height/5, yPos, 4*height/5, yPos);
  yPos = yPos + space;
  }
*/



// 7
/*
size(400, 400);
background(255);
stroke(0);

float space = 5;

for(
  float xPos = width/5;
  xPos <= width/2 - space/2;
  xPos = xPos + space
  ){
  line(xPos, height/5, xPos, 3*height/5);
  xPos = xPos + space;
  }

for(
  float xPos = height/2;
  xPos <= 4*width/5 + space/2;
  xPos = xPos + space
  ){
  line(xPos, 2*height/5, xPos, 4*width/5);
  xPos = xPos + space;
  }
*/



// 8
/*
size(400, 400);
background(255);
stroke(0);

float space = 20;

for(
  float yPos = 50;
  yPos <= height - 50;
  yPos = yPos + space
  ){
  line(50, yPos, width/2, yPos);
  yPos = yPos + space;
  }

for(
  float yPos = 50 + space;
  yPos <= height - (50 - space);
  yPos = yPos + space
  ){
  line(width/2, yPos, width - 50, yPos);
  yPos = yPos + space;
  }
*/

