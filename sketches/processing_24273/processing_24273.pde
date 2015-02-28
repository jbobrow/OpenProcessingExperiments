
void setup(){
  size(200,200);
  smooth();
}

void draw(){
  background(255);
  dibujaCaraFeliz(100, 80, 20, color(0),0, PI);
  dibujaCaraFeliz(20,150,15,color(100),0,PI);
  dibujaCaraFeliz(30,15,30,color(200,0,0),0,PI);
  dibujaCaraFeliz(150,150,20,color(0,200,0),0,PI);
  

}

void dibujaCaraFeliz(int x, int y, int magnitud, color c, int start, float stop){
  noStroke();
  fill(c);
  ellipseMode(CENTER);
  ellipse(x,y,magnitud,magnitud);
  ellipse(x+40,y,magnitud,magnitud);
  arc(x+20,y+20,magnitud+30,magnitud+30,start,stop);
}


