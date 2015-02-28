
int gato=0;

   float vel=0;
  void setup(){
    size(800,800);
    background(252,252,0);
  }
  
  void draw() {
    gato=gato+5;
    background(vel,0,0,0);
    vel= dist(mouseX, mouseY, pmouseX, pmouseY);// mide la velocidad
  
  stroke(18,4,20);
  fill(13,250,236);
  rect(600,600,600,600);
  fill(250,80,13);//naranja
    ellipse(gato,gato,250,250);
 
  fill(103,4,175);//morado
  ellipse(gato,mouseY,100,100);
  fill(182,242,247);//circulo interior
  
  ellipse(mouseX,gato,50,50);
  fill(88,250,40);//circulo interior verde
  
  ellipse(gato,gato,25,25);
  fill(31,13,250);
  
  rect(220,220,220,220);
    ellipse(gato,gato,25,25);
  if(gato>width){gato=0;}
  
}
