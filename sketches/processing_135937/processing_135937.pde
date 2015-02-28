
//Nees Replication, Rachel Hill. 2/23/14 hill.1523@osu.edu

void setup() {
  size(400, 700);  //size of canvas
  background(255);  //color background
  fill(255, 0);  //color of rectangle
  smooth();
  noLoop();
  rectMode(CENTER);
}

void draw() {
  float cord = 2; //cordinates
  float c = 16; //columns -2
  float r = 24;  //rows -2
  float rand = 0;  //origin of rectangle
  float rand1 = 90/c;  //random
  float w = width/c;  //width of square
  float h= height/r;  //height of square

  for (float x=cord;x<r;x++) {  //controlling postion on x
    rand= rand+rand1; //controls variances
    for (float y=cord;y<c;y++) {  //controlling postion on y
      pushMatrix(); //begining of matrix
      float fall =random(-rand, rand);  //helps control disorientation
      translate(y*w-w/cord+fall/3, x*h-h/cord+fall/3);
      rect(0, 0, w, h); //size and location
      rotate(random(fall)); // variance in squars
      popMatrix();  //end matrix
    }
  }
}
