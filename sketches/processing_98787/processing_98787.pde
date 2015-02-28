
/*
Al dar click con cualquier botón del mouse hace un cambio de árbol
me dibuja siempre uno distinto ya que utilize valores de random
tanto para determinar el número de ramas como para determinar
el ángulo de abertura entre ellas.
*/
void setup(){
  smooth();
  size(900,700);
  noLoop();
}
 
void draw()
{
  background(255);
  translate(width /3,height);
  stroke(63,28,15);
  strokeWeight(10);
  line(160,160,160,-250);
  translate(160,-250);
  arbol(150,10);
}

void mouseReleased(){
  redraw(); 
}
 
void arbol(float ramas,float grosor){
  ramas *= .75;
  grosor *=0.8;
  float maxPintar=1;
  float maxPixel=random(.5);
  float rotar = random(.3);
  if(ramas>maxPixel){
  //Con esto hago lo de la coloración de las hojas  
  if (ramas<maxPintar)  {
    fill(0,163,0,80);
  }
    pushMatrix();
    strokeWeight(grosor*0.5);
    //Con la rotación hago lo del ángulo entre las ramas
    rotate(rotar-random(1.3));
    curve(-10+grosor,-50,0,0,0,-ramas,30+grosor,-75);
    translate(0,-ramas);
    arbol(ramas,grosor);
    popMatrix();
    
    pushMatrix();
    strokeWeight(grosor);
    rotate(-rotar+random(1.3));
    curve(-10+grosor,-50,0,0,0,-ramas,30+grosor,-75);
    translate(0,-ramas);
    arbol2(ramas,grosor);
    popMatrix();     
  }
}

void arbol2(float ramas,float grosor){
  ramas *= .75;
  grosor *=0.8;
  float maxPintar=1;
  float maxPixel=random(5);
  println(maxPixel);
  float rotar = random(.3);
  if(ramas>maxPixel){
  //Con esto hago lo de la coloración de las hojas  
  if (ramas<maxPintar)  {
    fill(0,163,0,80);
  }
    pushMatrix();
    strokeWeight(grosor);
    rotate(-rotar+random(1.3));
    curve(-10+grosor,-50,0,0,0,-ramas,30+grosor,-75);
    translate(0,-ramas);
    arbol(ramas,grosor);
    popMatrix();     
  }
}


