
/*
Hackpact Arte Generativo 2011
Dia 15

Martin Zumaya Hernandez
*/

int N = 100;
float ang = 0;

void setup() {
  size(700, 500);
  colorMode(HSB);
  frameRate(15);
}

void draw() {
  
  background(0);
  translate(width/2,height/2);
  
  for ( int i= 0; i < width/2; i += 2) {
    for ( int j = 0; j < height/2; j += 2) {      
        stroke(i*sin(ang*10)%(width)+(j*cos(ang*10))%(width),255,255);
        point( i, j);    
        point(-i,-j);
        point(-i,j);  
        point(i,-j);
    }
  }
  ang += 0.01;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

