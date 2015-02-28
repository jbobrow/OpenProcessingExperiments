
float deg = 0;
float deg2 = radians(30); 

int numCircles = 10;
int spacing = 20;

void setup() {
  size(800, 600);
  smooth();
  background(0);
}
void draw() { 

  //background circles
  translate(width/2, height/2);
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  for (int i =0; i < 9; i++) {
    for (int j = 0; j < 7; j++) {
      eyes(i*100+int(random(5)), j*100+int(random(5)), int(map(mouseX, 0, 800, 5, 10)));
    }
  }
  //orange squares
  rotate(deg2); 
  fill(255, random(80, 190), 31, 100); 
  for (int a = 0; a < width; a+= map(mouseX, 0, 800, 20, 120)) {
    for (int b=0; b < height; b += map(mouseX, 0, 800, 20, 120)) {  
      rect(a, b, map(mouseX, 0, 800, 10, random(100, 150)), map(mouseY, 0, 600, 10, random(100, 150)));
      deg2+= map(mouseX, 0, 800, 1, 0.1);
    }
  }
  //white circles 
  rotate(deg); 
  //fill(map(mouseX, 0,800,220,random(1,255)),map(mouseX, 0,800,220,random(1,255)),map(mouseX, 0,800,220,random(1,255)),map(mouseX, 0,800,220,random(1,255)));
  fill(255, random(10, 200));
  for (int a = int(map(mouseX, 0, 800, 0, 50)); a < width; a+= 100) {
    for (int b= int(map(mouseX, 0, 800, 0, 50)); b < height; b += 100) {  
      ellipse(a, b, map(mouseX, 0, 800, 50,200), map(mouseX, 0, 800, 50,200)); 
      deg+= 0.25;
    }
  }
}

void eyes(int xPos, int yPos, int numCircles) {
  rotate(deg);
  stroke(127);
  strokeWeight(3);
  noFill();

  for (int i=0;i < numCircles;i++)
  {
    stroke(map(mouseX, 0, 800, random(90, 255), random(1, 255)), map(mouseX, 0, 800, 25, random(1, 255)), map(mouseX, 0, 800, 222, random(200, random(1, 255))), map(i, 0, numCircles, 127, 0));
    strokeWeight(50);
    ellipse(xPos, yPos, map(mouseX, 0, 800, i*spacing, i*spacing+100), map(mouseX, 0, 800, i*spacing, i*spacing+100));
    deg++;
  }
}
