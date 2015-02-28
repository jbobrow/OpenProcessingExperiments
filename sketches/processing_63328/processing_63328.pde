
void setup() {
  size(500,800);
  background(255,200,220);
  stroke(255);
  noFill();
  smooth();
  frameRate(6);
 
}
void draw(){
strokeWeight(4);
int a = (int)random(255);
int b = (int)random(5);
if (a > 100)   a = -40;

triangle(50,20,450,20,250,300);
fill(a,mouseX,mouseY,(mouseX/5));
triangle(150,mouseY/10,180,50,155,100);
rect(200,200,100,200);
line(200,400,150,500);
line(300,400,350,500);
triangle(320,50,370,50,345,100);

}

  void keyPressed() {
  saveFrame("test.png");
}
/* programmkommentare */

