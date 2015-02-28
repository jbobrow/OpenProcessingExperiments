
//define variables

PFont font;
PImage snoop;
PImage snoop2;

int xPos1, yPos1;
int xPos2, yPos2;
int xPos3, yPos3;
int xPos4, yPos4;
int xPos5, yPos5;
int xPos6, yPos6;
int xPos7, yPos7;
int xPos8, yPos8;
int xPos9, yPos9;
int xPos10, yPos10;
int xPos11, yPos11;
int xPos12, yPos12;
int xPos13, yPos13;
int xPos14, yPos14;
int xPos15, yPos15;
int xPos16, yPos16;

int yDirection1;
int yDirection2;
int yDirection3;
int yDirection4;
int yDirection5;
int yDirection6;
int yDirection7;
int yDirection8;
int yDirection9;
int yDirection10;
int yDirection11;
int yDirection12;
int yDirection13;
int yDirection14;
int yDirection15;
int yDirection16;

boolean isMoving; 

void setup() {
  size(500, 500);
  font = loadFont("font.vlw");
  textFont(font, 25);
  fill(255);
  snoop = loadImage("snoop.jpg");
  snoop2 = loadImage("snoop2.jpg");

  xPos1 = 5;
  xPos2 = 75;
  xPos3 = 150;
  xPos4 = 225;
  xPos5 = 275;
  xPos6 = 355;
  xPos7 = 425;
  xPos8 = 495;
  xPos9 = 45;
  xPos10 = 105;
  xPos11 = 180;
  xPos12 = 225;
  xPos13 = 300;
  xPos14 = 355;
  xPos15 = 395;
  xPos16 = 465;
  
  yPos1 = 10;
  yPos2 = 10;
  yPos3 = 10;
  yPos4 = 10;
  yPos5 = 10;
  yPos6 = 10;
  yPos7 = 10;
  yPos8 = 10;
  yPos9 = 10;
  yPos10 = 10;
  yPos11 = 10;
  yPos12 = 10;
  yPos13 = 10;
  yPos14 = 10;
  yPos15 = 10;
  yPos16 = 10;
  
  yDirection1 = 1;
  yDirection2 = 1;
  yDirection3 = 1;
  yDirection4 = 1;
  yDirection5 = 1;
  yDirection6 = 1;
  yDirection7 = 1;
  yDirection8 = 1;
  yDirection9 = 1;
  yDirection10 = 1;
  yDirection11 = 1;
  yDirection12 = 1;
  yDirection13 = 1;
  yDirection14 = 1;
  yDirection15 = 1;
  yDirection16 = 1;

  isMoving = false;

}

void draw() 
{
  background(0, 0, 128);
  text("drop it like it's hot", mouseX, mouseY);

//text change
if(mouseX < 50) {
  if(mouseY < 50) {
    imageMode(CENTER);
    image(snoop, width/2, height/2);
    } 
  }
  
//setting speed
  if (isMoving == true) {
   yPos1 = yPos1 + (20 * yDirection1);
  } 

  if (isMoving == true) {
   yPos2 = yPos2 + (12 * yDirection2);
  } 

  if (isMoving == true) {
   yPos3 = yPos3 + (8 * yDirection3);
  } 
  
  if (isMoving == true) {
   yPos4 = yPos4 + (11 * yDirection4);
  } 
  if (isMoving == true) {
   yPos5 = yPos5 + (17 * yDirection5);
  } 

  if (isMoving == true) {
   yPos6 = yPos6 + (14 * yDirection6);
  } 
  
  if (isMoving == true) {
   yPos7 = yPos7 + (22 * yDirection7);
  } 
  if (isMoving == true) {
   yPos8 = yPos8 + (10 * yDirection4);
  } 
  if (isMoving == true) {
   yPos9 = yPos9 + (18 * yDirection9);
  } 

  if (isMoving == true) {
   yPos10 = yPos10 + (14 * yDirection10);
  } 

  if (isMoving == true) {
   yPos11 = yPos11 + (13 * yDirection11);
  } 
  
  if (isMoving == true) {
   yPos12 = yPos12 + (21 * yDirection12);
  } 
  if (isMoving == true) {
   yPos13 = yPos13 + (7 * yDirection13);
  } 

  if (isMoving == true) {
   yPos14 = yPos14 + (19 * yDirection14);
  } 
  
  if (isMoving == true) {
   yPos15 = yPos15 + (12 * yDirection15);
  } 
  if (isMoving == true) {
   yPos16 = yPos16 + (38 * yDirection16);
  }     


//setting bounce
  if(yPos1 > height - 25 || yPos1 < 0) {
    yDirection1 *= -1;
  } 
  if(yPos2 > height - 25 || yPos2 < 0) {
    yDirection2 *= -1;
  }
  if(yPos3 > height - 25 || yPos3 < 0) {
    yDirection3 *= -1;
  }  
  if(yPos4 > height - 25 || yPos4 < 0) {
    yDirection4 *= -1;
  } 
  if(yPos5 > height - 25 || yPos5 < 0) {
    yDirection5 *= -1;
  } 
  if(yPos6 > height - 25 || yPos6 < 0) {
    yDirection6 *= -1;
  }
  if(yPos7 > height - 25 || yPos7 < 0) {
    yDirection7 *= -1;
  }  
  if(yPos8 > height - 25 || yPos8 < 0) {
    yDirection8 *= -1;
  } 
  if(yPos9 > height - 25 || yPos9 < 0) {
    yDirection9 *= -1;
  } 
  if(yPos10 > height - 25 || yPos10 < 0) {
    yDirection10 *= -1;
  }
  if(yPos11 > height - 25 || yPos11 < 0) {
    yDirection11 *= -1;
  }  
  if(yPos12 > height - 25 || yPos12 < 0) {
    yDirection12 *= -1;
  } 
  if(yPos13 > height - 25 || yPos13 < 0) {
    yDirection13 *= -1;
  } 
  if(yPos14 > height - 25 || yPos14 < 0) {
    yDirection14 *= -1;
  }
  if(yPos15 > height - 25 || yPos15 < 0) {
    yDirection15 *= -1;
  }  
  if(yPos16 > height - 25 || yPos16 < 0) {
    yDirection16 *= -1;
  }
 
//draw circle
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos1, yPos1, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos2, yPos2, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos3, yPos3, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos4, yPos4, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos5, yPos5, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos6, yPos6, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos7, yPos7, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos8, yPos8, 50, 50);   
  noStroke();
  
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos9, yPos9, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos10, yPos10, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos11, yPos11, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos12, yPos12, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos13, yPos13, 50, 50);   
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos14, yPos14, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos15, yPos15, 50, 50); 
  
  noStroke();
  fill(random(0, 255), random(0, 255), random(0, 255));
  ellipse(xPos16, yPos16, 50, 50);  

}

//click to move
void mouseReleased() { 
  if (dist(mouseX, mouseY, xPos1, yPos1) < 25) {
    isMoving = !isMoving;
  }

}


