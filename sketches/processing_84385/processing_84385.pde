
int csize = 20;
int[][] cells = new int[csize][csize]; 


void setup()
{
  //fill empty
  for (int i = 0; i<csize; i++) {
    for (int j = 0; j<csize; j++) {
      cells[i][j] = 0;
    }
  } 


  size(400,400);
  background(255);
  //random seeds
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  
}

void draw() {
  noStroke();
  //generate blocks
  for (int i = 1; i<csize-1; i++) {
    for (int j = 1; j<csize-1; j++) {
         if(cells[i][j]==0){
      int[] count = new int[4];
      count[0]=cells[i-1][j];
      count[1]=cells[i+1][j];
      count[2]=cells[i][j-1];
      count[3]=cells[i][j+1];
      cells[i][j]=count[int(random(0,4))];
    }
  }
  }




//draw blocks
for (int i = 0; i<csize; i++) {
  for (int j = 0; j<csize; j++) {
    if (cells[i][j] == 1) {
      fill(255, 200, 0);
      rect(i*csize, j*csize, csize, csize);
    }
    if (cells[i][j] == 2) {
      fill(255, 0, 200);
      rect(i*csize, j*csize, csize, csize);
    }
    if (cells[i][j] == 3) {
      fill(200, 255, 0);
      rect(i*csize, j*csize, csize, csize);
    }
    if (cells[i][j] == 4) {
      fill(200, 0, 255);
      rect(i*csize, j*csize, csize, csize);
    }
    if (cells[i][j] == 5) {
      fill(0, 255, 200);
      rect(i*csize, j*csize, csize, csize);
    }
    if (cells[i][j] == 6) {
      fill(0, 200, 255);
      rect(i*csize, j*csize, csize, csize);
    }
  }
}

//drawgrid
for (int i = 1; i<csize; i++) {
  stroke(255);
  line(0, i*csize, csize*csize, i*csize);
  line(i*csize, 0, i*csize, csize*csize);
}
}

void keyReleased() {
//reset loop
  //emty array
  for (int i = 0; i<csize; i++) {
    for (int j = 0; j<csize; j++) {
      cells[i][j] = 0;
    }
  } 
  //random seeds
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
  cells[int(random(1,csize-1))][int(random(1,csize-1))]=int(random(1,6));
}
