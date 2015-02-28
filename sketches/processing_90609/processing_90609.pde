
//Laura Laham
//LLaham@andrew.cmu.edu
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, ot otherwise without prior written permission of Laura Laham

//Global variables
private int NUM = 400;
int[][] grid;
int x = 150;
int y = 300;
int ht = 400;
int wd = 400;


void setup() {
  size(ht, wd);
  background(255);
  smooth();
  noStroke();
  grid = new int[wd][ht];
}

void draw() {
  background(229, 214, 255);
  rectMode(CENTER);

  // eye and nose and mustache shape --------------------------------
  stroke(95, 72, 137);
  noStroke();
  strokeWeight(2);
  fill(82, 72, 100);
  ellipse(2*wd/3, ht/4, 60, 40); //eye
  fill(255);
  ellipse(2*wd/3, ht/4, 50, 30); //eye
  fill(82, 72, 100);
  ellipse(2*wd/3, ht/4, 45, 25); //eye

  ellipse(wd/2-110, ht/2+20, 150, 50); //mustache
  rect(wd/2-110, ht/2+50, 149, 49); //mustache
  beginShape();
  curveVertex(wd/2-120, ht/2-140);
  curveVertex(wd/2-120, ht/2-140);
  curveVertex(wd/2-130, ht/2-127);
  curveVertex(wd/2-135, ht/2-119);
  curveVertex(wd/2-138, ht/2-113);
  curveVertex(wd/2-142, ht/2-105);
  curveVertex(wd/2-144, ht/2-97);
  curveVertex(wd/2-146, ht/2-90);
  curveVertex(wd/2-148, ht/2-83);
  curveVertex(wd/2-153, ht/2-30);
  curveVertex(wd/2-159, ht/2-14);
  curveVertex(wd/2-167, ht/2);
  curveVertex(wd/2-160, ht/2+15);
  curveVertex(wd/2-55, ht/2+12);
  curveVertex(wd/2-40, ht/2+9);
  curveVertex(wd/2-40, ht/2+9);
  endShape();
  stroke(0);
  
  for (int i = 0; i < 100; i+=10){
    for (int j = 0; j < 100; j+=10){
line(j+wd/2-random(125,190), ht/2+15, j+wd/2-random(115, 185), ht/2+75);
      }
      }

  // face shape -----------------------------------------
  for (int i = 0; i < NUM; i++) {
    for (int j = 0; j < NUM; j++) {
      grid[i][j] = int(random(1, 10));
    }
  }
  pushMatrix();
  noStroke();
  translate(wd, 0);
  beginShape();
  for (float i = 0; i < 90; i+=0.5) { //down
    for (int j = 0; j < 90; j+=10) {
      fill(60, 21, 124, grid[25][j]);
      ellipse(-x*sin(i*2), x*-cos(i*2), 50, 50); //inner circle
      ellipse(-y*sin(i*0.5), y*-cos(i*0.5), 50, 50); //outer circle
      line(wd/2-(40+(10*i)), ht/2+(10*i), (wd/2-(40+(10*i)))*sin(i*0.5), (ht/2*-cos(i*0.5))*(ht/2+(10*i)));
    }
  }
  endShape();
  translate(-wd, 0);
  popMatrix();
}
