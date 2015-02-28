
//Homework 4
//Copyright William Aldrich, Pittsburgh, PA, September 10 2013

float x,y,wd,ht,n;

void setup(){
  size(400,400);
  n = 255;
  frameRate(10);
}

void draw(){
  n = n+1;
  background(mouseY,255,mouseX);
  if(mousePressed){
    n = 0;
    x = 0;
    y = 0;
  }
  fill(mouseX,mouseY,255);
  ellipse(200+x,200+y,10+n,10+n);
  if(key == CODED){
    if(keyCode == UP){
      y = y - 5;
    }
    else if (keyCode == DOWN){
      y = y + 5;
    }
    else if(keyCode == LEFT){
      x = x - 5;
    }
    else if(keyCode == RIGHT){
      x = x + 5;
    }
  }
  noStroke();
  fill(255,mouseX,mouseY);
  rect(random(400),random(400),15,15);
  fill(mouseX,255,mouseY);
  rect(random(400),random(400),15,15);
}


