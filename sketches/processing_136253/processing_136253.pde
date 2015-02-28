
/* This time i was inspired by the dragonflies, so i tried to
 * simulate them with lines and color, and i modified too an
 * algorithm that i'm studying related to fractals, this is the
 * end result, i hope you like it.
 */
 
/* Please use the mouse to draw around the canvas, you can clear
 * the screen by clicking on it. You can also change the color 
 * palette of the lines typping 'r', or save the canvas with key
 * 's'.
 */

color palette[]= {#9FC3FF, #6CE0E8, #ABFFD2, #A0E890, #F7FF9F};
color palette2[]= {#D9304F, #1F1926, #F2F2F2, #F2D6BD, #F25D27};

int cambio=1;
void setup(){
  size(800, 600);
  background(#3B3434, 50);
  
}

void draw(){
  strokeWeight(random(10));
  if(mousePressed){
    clear();
    background(#3B3434, 50);
  }
}

void mouseMoved(){
  Cursor cursor= new Cursor(mouseX, mouseY, random(360) );
  iniciarKoch(cursor, (int)random(160), 0);
}

void keyPressed(){
  if(key=='S' || key=='s')
    saveFrame("myPicture.png");
    
  if(key=='R' || key=='r')
    cambio=cambio*-1;
}

void iniciarKoch(Cursor cursor, int longitud, int iteraciones){
  //int coordX= inicialX;
  //int coordY= inicialY; 
  //float ang= 0;
  dibujarKoch(cursor, longitud, iteraciones);
}

void dibujarKoch(Cursor cursor, int distancia, int n){
 // println("x: " + x + ", y: " + y + ", angulo: " + angulo);
  if(n==0){
    avanzar(cursor, distancia);
  }
  else{
    dibujarKoch(cursor, distancia/3, n-1);
    cursor.angulo = random (cursor.angulo+ 2*PI) ;
    dibujarKoch( cursor, distancia/3, n-1);
    cursor.angulo= random (cursor.angulo - 2*PI);
    cursor.x = cursor.x + distancia/3;
    cursor.y = cursor.y + distancia/3;
    dibujarKoch(cursor, distancia/3, n-1);
    cursor.angulo= random(cursor.angulo + 2*PI);
    dibujarKoch(cursor, distancia/3, n-1);
  }
}

void avanzar(Cursor cursor, int distancia){
  pushMatrix();
  println("angulo : "+ cursor.angulo);
  float px = cursor.x + distancia*cos(cursor.angulo);
  float py = cursor.y + distancia*sin(cursor.angulo);
  stroke(1);
  println("x: " + cursor.x + ", y: " + cursor.y + ", x2: " + px + ", y2: " + py);
  rotateX(cursor.angulo);
  //rotateY(cursor.angulo);
  //rotateZ(cursor.angulo);
  if(cambio==1)
    stroke(palette[(int)random(5)], 70);
   else
    stroke(palette2[(int)random(5)], 70);
  line(cursor.x, cursor.y, px, py);
  popMatrix();
}

public class Cursor{
  int x;
  int y;
  float angulo;
  public Cursor(int cx, int cy, float a){
    x=cx;
    y=cy;
    angulo=a;
  }
}

