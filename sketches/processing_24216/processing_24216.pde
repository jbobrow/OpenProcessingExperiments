
int lineCount = 6;
int current = 1;

void setup(){
  size (500,1000);
  background(88, 159, 250);
  smooth();
}

void draw(){
  stroke(255);
  fill(255,5);
  ellipse(0, 0, 235, 235);
  ellipse(200, 500, 200, 200);
  ellipse(180, 800, 150, 150);
  ellipse(380, 120, 170, 170);
  ellipse(110, 950, 100, 100);
  ellipse(50, 300, 80, 80);
  ellipse(400, 350, 140, 140);
  strokeWeight(4);
  
  noStroke();
  stroke(247, 250, 88);
  line(current *25 / lineCount, 0, 
  current * 90 / lineCount, 1000);
 
 current = current + 15;

}

