
int gridSize = 2;

void setup(){
  size(700,700);
  background(255);
  noStroke();
  frameRate(30);
}

void draw(){
  for(int y = 0; y <= height/gridSize; y++){
    for(int x = 0; x <= width/gridSize; x++){
      if(x*y % frameCount == 0){
        fill(255);
        rect(x*gridSize,y*gridSize,gridSize,gridSize);
      }
      else if(x*y % frameCount == 1 ){
        fill(255,0,0);
        rect(x*gridSize,y*gridSize,gridSize,gridSize);
      }
      else if(x*y % frameCount == 2 ){
        fill(0,255,0);
        rect(x*gridSize,y*gridSize,gridSize,gridSize);
      }
      else if(x*y % frameCount == 3 ){
        fill(0,0,255);
        rect(x*gridSize,y*gridSize,gridSize,gridSize);
      }
      else{
        fill(0);
        rect(x*gridSize,y*gridSize,gridSize,gridSize);
      }
    }
  }
  frameRate(ceil(frameCount/5)+1);
}


