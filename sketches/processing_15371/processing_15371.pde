
Flake[] flakes = new Flake[1000];

int totalflakes = 0;

void setup(){
  size (1000,1000);
  smooth();
}

void draw(){
  //background(0);
  fill (0,30);
  rect(0,0,width,height);
  
  
  flakes[totalflakes] = new Flake();
  
  totalflakes++;
  
  if (totalflakes >= flakes.length) {
    totalflakes = 0;
  }
  
  for (int i = 0; i < totalflakes; i++ ) {
    flakes[i].llover();
    flakes[i].mostrar();
    flakes[i].rebotar();
  }
  
}
class Flake {
  
  float x,y;
  float velocidadY;
  float velocidadX;
  color c;
  float r;
  
  Flake() {
    r = 8;
    x = random(width);
    y = -r*4;
    velocidadY = random(10);
    velocidadX = random(10);
    c = color(240,245,245);
  }
  void llover() {
    y += velocidadY;
    x+=velocidadX/4;
  }
  
  void rebotar(){
    if (y>=height){
      velocidadY=velocidadY*-1;
    }
    if (x>=width || x <0){
      velocidadX = velocidadY*-1;
  }
  }
  void mostrar() {
    fill(c);
    noStroke();
    
    for (int i = 2; i < r; i++) {
      ellipseMode(CENTER);
      noStroke();
      ellipse(x,y,12,12);
      stroke(255);
      line (x-18,y,x+18,y);
      line (x,y-18,x,y-18);
      
      //line (x,y,x,y);
      
    }
  }
  
}

