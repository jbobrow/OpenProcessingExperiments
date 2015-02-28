
//Laura Laham
//Homework # 6
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham
// The clouds avoid each other when they get close enough.
// If you press any key, you can rearrange the clouds and their speeds!


private int numCloud = 0;
PImage cloud, cloud2;
private float speed, speed2;
private float  x, y, x2, y2;
int h, w, h2, w2;


void setup() {
  size(800, 400);
  background(250, 250, 10);
  noStroke();
  fill(153, 203, 101);
  rect(0, height/2 + 100, width, height);
  smooth();
  cloud = loadImage("Cloud.png");
  cloud2 = loadImage("Cloud.png");
  speed = random(1, 3);
  speed2 = random(-3,-1);
  x = random(0, width);
  y = random(100, height/2);
  h = int (random(150, 200));
  w = int (random(150, 200));
  x2 = random(0, width);
  y2 = random(height/2, 3*height/5);
  h2 = int (random(150, 200));
  w2 = int (random(150, 200));
}


void draw() {
  background(250, 250, 10);
  noStroke();
  fill(153, 203, 101);
  rect(0, height/2 + 100, width, height);
  drawCloud();
  drawCloud2();
  moveCloud();
  moveCloud2();
  detectCollision();

  // the location and speed of the figures.
  //Detect collision and bounce both horizontally and vertically
  //re-do
}

void moveCloud() {
  x += speed;
  if (x > width+100) {
    x = -100;
  }
  else if ( x < 0-100)
  { 
    x = width+100;
  }
}

void drawCloud() {
  imageMode(CENTER); 
  image(cloud, x, y, h, w);
  numCloud ++;
}

void moveCloud2() {
  x2 += speed2;
  if (x2 > width+100) {
    x2 = -100;
  }
  else if ( x2 < 0-100)
  { 
    x2 = width+100;
  }
}

void drawCloud2() {
  imageMode(CENTER); 
  image(cloud2, x2, y2, h2, w2);
  numCloud ++;
}

void keyPressed() {
  speed = int(random(1, 3));
  speed2 = int(random(-3,-1));
  y = random(100, height/2);
  y2 = random(height/2, 3*height/5);
}


void detectCollision(){
  float d = dist(x,y,x2,y2);
  println(d);
  if (d < 100)
  {
    if(y > 0 && y2 < 3*height/5)
    {
   y -=0.25;
      y2 +=0.25;
x -=0.25;
x2 +=0.25; 
}
  }}

