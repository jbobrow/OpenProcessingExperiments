
/* @pjs font="rocksalt.ttf"; */

int x = 0;
int x1 = 0;
int x2 = 0;
int x3 = 0;
int x4 = 0;
int x5 = 0;
int y = 0;

  PFont poem;
  PImage poe;


void setup() {
  size(500, 500);
  poe = loadImage("poe.jpg");
  smooth();
  poem = createFont("rocksalt.ttf", 22);
  textFont(poem);

  
  textAlign(RIGHT, RIGHT);
 }

// POSITIONING

void draw()  {
 background(255);
image(poe, 0, 0, width, height);
 
  x = x + 6;
  x1 = x1 + 1;
  x2 = x2 + 1;
  x3 = x3 + 1;
  x4 = x4 + 1;
  x5 = x5 + 1;
  y = y + 3;
 
  if(x >= width-1)  {
  x = width-1;


if(x > 79)  {
  x1 = x1 + 5;
  
    if(x1 >= width-1)  {
  x1 = width-1;
  
  }
}

if(x1 > 79)  {
  x2 = x2 + 4;
  
    if(x2 >= width-1)  {
  x2 = width-1;
  
  }
}

if(x2 > 79)  {
  x3 = x3 + 3;
  
    if(x3 >= width-1)  {
  x3 = width-1;
  
  }
}

if(x3 > 79)  {
  x4 = x4 + 2;
  
    if(x4 >= width-1)  {
  x4 = width-1;
  
  }
}

if(x4 > 79)  {
  x5 = x5 + 1;
  
    if(x5 >= width-1)  {
  x5 = width-1;
  
  }
}

  if(y >= height-100)  {
  y = height-100;



  }
}

// TEXT 
noStroke();
fill(50, 95);
rect(20, 20, width-1, y, 20, 20);

      fill(100, 0, 0);
 text("Thank Heaven! the crisis --", x, 40);
 
       fill(120, 0, 0);
 text("The danger is past,", x1, 70);
 
       fill(140, 0, 0);
 text("And the lingering illness", x2, 100);
 
        fill(160, 0, 0);
 text("Is over at last --", x3, 130);
 
        fill(255, 0, 0);
 text("And the fever called Living", x4, 160);
 
        fill(random(200), 0, 0);
 text(" Is conquered at last.", x5, 190);



         fill(100);
 text("'For Annie' by, Edgar Allan Poe", width-1, y);

}






