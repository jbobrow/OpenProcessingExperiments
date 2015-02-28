
void setup(){ strokeWeight(0); size(450,450); frameRate(60); background(127); rect(200,0,49,49); rect(0,200,49,49); rect(400,200,49,49); rect(200,400,49,49);}

int [][] world_map = {{0,0,0,0,0,0,0,0,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,1,1,1,1,1,1,1,0},{0,0,0,0,0,0,0,0,0}};
float cx = 3;
float cy = 3;


void draw(){
  background(127);
  for(int x = -3; x<4; x+=1){
    for(int y = -3; y<4; y+=1){
      int ix = floor(cx);
      int iy = floor(cy);
      if(ix + x < 0 || ix + x>=9 || iy + y < 0 || iy + y >= 9){
        fill(0,0,0);
        stroke(0,0,0);
        rect(50 + (50 * (x+3)),50 + (50 * (y+3)),49,49);
      } else{
        if(world_map[ix+x][iy+y]==0){
          fill(0,0,0);
          stroke(0,0,0);
          rect(50 + (50 * (x+3)),50 + (50 * (y+3)),49,49);
        }
        if(world_map[ix+x][iy+y]==1){
          fill(255,255,255);
          stroke(0,0,0);
          rect(50 + (50 * (x+3)),50 + (50 * (y+3)),49,49);
        }
      }
    }
  }
  strokeWeight(50);
  stroke(256,128,9);
  point(225,225);
  strokeWeight(0);
  if(keyPressed == true){
    if(key == 'w'){
      cy-=0.5;
    }
  }
  if(keyPressed == true){
    if(key == 'a'){
      cx-=0.5;
    }
  }
  if(keyPressed == true){
    if(key == 's'){
      cy+=0.5;
    }
  }
  if(keyPressed == true){
    if(key == 'd'){
      cx+=0.5;
    }
  }
}

