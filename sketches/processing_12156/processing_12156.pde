
/*
Game of Life (in 3d!)
 Based on Mike Davis' Conway sketch.
 
 Press spacebar to regenerate, control cam with mouse.
 Key 'c' = reset camera
 
 Best to try in opengl!
 */

//import processing.opengl.*;
import peasy.*;

PeasyCam cam;

ArrayList lives;

PFont font;
int generations = 0;

int xVal = 150;         //set x dimension limit
int yVal = 150;         //set y dimension limit
int zVal = 50;          //set z dimension limit
float density = 0.13;    //set starting density of alive cells
int boxSize = 5;       //set boxSize
int birthVal = 4;       //set neighbour count that results in a new live cell

void setup(){
  size(700, 700, P3D);
  frameRate(12);

  font = loadFont("Monaco-18.vlw");
  textFont(font, 18);

  cam = new PeasyCam(this, 400);

  lives = new ArrayList();
  lives.add(new Life(xVal, yVal, zVal, density, boxSize, birthVal));
}

//set camera view
void keyPressed(){
  if(key == 'c'){
    cam.reset();
  }
}

void draw(){
  translate(-(xVal/2), -(yVal/2), 0);
  background(0);

  generations++;

  for(int i=lives.size()-1; i>=0; i--){
    Life life = (Life)lives.get(i);
    life.render();
    if(keyPressed == true && key == 32){
      generations = 0;
      lives.remove(i);
      lives.add(new Life(xVal, yVal, zVal, density, boxSize, birthVal));
    }
  }

  fill(255);
  cam.beginHUD();
  text("Generations: "+generations, width-200, height-20);
  cam.endHUD();
}

class Life{
  int w, h;
  int depth;
  float density = 0.8;
  int sz = 3;
  int birthVal;
  int[][][][] world;

  Life(int _w, int _h, int _d, float _density, int _sz, int _bV){
    w = _w;
    h = _h;
    depth = _d;
    density = _density;
    sz = _sz;
    birthVal = _bV;

    //set up initial alive cells
    world = new int[w][h][depth][2];
    for(int i=0; i<density*w*h*depth; i+=sz){
      world[(int)random(w)][(int)random(h)][(int)random(depth)][0]=1;
    }
  }

  void render(){
    fill(0, 100);
    for(int i=0; i<w; i+=sz){
      for(int j=0; j<h; j+=sz){
        for(int k=0; k<depth; k+=sz){
          if((world[i][j][k][1] == 1) || (world[i][j][k][1] == 0 && world[i][j][k][0] == 1)){
            world[i][j][k][0]=1;
            float r = map(i, 0, w, 0, 255);
            float g = map(j, 0, h, 0, 255);
            float b = map(k, 0, depth, 0, 255);
            stroke(r, g, b);
            pushMatrix();
            translate(i, j, k);
            box(sz);
            popMatrix(); 
          }
          if(world[i][j][k][1] == -1){
            world[i][j][k][0] = 0;
          }
          world[i][j][k][1] = 0;
        }
      }
    }
    //birth and death conditionals
    for(int i=0; i<w; i+=sz){
      for(int j=0; j<h; j+=sz){
        for(int k=0; k<depth; k+=sz){
          int count = neighbours(i, j, k);
          if(count == birthVal && world[i][j][k][0] == 0){
            world[i][j][k][1] = 1;
          }
          if((count < birthVal-1 || count > birthVal) && world[i][j][k][0] == 1){
            world[i][j][k][1] = -1;
          }
        }
      }
    }
  }

  int neighbours(int x, int y, int z){
    //count the number of alive cells in three dimensions
    return world[(x+sz) % w][y][z][0] +
      world[x][(y+sz) % h][z][0] +
      world[(x+w-sz) % w][y][z][0] +
      world[x][(y+h-sz) % h][z][0] +
      world[(x+sz) % w][(y+sz) % h][z][0] +
      world[(x+w-sz) % w][(y+sz) % h][z][0] +
      world[(x+sz) % w][(y+h-sz) % h][z][0] +
      world[(x+w-sz) % w][(y+h-sz) % h][z][0] +

      world[(x+sz) % w][y][(z+sz) % depth][0] +
      world[x][(y+sz) % h][(z+sz) % depth][0] +
      world[(x+w-sz) % w][y][(z+sz) % depth][0] +
      world[x][(y+h-sz) % h][(z+sz) % depth][0] +
      world[(x+sz) % w][(y+sz) % h][(z+sz) % depth][0] +
      world[(x+w-sz) % w][(y+sz) % h][(z+sz) % depth][0] +
      world[(x+sz) % w][(y+h-sz) % h][(z+sz) % depth][0] +
      world[(x+w-sz) % w][(y+h-sz) % h][(z+sz) % depth][0] +

      world[(x+sz) % w][y][(z+depth-sz) % depth][0] +
      world[x][(y+sz) % h][(z+depth-sz) % depth][0] +
      world[(x+w-sz) % w][y][(z+depth-sz) % depth][0] +
      world[x][(y+h-sz) % h][(z+depth-sz) % depth][0] +
      world[(x+sz) % w][(y+sz) % h][(z+depth-sz) % depth][0] +
      world[(x+w-sz) % w][(y+sz) % h][(z+depth-sz) % depth][0] +
      world[(x+sz) % w][(y+h-sz) % h][(z+depth-sz) % depth][0] +
      world[(x+w-sz) % w][(y+h-sz) % h][(z+depth-sz) % depth][0];
  }
}


