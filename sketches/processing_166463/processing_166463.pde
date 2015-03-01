
 float xsquare = random(1,4);
 float ysquare = random(1,4);

void setup(){
  size(200, 200);
  makeGrid();
}

void makeGrid(){
  background(0);
  for(int x=0;x<width;x++){ //NESTED LOOP!!!!! A loop within a loop.
    for(int y=0;y<height;y++){ //Loopception....
       fill(random(255), random(255),random(255));
       rect(x*10, y*10, random(xsquare), random(ysquare)); 
    }
  } 
}
void mousePressed(){
  makeGrid();
}
void draw(){
}



