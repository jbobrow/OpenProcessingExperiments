
String txt1 = "WO FUCHS UND APFEL SICH IN DEN SCHWANZ BEIßEN?";

 
int x = 0;
 
PFont font;
 
void setup() {
  size(800, 100);
  smooth();
  font = loadFont("Untitled-48.vlw");
}
 
void draw() {
  background(0);
 
 
  fill(255);
  textFont(font, 100);
  text(txt1, x,80);

  x = x -3 ;
  
  if (mousePressed) {
    x = x +7 ;
    
    if (mousePressed && mouseX == RIGHT){
  x = x +30;  
  
  }
}
}


