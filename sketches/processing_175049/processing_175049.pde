

int counter;

void setup() {  
  size(400, 250);
  background(0, 127, 255);  
}
void draw() { 
  
  if (mousePressed == true){
  snowman( mouseX, mouseY);
  }
  }
void snowman(int x, int y) {
fill (0, 200, 200);
ellipse( x, y, 30, 30); //head
fill (0, 150, 120 );  
ellipse (x, y + 40, 50, 50); //torso
fill (120, 25, 50);
ellipse ( x, y + 100, 70, 70); //booty
fill(0);
ellipse(x + 5, y - 3, 5 ,5); //left eye
ellipse(x - 5, y - 3, 5 , 5); //right eye
triangle(x, y, x + 2, y + 1 , x +4, y -2);

}
