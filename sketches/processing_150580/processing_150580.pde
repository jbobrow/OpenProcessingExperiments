
//PRIMERA FUNCIÃ�N OSCILADORA:
float v = 10;
float x,y;
float dt = 0.006;
float dx;
float A = 60; //amplitud de la onda osciladora

void setup(){
  size(800,400);
  smooth();
}

void draw(){
  //background(100);
  //dibujado de los ejes
  line(width/8,height/2, width-width/8,height/2);
  line(width/4, height/8, width/4, height-height/8);
  noStroke();
  //variaciÃ³n de los parÃ¡metros:
  dx = v*dt; //v=dx/dt --> dx=v*dt
  x += dx; //cuando ya se tiene el valor del incremento se aÃ±ade a x
  
  //funciÃ³n osciladora 1
  pushMatrix();
  y = A*sin(x)*exp(-0.002*x);
  translate(x*2,y*2);
  fill(255,0,0);
  strokeWeight(0);
  ellipse(width/8+100, (height/2), 5, 5);
  popMatrix();
  

  
}


