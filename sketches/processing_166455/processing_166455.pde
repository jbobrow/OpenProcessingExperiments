
void setup(){
  size(100, 100);
  makeGrid();
}

void makeGrid(){
  background(0);
  float sizeX = random(5,15);
  float sizeY = random(5,15);
  for(int x=0;x<width;x++){ //NESTED LOOP!!!!! A loop within a loop.
    for(int y=0;y<height;y++){ //Loopception....
       fill(random(255), random(255),random(255));
       rect(x*sizeX, y*sizeY, sizeX, sizeY); 
    }
  } 
}
void mousePressed(){
  makeGrid();
}
void draw(){
}



