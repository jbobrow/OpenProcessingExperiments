
int x=25; // ////variables enteras
int y=25;
void setup (){ ////// configuracion
  size(480,480);
  frameRate(30); //////cuadros por segundo
}
void draw(){ // ////dibuja
  background(255);
  color c = color(255, 129, 129);  // Define color 'c'
fill(c);  // Use color variable 'c' as fill color
noStroke(); 
  ellipse(x,y,50,50);
  color a = color(70, 60, 126);  // Define color 'c'
fill(a);  // Use color variable 'c' as fill color
noStroke();
  ellipse(x-10,y-10,7,5);/// ojo 1
  ellipse(x+10,y-10,7,5);/// ojo 2
  ellipse(x,y+13,20,5); /// boca
  ellipse(x,y,4,6);  //// nariz
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      y=y-5;
    } if (keyCode == DOWN) {
      y=y+5;
    } if (keyCode == RIGHT){
      x=x+5;
    } if(keyCode == LEFT) {
      x=x-5;
  }
  } 
  }

