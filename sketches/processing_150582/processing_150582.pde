
//SEGUNDA FUNCION OSCILADORA:
float v = 15;
float x,y;
float dt = 0.001;
float dx;
float A = 60; //amplitud de la onda osciladora

void setup(){
  size(800,400);
  smooth();
}

void draw(){
  
  //background(180);
  
  //redibujado de los ejes
  line(width/8,height/2, width-width/8,height/2);
  line(width/4, height/8, width/4, height-height/8);
  noStroke();
  //variación de los parámetros:
  dx = v*dt; //v=dx/dt --> dx=v*dt
  x += dx; //cuando ya se tiene el valor del incremento se añade a x
  
  //función osciladora 2
  pushMatrix();
  y = A*(0.5*sin(3*x) + 0.5*sin(3.5*x));
  translate(x*10,y*2);
  fill(255, 0, 0);
  strokeWeight(0);
  ellipse(width/8+100, (height/2), 5, 5);
  popMatrix();
  
}


