
/*
Hackpact Arte Generativo 2011
Dia 14

Martin Zumaya Hernandez
*/

float N = 200;
float ang = 0;

void setup() {
  background(20);
  size(600, 600);
  colorMode(HSB);
  frameRate(15);
}

void draw() {
 
 translate(width/2,height/2);
  
  for ( int i= 0; i < width/2; i += 2) {
    for ( int j = 0; j < height/2; j += 2) {      
        float C = 170+(N*sin(i+ang*20)+N*cos(j+ang*20))/5;
        stroke(C,255,255);      
        point( i, j);    
        point( -i, -j);    
        point( -i, j);    
        point( i, -j);            
    }
  }
  if( frameCount % 50 == 0){
   N += 50;
   N = N%1500 + 200;
  }
  ang += 0.01;
}

void keyPressed(){
  
 if( key == ' '){
      saveFrame("  #### imagen.png");
 } 
}

