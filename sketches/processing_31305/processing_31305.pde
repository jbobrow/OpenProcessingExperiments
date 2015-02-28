
float x ;
float y ;
float dia = 50;
float radius = dia/2;
color col = color(200);

void setup () {
  size(500,500);
  background (255) ;
  x = width/2;
  y = height/2;
}

void draw () {
  fill(col);
  ellipse(x,y, dia, dia);
  
  if (mousePressed == true) {
    if (mouseX > x-radius && mouseY< x+radius 
    && mouseY > y-radius && mouseY < y+radius) {
    col = color( random (255));  
     }
     }
     }
      
