
import processing.opengl.*; // imports openGL library

import ddf.minim.*; // imported Mimim Library
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;//end import =
AudioPlayer player;
Minim minim; // audio context

PImage bg;
int leng = 10;  //elements in the array
int[] xPos = new int[leng];
int[] yPos = new int[leng];
float[] zPos = new float[leng];
int e = 0;
float r = 0;

float speed = .05;
float camera_x =  0.0;         // 
float camera_y =  4.0;         // camera position in x,y,z
float camera_z = 750;         //

float lookat_x = 0.0;          //
float lookat_y = 4.0;          // point camera is "looking at" in x,y,z
float lookat_z = 0.0;          //

int a = -100;                  
int b = -33;
int c = 33;
int d = 100;
int vert = -100;

void keyPressed(){
  if(key == BACKSPACE){
  e=0;}
    if ( key == CODED ) {
    if ( keyCode == LEFT ) {
      camera_x -= 0.25;
    } else if ( keyCode == RIGHT ) {
      camera_x += 0.25;
    } else if ( keyCode == UP ) {
      camera_y += 0.25;
    } else if ( keyCode == DOWN ) {
      camera_y -= 0.25;
    }
  } else {
    if ( key == 'a' ) {
      lookat_x -= 0.25;
    } else if ( key == 'd' ) {
      lookat_x += 0.25;
    } else if ( key == 'w' ) {
      lookat_y += 0.25;
    } else if ( key == 's' ) {
      lookat_y -= 0.25;
    } else if ( key == 'z' ) {
      lookat_z -= 0.25;
    } else if ( key == 'x' ) {
      lookat_z += 0.25;
    } else if ( key == '[' ) {
      camera_z -= 0.25;
    } else if ( key == ']' ) {
      camera_z += 0.25;
    } else if ( key == 'j' ) {
      r -= 2.0;
    } else if ( key == 'k' ) {
      r += 2.0;
    }
  }
  println( "----" );
  println( "camera x,y,z is now " + camera_x + ", " + camera_y + ", " + camera_z );
  println( "lookat x,y,z is now " + lookat_x + ", " + lookat_y + ", " + lookat_z );
}


void mouseClicked(){
   //Array element
   xPos[e] = mouseX-500;
   yPos[e] = mouseY-300;
   if(e<(leng-1)){
     e=e+1;}
   
}

void setup(){
  size(800,600,P3D);
  bg = loadImage("OrionNebula.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Music.mp3", 2048);
  player.play();
  for(int i=0; i<leng;i++){
    zPos[i]=random(-400,200);  
  }
  
//  zPos [0] = -200;
//  zPos [1] = -300;
//  zPos [2] = -150;
//  zPos [3] = -150;
//  zPos [4] = -450;
//  zPos [5] = -50;
//  zPos [6] = 150;
}


void draw(){
  background(bg);
 
  perspective( PI/3.0, width/height, 0.01, 5000.0 );
  resetMatrix();
  camera( camera_x, -camera_y, camera_z,  lookat_x, -lookat_y, lookat_z,  0, 1, 0 );
  scale( 1, 1, 1 );
  
//  translate(0,0,-1000);
  rotateY( radians( r ) );
    pushMatrix();
        for(int i=0; i<e;i++){
          points(xPos[i],yPos[i],zPos[i]);     
        }
        
        for (int i=0; i<(e); i++){
              for(int j=0; j<(e); j++){
                float d = dist(xPos[i],yPos[i],xPos[(j)],yPos[(j)]);
                stroke(255);
                strokeWeight(d/100);
               line(xPos[i], yPos[i],zPos[i], xPos[j],yPos[j],zPos[j]);
              }
         }
     popMatrix();
      
     // ref_grid();
   }



void points(int x, int y, float z) {
  noStroke();
  pushMatrix();
    fill(255);
    translate(x,y,z);
    sphereDetail(15);
    sphere(2);
  popMatrix();
  pushMatrix();
    fill(0,0,255,50);
    translate(x,y,z);
    sphereDetail(20);
    sphere(25);
  popMatrix();
  
}

void ref_grid(){
pushMatrix();
  fill(0);
    
    sphereDetail(15);
    sphere(2);
  points(a,vert,a);    points(b,vert,a);    points(c,vert,a);    points(d,vert,a);
  points(a,vert,b);    points(b,vert,b);    points(c,vert,b);    points(d,vert,b);
  points(a,vert,c);    points(b,vert,c);    points(c,vert,c);    points(d,vert,c);
  points(a,vert,d);    points(b,vert,d);    points(c,vert,d);    points(d,vert,d);
  
  points(a,vert+66,a);    points(b,vert+66,a);    points(c,vert+66,a);    points(d,vert+66,a);
  points(a,vert+66,b);    points(b,vert+66,b);    points(c,vert+66,b);    points(d,vert+66,b);
  points(a,vert+66,c);    points(b,vert+66,c);    points(c,vert+66,c);    points(d,vert+66,c);
  points(a,vert+66,d);    points(b,vert+66,d);    points(c,vert+66,d);    points(d,vert+66,d);
  
  points(a,vert+133,a);    points(b,vert+133,a);    points(c,vert+133,a);    points(d,vert+133,a);
  points(a,vert+133,b);    points(b,vert+133,b);    points(c,vert+133,b);    points(d,vert+133,b);
  points(a,vert+133,c);    points(b,vert+133,c);    points(c,vert+133,c);    points(d,vert+133,c);
  points(a,vert+133,d);    points(b,vert+133,d);    points(c,vert+133,d);    points(d,vert+133,d);
  
  points(a,vert+199,a);    points(b,vert+199,a);    points(c,vert+199,a);    points(d,vert+199,a);
  points(a,vert+199,b);    points(b,vert+199,b);    points(c,vert+199,b);    points(d,vert+199,b);
  points(a,vert+199,c);    points(b,vert+199,c);    points(c,vert+199,c);    points(d,vert+199,c);
  points(a,vert+199,d);    points(b,vert+199,d);    points(c,vert+199,d);    points(d,vert+199,d);
  popMatrix();
}


