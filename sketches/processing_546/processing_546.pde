
//by Michal Piasecki
//mmichalpiasecki at gmail.com

/*
 if you fell like generating a dxf file out of it - great; everything is ready for you. 
 You just need to un-comment out the "record" event handler. 
 
 INTERACTION:
 ONE ROW
 a increases the number of cubes in a row
 z decreases the number of cubes in a row
 
 s increases rotation of the cubes
 x decreases rotation of the cubes
 
 d increases cube edge
 c decreases cube edge
 
 WHOLE FORM
 q increases the number of rows
 w desreases the number of rows but both doesn't work quite fine yet
 
 e increases space between the rows
 r decreases space between the rows
 
 t increases the rotation of next row in relation to the previous one
 y decreases the rotation of next row in relation to the previous one
 */


int cube_num = 1; //between 1 and 24 defines the number of cubes in a row
int cube_edge = 20; //size of the cube edge; infinite
int num_rows = 1; //number of rows
int rows_space = 20; //space between the rows
int rolled_in = 12; //how rolled is each cube
float rows_rot = 0;

import processing.dxf.*;

//boolean record; RECORDING A DXF

void setup() {
  size(500, 500, P3D);

}

//void mousePressed() { RECORDING A DXF
//  record = true; 
//}

void draw() {
  //if (record) { RECORDING A DXF
  //  beginRaw(DXF, "lotsofrows2.dxf");
  //}

  background(255);
  lights();
  translate(250,250,-1000);

  cubespiral(cube_num,100,cube_edge);

  if (num_rows > 1){
    for (int i = 1; i <= num_rows; i++){
      translate(0,0,num_rows*rows_space);
      cubespiral(cube_num,100,cube_edge);
    }
  }


  //if (record) { RECORDING A DXF
  //  endRaw();
  //  record = false;
  //}
}

void cubespiral(int c_num, int rad, int edge){
  pushMatrix(); //thanks to this push and pop matrix next row is directly on top of the previous one
  for (int i = 1; i <= c_num; i++){
    if (c_num <= 24){
      pushMatrix();
      translate(rad,0); //offsets cubes from the centre of the circle
      for (int j = 1; j <= c_num; j++){
        translate(edge,0);
        cube(0,0,0,edge);
        rotate(PI/rolled_in);
      }
      popMatrix();
      rotate(PI/12); //rotates so that cubes can be drawn 24 times
    }
  }
  popMatrix();
  if (rows_rot > 0 || rows_rot < 48) {
    rotate(rows_rot); // rotates next row in relation to the previous one
  }
}

void cube(int x, int y, int z, int edge){
  translate(x,y,z);
  rect(0,0,edge,edge);
  pushMatrix();
  translate(0,0,edge);
  rect(0,0,edge,edge);
  popMatrix();
  pushMatrix();
  rotateX(PI/2);
  rect(0,0,edge,edge);
  translate(0,0,-edge);
  rect(0,0,edge,edge);
  popMatrix();
  pushMatrix();
  rotateY(PI/2);
  translate(-edge,0,0);
  rect(0,0,edge,edge);
  translate(0,0,edge);
  rect(0,0,edge,edge);
  popMatrix();
}



void keyPressed(){ //interaction is assigned here
  if(key == 'a' || key == 'A'){
    if (cube_num <= 24){
      cube_num = cube_num+1;
    } 
    else {
      cube_num = 1;
    }
  }  
  else if (key == 'z' || key == 'Z'){
    if (cube_num >= 1){
      cube_num = cube_num-1;
    } 
    else {
      cube_num = 24;
    }
  } 
  else if (key == 'q' || key == 'Q'){
    num_rows = num_rows+1;
  } 
  else if (key == 'w' || key == 'W'){
    num_rows = num_rows-1;
  } 
  else if (key == 'd' || key == 'D'){
    cube_edge = cube_edge+1;
  } 
  else if (key == 'c' || key == 'C'){
    cube_edge = cube_edge-1;
  } 
  else if (key == 's' || key == 'S'){
    rolled_in = rolled_in+1;
  } 
  else if (key == 'x' || key == 'X'){
    rolled_in = rolled_in-1;
  }
  else if (key == 'e' || key == 'E'){
    rows_space = rows_space+1;
  } 
  else if (key == 'r' || key == 'R'){
    rows_space = rows_space-1;
  }
  else if (key == 't' || key == 'T'){
    rows_rot = rows_rot+0.025;
  } 
  else if (key == 'y' || key == 'Y'){
    rows_rot = rows_rot-0.025;
  }
}

