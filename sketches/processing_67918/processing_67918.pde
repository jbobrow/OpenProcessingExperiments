
int inc=0;

void setup(){
  
 size(400, 400);
 noFill(); 
 background(255, 255, 255); 
  
  
}

void pacman(int x, int y, int ancho, int alto){
  
  arc(x, y, ancho, alto, 0, 2*PI-PI/4);
  
}


void fantasma(int x, int y){
 PImage fan;
 fan = loadImage("fantasma.png");
 image(fan, x, y);
  
}

void draw(){
  
  //background(255);
  stroke(255, 255, 0);
  fill(255, 255, 0);
  pacman(50, 50, 100, 100);
  fantasma(100+inc, 100);
  inc += 1;
}

