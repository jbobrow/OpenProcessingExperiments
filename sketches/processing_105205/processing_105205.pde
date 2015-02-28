
int xPos;
int yPos;
int velocity;

void setup () {
  size (500, 500);
  xPos= width/2;
  yPos = height/2;
  velocity= 15;

}
void draw() {
  background (255);
  fill (0, 255, 0);
  if (yPos>= height || yPos<=0) {
    velocity=(velocity*-1);
println ("we're inside the if statement");  
}
yPos= yPos+velocity;
  ellipse (xPos, yPos, 50, 50);
  
  println ("velocity "+ velocity);
  println ("yPos "+yPos);

}
