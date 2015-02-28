
int x=10;
int y=10;
void setup() {
  size(400,400);
print("hola");
background(25,45,58);
}
void draw() {
  x=mouseX;
  y=mouseY;
  println("primer proyecto");
  rect(x,y,4,4);
}
void mousePressed( ) { 
 fill(x,y,45); 
stroke(10);
}

void mouseReleased( ) { 
 noFill(); 
 noStroke();
}
