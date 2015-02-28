
int s,m,h; 
int a,b,c;
float rojo=255,azul=255,verde=255;
void setup (){
  size (800,400);
    background(255,255,255);
}

void draw(){
  background(rojo,verde,azul);
  
  azul=map(h,0,12,255,0);
  rojo=map(h,0,12,255,0);
  verde=map(h,0,12,255,0);  
 
  //carátula del reloj
  pushMatrix();//Círculo en medio.
  translate(width/2,height/2);
  fill(242,181,59);
  strokeWeight(2);
  ellipse(0,0,200,200);
  s=second();
  m=minute();
  h=hour();
  if(h>=12){
    h=h-12;
  }  
  //Minutos
  pushMatrix();
  rotate(radians(6*m));
  strokeWeight(1.5);
  line(0,0,0,-60);
  popMatrix();
  popMatrix();
  
  pushMatrix();//Círculo Izq.
  translate((width/2)-250,height/2);
  fill(177,242,69);
  strokeWeight(2);
  ellipse(0,0,200,200);
  
  //Segundos
  pushMatrix();
  rotate(radians(6*s));
  strokeWeight(.5);
  line(0,0,0,-70);
  popMatrix();
  popMatrix();
  
  pushMatrix();//Círculo Der.
  translate((width/2)+250,height/2);
  fill(59,173,242);
  strokeWeight(2);
  ellipse(0,0,200,200);
  
  //Hora
  pushMatrix();
  rotate(radians(30*h));
  strokeWeight(2.5);
  line(0,0,0,-40);
  popMatrix();
  popMatrix();
 
}
 



