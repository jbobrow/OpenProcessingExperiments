
// Copyright 2014 Jacklynn Pham
// HW 3


float x;
float y;
float wd;
float ht;
float easing;
float xdist;
float ydist;

void setup() {
  size(800, 400);
  easing = .08;
}


void draw () {

xdist = mouseX-x;
ydist = mouseY-y;  
x=x+ xdist*.05;
y=y + ydist*.05;

  wd = 30;
  ht = 30;

  xdist = mouseX-x;
  ydist = mouseY-y;
  noStroke();

  //blur background
  fill(#4DA7F5, 20);
  //background(255);
  rect(0, 0, width, height);




  //fish

  fill(#ED8C16);
  ellipse( x+wd, y, wd*2.75, ht*1.95);
  triangle( (x+wd), y, (x-wd), (y+ht), (x-wd), (y-ht));
  stroke(200, 0, 0);

  //eye
  stroke(#000000);
  fill(#000000);
  ellipse( (x+wd*1.5), (y-ht*.4), wd/5, ht/5);




  //ellipse(x, y, wd*.8, ht*.8);


  //line( x - .5*wd, y - .5*ht, x + .5*wd, y+ .5*ht);

  //triangle reference p oints  
  //  point( (x+wd)+xdist*.5, y+ydist*.5);
  //  point( (x-wd*1)+xdist*.5, (y+ht)+ydist*.5);
  //  point( (x-wd*1)+xdist*.5, (y-ht)+ydist*.5);
}



