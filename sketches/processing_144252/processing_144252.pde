
float x = 1;
int y =11;
float e = 2;
float E = 0.1;
void setup() {
  size(500, 500);
  noCursor();
}

void draw() {
  noStroke();
  x = random(4, 5);
  background(255);
  fill(0);
  bezier(100, 300, 200, -90+mouseY/1.2, 300, -90+mouseY/1.2, 400, 300);
  ellipse(250, 300, 300, 70);
  fill(255, 170, 170);
  ellipse( width/2, 110+mouseY/1.2, 95, 155);
  fill(255);
  ellipse( 230, 80+mouseY/1.2, 20, 3);
  ellipse( 270, 80+mouseY/1.2, 20, 3);
  fill(0);
  ellipse(250, 170+mouseY/1.2, 30, e);
  stroke(0);
  strokeWeight(2);
if(mousePressed==true){
  e = 7;
 

}
else{
  e=2;}

  point(233, 80+mouseY/1.2);
  point(267, 80+mouseY/1.2);
  noStroke();

  fill(255);
  rect(0, 335, 500, 165);
}

