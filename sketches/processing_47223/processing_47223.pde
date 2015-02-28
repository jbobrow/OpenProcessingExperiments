
/*
Hackpact Arte Generativo 2011
Dia 29

Martin Zumaya Hernandez
*/

import remixlab.proscene.*;

Scene scene;
float ang = 0;
float beta = 0;
float inc = 1;

void setup(){  
  size(500,700,P3D);
  colorMode(HSB);
  scene = new Scene(this);
  scene.toggleGridIsDrawn();
  scene.toggleAxisIsDrawn();
  scene.disableKeyboardHandling(); 
}

void draw(){
 
 lights();
 
 background(0); 
 
 for( int j = 1; j < 200; j += 10){
   rotateZ(radians(beta));
   rotateY(radians(4*beta));
 for( int i = 0; i < width; i += 5){
  float x= j*cos(radians(i))+10*noise(beta,ang);

  float y = j*sin(radians(i))+10*noise(beta,ang);
  rotateX(radians(beta/8));
  stroke((j*j)%200+50*sin(ang),200,200,150);
  line(x+250,y,5*j*sin(radians(beta)),x+250,y,-15*j*sin(radians(beta)));
  line(x-250,y,5*j*sin(radians(beta)),x-250,y,-15*j*sin(radians(beta)));
  stroke(20+40*sin(ang/2),200,200,100);
  line(x+j,y+j,5*j*sin(radians(beta)),x+j,y+j,-15*j*sin(radians(beta)));
  line(x-j,y-j,5*j*sin(radians(beta)),x-j,y-j,-15*j*sin(radians(beta)));
  }
 }
 
 beta += inc*0.01;
 ang += 0.1;
 
 if ( beta >= TWO_PI || beta <= -TWO_PI){

  inc = -inc; 
 }
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

