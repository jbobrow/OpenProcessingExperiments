
int x;


void setup () {
  size (600, 600);
  frameRate(20);
  background (0);
 
}

void draw() {

  for (int i=0; i<800; i=i+100)


    andlit(mouseX, mouseY);
 
  

}






void andlit(int x, int y) {
  float r = random(200);

  fill(random(255), random(255), random(255));
  stroke(0);
  ellipse(x, y, 90, 100);
  noStroke();
  fill(255, 0, 0);
  ellipse(x-25, y+10, 10, 10);
  ellipse(x+30, y+10, 10, 10);
  strokeWeight(10);
  stroke(255);
  point(x-10, y-10);
  point(x+15, y-10);
  strokeWeight(4);
  stroke(0, 0, 255);
  point(x-10, y-10);
  point(x+15, y-10);
  strokeWeight(2);
  stroke(0);
  curve(x-20, y-14, x-15, y-18, x-10, y-18, x, y-14);
  curve(x+10, y-14, x+15, y-18, x+20, y-18, x+25, y-14);
  noStroke();
  fill(250, 189, 229);
  triangle(x-5, y+15, x+5, y+15, x+2.5, y-7);
  strokeWeight(1);
  noStroke();
  fill(0);
  ellipse(x, y+30, 7, 9);
} 

void hittandlit(int x, int y) {
  fill(0, 225, 225);
  stroke(255);
  ellipse(x, y, 90, 100);
  noStroke();
  fill(0, 255, 0);
  ellipse(x-25, y+10, 10, 10);
  ellipse(x+30, y+10, 10, 10);
  strokeWeight(10);
  stroke(128);
  point(x-10, y-10);
  point(x+15, y-10);
  strokeWeight(4);
  stroke(70, 50, 255);
  point(x-10, y-10);
  point(x+15, y-10);
  strokeWeight(2);
  stroke(190);
  curve(x-20, y-14, x-15, y-18, x-10, y-18, x, y-14);
  curve(x+10, y-14, x+15, y-18, x+20, y-18, x+25, y-14);
  noStroke();
  fill(29, 89, 259);
  triangle(x-5, y+15, x+5, y+15, x+2.5, y-7);
  strokeWeight(1);
  noStroke();
  fill(76, 0, 178);
  ellipse(x, y+30, 7, 9);
}

