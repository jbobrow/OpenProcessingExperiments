
void setup(){
  size(ancho,alto);
  noStroke();
  background(#FFFFFF);
  smooth();
  frameRate(200);
}



int alto = 500;
int ancho = 950;
float i = 0;

void draw () {
    cDraw ();
}


void cDraw () {
  i = i + 0.2;

  translate(width/2, height/2);
  rotate(i);

  fill(colorSelector((int)random(0,colores.length)));
  float r1 = random(50,random(600));
  float r = r1/50;
  ellipse(r1,0,r,r);
  
}

color [] colores =  { #81D8E3,#6CD41C,#EDEF10,#FF12C4,#BC20D4 };

color colorSelector(int i) {
  return  colores[i];
}

void mouseReleased(){ 
  background(#FFFFFF);
  redraw();
  i = 0;
  loop();
}
   


