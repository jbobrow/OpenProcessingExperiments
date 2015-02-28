

/*
Hackpact Arte Generativo 2011
Dia 24

Martin Zumaya Hernandez
*/


//import processing.opengl.*;
import peasy.*;


PeasyCam cam;

int N = 100;
int s = 50;

void setup(){
 size(600,600,P3D); 
 smooth();
 colorMode(HSB);
 
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(500);

  
}

void draw(){
       
  lights();       
  background(60);
   
  for( int i = 0; i < N ; i += s){
   for( int j = 0; j < N; j += s){
     for( int k = 0; k < N; k += s){

   pushMatrix();
   noStroke();
   fill(255*sin(radians(frameCount*5)),200);
   translate(i,j,k);
   box(2);
   popMatrix();
   
   pushMatrix();
   stroke(255*cos(radians(frameCount*5)),200);
   strokeWeight(1);
   translate(i,j,k);
   line(0,0,0,10,0,0);
   line(0,0,0,0,10,0);
   line(0,0,0,0,0,10);
   line(0,0,0,-10,0,0);
   line(0,0,0,0,-10,0);
   line(0,0,0,0,0,-10);
   popMatrix();
   
    }
   }
  }
  
 if( frameCount % 50 == 0){
  if( s > 10){
  s -= 10;
  }
  
 } 
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

