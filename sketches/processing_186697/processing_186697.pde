
float r=100;
float theta = 0;
float x, y;
float vel;
float T=100;
void setup() {
  size(400,400);
  background(0);
  vel=2*PI*1/T;
 
}

void draw() {
    
    
  //coordenadas polares
  x = r * cos(theta);
  y = r * sin(theta);
  
  //dibujar elipse y eje de coordenadas
  stroke(255);
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2);
  fill(255);
  translate(width/2,height/2);
  ellipse(x, y, 5, 5);
  //mover
  theta += vel;
  //parar elipse cuando llegue a 0
  if(r>0)
  {r-=0.2;}
  else{
  vel=0;}
  
  
}



