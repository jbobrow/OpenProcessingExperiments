
// Oliver Haimson  alhaimso
// Homework 8
// Copyright 2012

// INSTRUCTIONS:

float y, mapX, mapY;

void setup()
{
  size(600,600);
  smooth();
  noCursor();
}

void draw()
{
  background(29,100,200);
  int x = 8; 
  mapX = map(mouseX, 0,width, 180,0);
  mapY = map(mouseY, 0,height, 180,0);
  while (x < mouseX){
    fill(mapX, mapY, 100);
    y = random(0,mouseY-15);
    triangle(x-2,y-3, x+10,y+15, x-8,y+13);
    x+=10; 
  }
}

// to pause and un-pause
void keyPressed(){
  if (key == 'p'){
    noLoop();
  }
  else if (key == ' '){
    loop();
  }
}

