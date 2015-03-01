
int px; // posición en x
int py; // posición en y
float vx =random(0.5,2); // velocidad en x (aleatoria)
float vy =random(0.5,2);// velocidad en x (aleatoria)
void setup() {
size(500,500);
colorMode(HSB);
background(0,0,0);
}
 
void draw() {
  px+=vx; //variacion de la posicion segun la velocidad
  py+=vy;
  if(px>width||px<0){ // cuando la bola llega al borde
  vx=vx*-1; // cambie la direccion
  }
  if(py>height||py<0){
  vy=vy*-1;
  }
  stroke(random(170),random(255),255);
if (mousePressed){
 line(height,width/2,mouseX,mouseY);
 line(height/2,0,mouseX,mouseY);
  line(0,width/2,mouseX,mouseY);
   line(height/2,width,mouseX,mouseY);
}
  stroke(random(255),random(170),255);
line(0,0,mouseX,mouseY);
 line(0,width,mouseX,mouseY);
  line(height,0,mouseX,mouseY);
   line(height,width,mouseX,mouseY);
}

