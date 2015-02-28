
/*import processing.opengl.*;
import controlP5.*;
ControlP5 cp5;
*/
int[][][] terrain;
int gridSize = 10;
int arraySize;
int currentDraw = 0;
void setup() {
  size(400, 400);
  //cp5 = new ControlP5(this);
  //cp5.addToggle("type");
  arraySize = (width/gridSize)+1;
  terrain = new int[arraySize][arraySize][2];
  for(int x=0;x<arraySize;x++){
    for(int y=0;y<arraySize;y++){
      terrain[x][y][0] = int(noise(x/4.0, y/4.0)*2.0);
      terrain[x][y][1] = -1;
    }
  }
}
void mousePressed(){
  int x = max(0,min(arraySize-1,mouseX/gridSize));
  int y = max(0,min(arraySize-1,mouseY/gridSize));
  terrain[x][y][0] = currentDraw;
}
void mouseDragged(){
mousePressed();
}
void keyPressed(){
  currentDraw = ((int)key)-48;
}
void update(){
   for(int x=1;x<arraySize-1;x++){
    for(int y=1;y<arraySize-1;y++){
      if(terrain[x][y][0] == 2){
        // run the water calculation
        if(terrain[x][y+1][0] == 0){
          terrain[x][y][1] = 0;
          terrain[x][y+1][1] = 2;
        }else if(terrain[x-1][y+1][0] == 0){
          terrain[x][y][1] = 0;
          terrain[x-1][y+1][1] = 2;
        }else if(terrain[x+1][y+1][0] == 0){
          terrain[x][y][1] = 0;
          terrain[x+1][y+1][1] = 2;
        }else{
          terrain[x][y][1] = 2;
        }
      }else if(terrain[x][y][1] == -1){
        // if the terrain isn't dirty (i.e. hasn't been updated by the water calc)
        // then copy
        terrain[x][y][1] = terrain[x][y][0];
      }
    }
   }
   // copy down
   for(int x=0;x<arraySize;x++){
    for(int y=0;y<arraySize;y++){
      terrain[x][y][0] = terrain[x][y][1];
      terrain[x][y][1] = -1;
    }
   }

}
void draw(){
  update();
  int offset = (int)random(200000);
  offset = 0;
  noStroke();
  background(145, 156, 116);
  beginShape(TRIANGLES);
  for(int i=1;i<5;i++){
    if(i==1){
      fill(64, 59, 39);
    }else if(i==2){
      fill(67,142,135);
    }else if(i==3){
      fill(248,160,26);
    }else{
      fill(100, 120, 39);
    }
  for(int x=0;x<arraySize-1;x++){
    for(int y=0;y<arraySize-1;y++){
      // calculate the binary index of the corner
      int i1 = terrain[x][y][0]==i?0:1;
      int i2 = terrain[x+1][y][0]==i?0:1;
      int i3 = terrain[x+1][y+1][0]==i?0:1;
      int i4 = terrain[x][y+1][0]==i?0:1;
      int index = (i1<<3) | (i2<<2) | (i3<<1) | (i4);
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
  }
  endShape();
}
/*
1/2 3\4
5\6 7/8
*/
void tri(int x, int y, int _size, int a, int b, int c, int d, int a2, int b2, int c2, int d2)
{
  if(a>0){
    // tl1
    vertex(x, y);
    vertex(x+_size/2, y);
    vertex(x, y+_size/2);
  }
  if(b>0){
  // tl2
  vertex(x, y+_size/2);
  vertex(x+_size/2, y);
  vertex(x+_size/2, y+_size/2);
  }
  if(c>0){
  //tr1
  vertex(x+_size/2, y+_size/2);
  vertex(x+_size/2, y);
  vertex(x+_size, y+_size/2);
  }
if(d>0){
  //tr2
  vertex(x+_size/2, y);
  vertex(x+_size, y+_size/2);
  vertex(x+_size, y);
}  
if(a2>0){
  // bl1
  vertex(x, y+_size/2);
  vertex(x, y+_size);
  vertex(x+_size/2, y+_size);
}  
  if(b2>0){
  // bl2
  vertex(x, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size/2, y+_size/2);
  }
if(c2>0){
  //br1
  vertex(x+_size/2, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size, y+_size/2);
}
if(d2>0){
  //br2
  vertex(x+_size, y+_size/2);
  vertex(x+_size/2, y+_size);
  vertex(x+_size, y+_size);
}
}

