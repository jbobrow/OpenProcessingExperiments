
int RED = 142;
int GREEN = 179;
int BLUE = 193;
int ellipseSize = 80;//declares variable


void setup(){
  size(300, 600);
  background(RED, GREEN, BLUE);
}

void draw(){
  background(RED,GREEN,BLUE);//resets background
  println(mouseX + " " + mouseY);//shows coordinates in bottom panel
  fill(mouseX,BLUE,mouseY-BLUE);
  noStroke();
  rect(50,100, mouseX,mouseX);
  ellipse(mouseX,mouseY, ellipseSize,mouseX);
  
  strokeWeight(15);
  stroke(mouseX,mouseY,mouseY-mouseX);
  line(mouseX,mouseY,260,500);
  
}






