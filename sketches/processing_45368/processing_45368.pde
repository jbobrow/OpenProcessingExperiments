
//import processing.opengl.*;

/*
Hackpact Arte Generativo 2011
Dia 8

Martin Zumaya Hernandez
*/


float N = 500;
float r = 1;
float beta = 0;

void setup(){
 size(900,500,P3D);
 colorMode(HSB);
 noCursor();
  
}

void draw(){
  
 lights(); 
 background(0);  

 
  camera(mouseX+20,mouseY+20,400*sin(beta),
   0.0,0.0,0.0,
   0.0,0.0,1.0);

  stroke(240+50*sin(beta),200,200);
  strokeWeight(1);
  float ang = TWO_PI/N;
  float tetha = 0;
 
  for( int j = 0; j < 1000; j += 5){
     for( int i = 0; i < N; i++){
       float x = j*r*cos(tetha);
       float y = j*r*sin(tetha);
       point(x,y,100*sin(tetha+beta));
       point(x,y,100*cos(tetha+beta));
       tetha += ang;
      }
    }
  beta += 0.01; 
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

