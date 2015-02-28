
int cols = 20;  //adjust to determine the number of columns you want in the peice
int rows = 20;  // adjust to determine the number of rows desired
int len = 500;  //screen length
int wid = 500;  //screen width
int spacex = wid/cols;
int spacey = len/rows;
int k = 20;  // random variable for range
int frame = 10; // refresh rate

void setup(){
  size(len,wid);
  frameRate(frame);
}

int[][] myArray = new int[cols][rows];

void draw(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++){
      myArray[i][j] = int(random(5));
    }
  }
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++){
      stroke(random(255));
      float x = random(4);
      float y = random(4);
      float z = random(4);
      fill((x*64)-1,(y*64)-1,(z*64)-1);
      rect((i*spacex), (j*spacey), ((i+1)*spacex)/random(k),((j+1)*spacey)/random(k));
      fill((y*64)-1,(z*64)-1,(x*64)-1);
      ellipse((i*spacex), (j*spacey), i,j);

    }
  }
}


