
void setup() {
  size(400, 400);
}


void draw(){
   int s = second();
  int h = hour();
  
  fill(s, s + s,  s, s );
  rect(0, 0, 400, 400);
  
STARS(mouseY + s + 30, mouseY + s);
STARS(mouseY + s, mouseX + s);
STARS(mouseX + s + 50, mouseX + s);
STARS(mouseY + s + 94, mouseX + 33);
STARS(mouseX + s - 55, mouseX - 80);
STARS(mouseY + s + 100, mouseY - 100);
STARS(mouseX + s + 100, mouseX - 100);
STARS(mouseX - s - 100, mouseX - 100);
STARS(mouseX - s- 200, mouseX - 300 + s);
STARS(mouseY - s- 300, mouseX - 200 + s);
STARS(mouseY + s - 180, mouseX -100 - s);
STARS(mouseX - s - 90, mouseX - 100 + s);
}

void STARS(int x, int y){
  fill(234, 210, 245);
  ellipse( x+ 5, y + 40, 7,7);
 fill(8, 255, 179);
 ellipse(x + 99, y + 10, 5, 5);
 fill(252, 145, 246);
 ellipse (x + 15, y + 25, 6,6);
 fill(15, 57, 255);
 ellipse ( x + 66, y + 10, 7, 7);
 fill(140, 54, 255);
 ellipse( x + 50, y + 90, 5, 5);
}



