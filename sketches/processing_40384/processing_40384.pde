
//Luis Ortiz




int blocksize;


void setup() {
  size(500, 500);
  blocksize = 20;
  noStroke();
  background(255);
}




void draw() {
  for (int y=0; y<height; y+=blocksize+random(1,100)) {
    for (int x=0; x<width; x+=blocksize-random(1,10)) {
      fill(random(0, 83), random(128, 186), random(210, 216), 30);
      ellipse(x, y, blocksize, blocksize-random(1, 60));
     }
  }



  int specialX = mouseX - (mouseX % blocksize);
  int specialY = mouseY - (mouseY % blocksize);
  fill(255, 0, 0);
  rect(specialX, specialY, blocksize-random(1, 30), blocksize-random(1, 60));
}


