

/*
Hackpact Arte Generativo 2011
Dia 22

Martin Zumaya Hernandez
*/


float N = 1000;
float tetha = 10;
float ang = TWO_PI/N;
float beta = 0;

void setup() {
  size(900, 600, P3D);
  colorMode(HSB);
  frameRate(20);
  smooth();
  background(0);
}

void draw() {

  camera(width-mouseX, height-mouseY, 100, 
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0);
  
  background(0); 

 for( int r = 50; r < 1000; r += 50){
  for (int j = 0; j < N; j += 1) {
    
    stroke(180,200,255-r/4);
    rotateY(radians(beta));
    
    float x = r*cos(radians(j));
    float y = r*sin(radians(j));
    
//    point(x, y, 0);
//    point(-x, -y, 0);    
//    point(y, x, 0);
//    point(-y, -x, 0);            
    
    point(x+10, y, 0);
    point(-x+10, -y, 0);    
    point(y+10, x, 0);
    point(-y+10, -x, 0);            

  }  
 }
  
       beta += 0.0001;
       if( beta >= TWO_PI || beta <= -TWO_PI){
        beta += -1; 
       }
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

