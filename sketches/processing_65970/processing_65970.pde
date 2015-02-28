
//import processing.opengl.*;
//import controlP5.*;
//ControlP5 cp5;
int[][] terrain;
int gridSize = 20;
int arraySize;

void setup() {
  size(400, 400);
  arraySize = (width/gridSize)+1;
  terrain = new int[arraySize][arraySize];
  for(int x=0;x<arraySize;x++){
    for(int y=0;y<arraySize;y++){
      terrain[x][y] = int(noise(x/10.0, y/10.0)*2.0);
    }
  }
}
void draw(){
  int offset = (int)random(200000);
  offset = 0;
  for(int x=0;x<arraySize;x++){
    for(int y=0;y<arraySize;y++){
      terrain[x][y] = int(noise((x+offset)/10.0, (y+offset)/10.0, millis()/3000.0)*2.0);
    }
  }

  background(0);
  beginShape(TRIANGLES);
noStroke();
  for(int x=0;x<arraySize-1;x++){
    for(int y=0;y<arraySize-1;y++){
      // calculate the binary index of the corner
      int index = ((terrain[x][y]<<3) | (terrain[x+1][y]<<2) | (terrain[x+1][y+1]<<1) | (terrain[x][y+1]));
      switch(index){
        case 0:
          tri(x*gridSize,y*gridSize,gridSize,255,255,255,255,255,255,255,255);
          break;
        case 1:
          tri(x*gridSize,y*gridSize,gridSize,255,255,255,255,0,255,255,255);
          break;
        case 2:
          tri(x*gridSize,y*gridSize,gridSize,255,255,255,255,255,255,255,0);
          break;
        case 3:
          tri(x*gridSize,y*gridSize,gridSize,255,255,255,255,0,0,0,0);
          break;
        case 4:
          tri(x*gridSize,y*gridSize,gridSize,255,255,255,0,255,255,255,255);
          break;
        case 5:
          tri(x*gridSize,y*gridSize,gridSize,255, 255,255,0,0,255,255,255);
          break;
        case 6:
          tri(x*gridSize,y*gridSize,gridSize,255, 255, 0, 0, 255, 255, 0, 0);
          break;
        case 7:
          tri(x*gridSize,y*gridSize,gridSize,255,0,0,0,0,0,0,0);
          break;
        case 8:
          tri(x*gridSize,y*gridSize,gridSize,0,255,255,255,255,255,255,255);
          break;
        case 9:
          tri(x*gridSize,y*gridSize,gridSize,0,0,255,255,0,0,255,255);
          break;
        case 10:
          tri(x*gridSize,y*gridSize,gridSize,0,255,255,255,255,255,255,0);
          break;
        case 11:
          tri(x*gridSize,y*gridSize,gridSize,0,0,0,255,0,0,0,0);
          break;
        case 12:
          tri(x*gridSize,y*gridSize,gridSize,0,0,0,0,255,255,255,255);
          break;
        case 13:
          tri(x*gridSize,y*gridSize,gridSize,0,0,0,0,0,0,0,255);
          break;
        case 14:
          tri(x*gridSize,y*gridSize,gridSize,0,0,0,0,255,0,0,0);
          break;
        case 15:
          tri(x*gridSize,y*gridSize,gridSize,0,0,0,0,0,0,0,0);
          break;
      }
    }
  }
  endShape();
}
/*
1/2 3\4
5\6 7/8
*/
void tri(int x, int y, int _size, int a, int b, int c, int d, int a2, int b2, int c2, int d2)
{
  // tl1
  fill(a);
  vertex(x, y);
  vertex(x+_size/2, y);
  vertex(x, y+_size/2);
  
  // tl2
  fill(b);
  vertex(x, y+_size/2);
  vertex(x+_size/2, y);
  vertex(x+_size/2, y+_size/2);

  //tr1
  fill(c);
  vertex(x+_size/2, y+_size/2);
  vertex(x+_size/2, y);
  vertex(x+_size, y+_size/2);
  
  //tr2
  fill(d);
  vertex(x+_size/2, y);
  vertex(x+_size, y+_size/2);
  vertex(x+_size, y);
  
  // bl1
  fill(a2);
  vertex(x, y+_size/2);
  vertex(x, y+_size);
  vertex(x+_size/2, y+_size);
  
  // bl2
  fill(b2);
  vertex(x, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size/2, y+_size/2);

  //br1
  fill(c2);
  vertex(x+_size/2, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size, y+_size/2);

  //br2
  fill(d2);
  vertex(x+_size, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size, y+_size);
}
