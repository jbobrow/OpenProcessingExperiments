
/*
Hackpact Arte Generativo 2011
Dia 28

Martin Zumaya Hernandez
*/

import remixlab.proscene.*;

Scene scene;
float ang = 0;
float beta = 0;
float inc = 1;

void setup(){  
  size(700,700,P3D);
  colorMode(HSB);
  scene = new Scene(this);
  scene.toggleGridIsDrawn();
  scene.toggleAxisIsDrawn();
  scene.disableKeyboardHandling(); 
}

void draw(){
   
 background(0); 
 for( int i = 0; i < width/2; i += 1){
    rotateZ(radians(beta));
    rotateY(radians(beta));
  for(int j = 0; j < height/2; j += 5){
    stroke((i+j/4+mouseY/10)%50,200,200);
    point(i,j,i*sin(radians(ang)));
    point(-i,-j,i*cos(radians(ang)));
    point(-i,j,i*sin(radians(ang+PI)));
    point(i,-j,i*cos(radians(ang+PI)));
  }
 }
 beta += inc*0.01;
 ang += 1;
 
 if ( beta >= PI || beta <= -PI){

  inc = -inc; 
 }
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

