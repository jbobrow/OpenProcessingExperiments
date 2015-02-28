
float posicion=0, posicion1=0;
float velocidad = 1.0/24.0;
void setup (){
  size(800,600);
}
void draw(){
 background (noise(0,255),random(100,255),noise(0,255),random(0,255));
 
 fill(230,random(0,255),random(0,255),random(0,255));
  posicion= posicion +velocidad;
  posicion1+=velocidad*10;
  float radio=noise(posicion)*50.6; 
  //stroke(0);
  for(float i=0.3; i<10;i+=1.89)
  ellipse((sin (posicion1)*300)+100,(sin(posicion)*100)+300,radio*i,radio*i);
}

