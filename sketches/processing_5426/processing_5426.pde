
float x, y, vx, vy, vermelho, verde, azul;

void setup(){
  size(800,600);
  x=250;
  y=100;
  vx=2;
  vy=0;
  vermelho = 200;
  verde = 200;
  azul = 200;
 background(0,0,0);
}


void draw(){
  smooth();
  //background(250);
  
  stroke(10,10,10,10);
  strokeWeight(mouseY/250);
  fill(vermelho,verde,azul, 50); 
  ellipse(x, y, mouseX/06,mouseY/07);
  x = x + vx;
  y= y + vy;
  if(x >800){ 
    vx = -2;
    vy = 5;
    y = random(0,600);
    vermelho = random(0,255);
    verde  = random(0,255);
    azul  = random(0,255);
  }
  if(x<0){
    vx=2;
    vy = 3;
    y=random(0,600);
    vermelho = random(0,255);
    verde  = random(0,255);
    azul  = random(0,255);   
}
  if ( y>600) {
    vy = -random(0,5);
  }
  if (y <0) {
    vy = random(0,5);
  }
}


