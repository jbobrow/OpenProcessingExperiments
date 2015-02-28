
//Laura Laham
//LLaham@andrew.cmu.edu
//Copyright 2013 by Laura Laham. All rights reseved. No part of this document may be reproduced or transmitted in any form or by any means, electronic, mechanical, photocopying, recording, ot otherwise without prior written permission of Laura Laham

//Global variables
private int NUM = 400;
int[][] grid;

void setup() {
  size(400, 400);
  background(255);
  smooth();
  noStroke();
  grid = new int[width][height];
}

void draw() {
  background(229, 214, 255);
  rectMode(CENTER);
  for (int i = 0; i < NUM; i++) {
    for (int j = 0; j < NUM; j++) {
      grid[i][j] = int(random(1,10));
    }
  }
  for (int i = 0; i < NUM; i+=10) { //down
    for (int j = 0; j < NUM; j+=10) {
      fill(60, 21, 124, grid[25][j]);
      rect(50, j-50, 50, 50);
      rect(width/3,j-150, 50, 50);
    }
  }
for (int i = 0; i < NUM; i+=10) { //down
    for (int j = 0; j < NUM; j+=10) {
      fill(60, 21, 124, grid[25][j]);
      rect(50+j, height-50, 50, 50);
      rect(133+j, 2*width/3, 50, 50);
    }
  }
}
