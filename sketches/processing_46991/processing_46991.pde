

/*
Hackpact Arte Generativo 2011
Dia 25

Martin Zumaya Hernandez
*/


//import processing.opengl.*;
import peasy.*;

PeasyCam cam;

float phi = 0;

float N = 1000;
float tetha = 10;
float ang = TWO_PI/N;
float beta = 0;
float inc = 1;


void setup(){
 size(500,700,P3D); 
 smooth();
 colorMode(HSB);
 
  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2000);
  
}


void draw() {

  background(0); 
  stroke(255, 1);
  strokeWeight(1);
  
  for( int j = 1; j < 500; j++){
  for(int i = 0; i < 100; i ++){

    float x = j+50*sin(radians(phi*phi))*cos(radians(tetha));
    float y = j+50*sin(radians(phi*phi))*sin(radians(tetha));
    float z = j+50*cos(radians(phi*phi));
    point(x, y, z);
    point(x, y, -z);

    rotateX(beta);
    tetha += inc*ang;     
    phi += inc*ang/100;
  }
  }

  if( tetha >= 500){
    inc = -1;
  }
  beta += 0.01;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

