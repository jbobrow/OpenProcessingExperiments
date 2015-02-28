
//-----------------------------------------------------------------------------
//
// author: thomas diewald
// 
// date: 30.05.2011
//
// recursive.... menger sponge/ sierpinski ...
//
//-----------------------------------------------------------------------------

import processing.opengl.*;
import peasy.*;

PeasyCam cam;

int levels = 3; // recursion-depth
int type   = 3; // 2 = sirpinski, 3 = menger, 4 = menger(asymetric)

void setup(){
  size(700, 700, !online ? OPENGL : P3D);
  cam = new PeasyCam(this, 200, 200, 200, 1000);
  cam.setRotations( -1.3968815, 0.71367186, -0.12572986); 
}

void draw(){
  lights();
  background(255);
  menger(0,0,0, 400, 0, levels, type);
}

// do menger sponge
void menger(float xpos, float ypos, float zpos, float side, int loop_count, int repetitions, int boxes){
  if( ++loop_count >= repetitions) {
     box(xpos, ypos, zpos, side);
  } else {
    side /= (float) boxes;
    for(int x = 0; x < boxes; x++){
      for(int y = 0; y < boxes; y++){
        for(int z = 0; z < boxes; z++){
          if( x == 1 && y == 1 ) continue;
          if( x == 1 && z == 1 ) continue;
          if( y == 1 && z == 1 ) continue;
          menger(xpos + side*x, ypos + side*y, zpos + side*z, side, loop_count, repetitions, boxes);
        } // end for z
      } // end for y
    } // end for x
  }
}

// draw a box at x, y, z, with side-length s
void box(float x, float y, float z, float s){
  pushMatrix();
    translate(x, y, z);
    fill(150); stroke(0);
    box(s);
  popMatrix();
}


// interaction
void keyReleased(){
  if( key == '1') type = 2; // sierpinski
  if( key == '2') type = 3; // menger sponge
  if( key == '3') type = 4; // menger sponge 2
  
  if( key == CODED){
    if( keyCode == UP)   levels++;
    if( keyCode == DOWN) levels--;
  }
  // make sure, thet the recursion-level is not lower than 1, and not too high
  if( type == 2 && levels > 7 ) levels = 7; 
  if( type == 3 && levels > 4 ) levels = 4;
  if( type == 4 && levels > 3 ) levels = 3;
  
  if( levels < 1) levels = 1;
}




