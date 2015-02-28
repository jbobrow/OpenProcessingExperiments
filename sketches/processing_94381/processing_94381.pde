
//Laura Laham
//Homework # 10
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, or otherwise without prior written permission of Laura Laham


int width = 200;
int height = 200;

int[] deltaX = new int[10];
int[] deltaY = new int[10];
int[] posX = new int[10];
int[] posY = new int[10];
int[] siz = new int[10];

color[] col = { 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255)), 
  color(random(0, 255), random(0, 255), random(0, 255))
};

void setup() {
  background(32,48,50);
  smooth();
  noStroke();
  size(width, height);
  createDeltaVals(10);
  createXYpositions(10);
  createSize(10);
}

void draw() {
  background(32,48,50); 
  for (int i = 0; i < 10; i++) {
    fill(col[i]);
    ellipse((int)posX[i], (int) posY[i], (int)siz[i], (int) siz[i]);
    posX[i] += deltaX[i];
    posY[i] += deltaY[i];

    if (posX[i] + siz[i]/2 > width)
    deltaX[i] = -deltaX[i];
    if (posX[i] -siz[i]/2 < 0)
    deltaX[i] = -deltaX[i];
    if (posY[i] + siz[i]/2 > height)
    deltaY[i] = -deltaY[i];
    if (posY[i] - siz[i]/2 < 0)
    deltaY[i] = -deltaY[i];
  }
}


void createDeltaVals(int k) {
  for (int i = 0; i<k; i++) {
    deltaX[i] = (int)random(5, 10); 
    deltaY[i] = (int)random(5, 10);
  }
}

void createXYpositions(int k) {
  for (int i = 0; i<k; i++) {
    posX[i] = (int)random(0, width); 
    posY[i] = (int)random(0, height);
  }
}

void createSize(int k) {
  for (int i = 0; i<k; i++) {
    siz[i] = (int)random(10, 40);
  }
}
