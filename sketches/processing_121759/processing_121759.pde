
int blocksize = 20;
int distanceX = 0;
int distanceY = 0;

void setup (){
size (800,800);
}

void draw (){

  stroke (255);

  for (int j=0; j<height; j+=blocksize){
    for (int i=0; i<width; i+=blocksize){
      distanceY = abs(mouseY -j);
      distanceX = abs(mouseX -i);

      if (mousePressed){
        fill (random (distanceY, distanceX), random (distanceX, distanceY), random (distanceY,distanceY), 120);
        rect (i, j, blocksize, blocksize);
      }
        fill (random (0,200), random (0,200), random (0,200), 30);
        rect (i, j, blocksize, blocksize);
      }
  }
}


