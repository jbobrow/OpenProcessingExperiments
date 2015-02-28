
//comportament emergent

//declaracio de la clase boleta
Boleta []a;
 
void setup(){
  size(600, 600);
  fill(255,0,0);
 
 //declaració del array a classe boleta
  a = new Boleta[400];
  for (int i=0; i<a.length; i++){
    a[i] = new Boleta();
    a[i].x = mouseX;
    a[i].y = mouseY;
    a[i].diametre = (int)random(10, 40);
    a[i].velocitat = (int)random(20, 100);
    a[i].colors = color(random(0,255));
  }//cierra for
}//cierra setup

void draw(){
  background(25,100,35);
  fill(150,255);
  stroke(100);
 
  for (int i=0; i<a.length; i++){
    a[i].moure();
    a[i].veure();
  }//cierra for
 
}//cierra draw

//declaració de les variables de la classe boleta
class Boleta{
  float x, y;
  int diametre;
  int velocitat;
  color colors;
 
  void veure(){
    fill(colors);
    ellipse(x, y, diametre, 2*diametre);
    if (x>600) x = 0;
    if (y<0) y = 400;
  }//cierra mostrar
 
  void moure(){
    x += (random(-2, 2)) * 0.1 * velocitat;
    y += (random(-2, 2)) * 0.1 * velocitat;
     
  }//cierra mover
}//cierra bola
