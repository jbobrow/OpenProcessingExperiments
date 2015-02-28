
import processing.opengl.*;       // imports openGL library

import ddf.minim.*;               // imported Mimim Library
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;      //end import 
AudioPlayer player;
Minim minim;                     // audio context

PImage bg;
int leng = 10;                     //
float [] xPos = new float [leng];  //
float [] yPos = new float [leng];  //elements in the arrays
float [] zPos = new float [leng];  //
int e = 0;
float r = 0;


float camera_x =  0.0;         // 
float camera_y =  0.0;         // camera position in x,y,z
float camera_z = 2000;          //

float lookat_x = 0.0;          //
float lookat_y = 0.0;          // point camera is "looking at" in x,y,z
float lookat_z = 0.0;          //

float orbit   = 0;             // parametric orbit of camera
float cam_rad = 2000.0;


PVector pt = new PVector(1000,1000,1000);     // projected point (start off screen)

void keyPressed(){
  if(key == BACKSPACE){
  e=0;}
    if ( key == CODED ) {
    if ( keyCode == LEFT ) {
      orbit   -= 0.3;
      camera_x = sin( orbit ) * cam_rad;
      camera_z = cos( orbit ) * cam_rad;
    } else if ( keyCode == RIGHT ) {
      orbit   += 0.3;
      camera_x = sin( orbit ) * cam_rad;
      camera_z = cos( orbit ) * cam_rad;
      }
    }
  }

void mouseReleased() {
  pt = projectPoint( mouseX, mouseY,           // window x,y
                750, 1500,                     // random range for z
                PI/3.0,                        // vertical fov
                float(width)/float(height),    // aspect
                camera_x, camera_y, camera_z,  // camera position x,y,z
                lookat_x, lookat_y, lookat_z,  // lookat point x,y,z
                0, 1, 0 );                     // up vector x,y,z
   xPos[e] = pt.x;
   yPos[e] = pt.y;
   zPos[e] = pt.z;
   if(e<(leng-1)){
     e=e+1;
   }
}

void setup(){
  size(800,600,OPENGL);
  bg = loadImage("OrionNebula.jpg");
  minim = new Minim(this);
  player = minim.loadFile("Music.mp3", 2048);
  player.play();                                            //Comment to silence music
 }


void draw(){
 background(bg);
  perspective( PI/3.0,float(width)/float(height), 0.01, 5000.0 );
  resetMatrix();
  camera( camera_x, -camera_y, camera_z,  lookat_x, -lookat_y, lookat_z,  0, 1, 0 );
  scale( 1, -1, 1 );
  
//  beginShape( LINES );            //
//  strokeWeight( 4 );              //
//  stroke( 255,0,0 );              //
//  vertex( 0.0, 0.0, 0.0 );        //
//  vertex( 50.0, 0.0, 0.0 );       //
//  stroke( 0,255,0 );              // crosshairs
//  vertex( 0.0, 0.0, 0.0 );        //
//  vertex( 0.0, 50.0, 0.0 );       //
//  stroke( 0,0,255 );              //  
//  vertex( 0.0, 0.0, 0.0 );        //
//  vertex( 0.0, 0.0, 50.0 );       //
//  endShape();

    pushMatrix();
      rotateY( radians( r ) );
        for(int i=0; i<e;i++){
          points(xPos[i],yPos[i],zPos[i]);     
        }
       for (int k=0; k<(e); k++){
         for (int i=0; i<(e); i++){
              for(int j=0; j<(e); j++){
                float d = dist(xPos[i],yPos[i],xPos[(j)],yPos[(j)]);
                stroke(255);
                strokeWeight(d/300);
                fill(0,0,255,10);                        //Fill Triangles
//                beginShape(TRIANGLES);                 //  
//                  vertex(xPos[k], yPos[k],zPos[k]);    //
//                  vertex(xPos[i], yPos[i],zPos[i]);    //Draw Triangles
//                  vertex(xPos[j], yPos[j],zPos[j]);    //
//                  endShape();
               line(xPos[i], yPos[i],zPos[i], xPos[j],yPos[j],zPos[j]);
              }
         }
       }
     popMatrix();
     }

// projects a point from the window x,y back out into 3d space

PVector projectPoint( float window_x, float window_y, float near_rz, float far_rz,
                   float fov, float aspect, 
                   float cam_x, float cam_y, float cam_z,
                   float look_x, float look_y, float look_z,
                   float up_x, float up_y, float up_z ) {
                     
  // determine the new point in camera space
  float tan_hfov = tan(fov/2.0);
  float dx = tan_hfov * ((window_x/float(width))*2 - 1) * aspect;
  float dy = tan_hfov * (1 - (window_y/float(height))*2); 
  float new_z = random( near_rz, far_rz );
  PVector pnewc = new PVector( dx*new_z, dy*new_z, new_z );  

  // construct the transform
  PVector camZ = new PVector( look_x-cam_x, look_y-cam_y, look_z-cam_z );
  PVector camY = new PVector( up_x, up_y, up_z );
  PVector camX = camZ.cross( camY );
  camY = camX.cross( camZ ); 
  camX.normalize();
  camY.normalize();
  camZ.normalize();
  PMatrix3D mat = new PMatrix3D(
      camX.x,  camY.x,  camZ.x,  cam_x,
      camX.y,  camY.y,  camZ.y,  cam_y,
      camX.z,  camY.z,  camZ.z,  cam_z,
      0.0,     0.0,     0.0,     1.0     );

  // transform the new point into world space, and return it
  PVector j = new PVector(0,0,1);
  return( mat.mult( pnewc, j ) );
}

void points(float x, float y, float z) {
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




