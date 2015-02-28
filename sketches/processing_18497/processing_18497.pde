
void setup() {
  size(250, 250);
  background(0);
  noStroke();
  frameRate(10);	
}

int a = 0;

void draw() {
 
stroke(255, 106, 106);
rect(a++%90, 20, 0, 1); 

stroke(117, 206, 255);
rect(a++%250, 30, 0, 1);

stroke(175, 255, 106);
rect(a++%190, 35, 0, 1);

stroke(204);
rect(a++%50, 50, 0, 1);

stroke(204, 192, 0);
rect(a++%150, 60, 0, 1);

stroke(192, 0, 0);
rect(a++%250, 62, 0, 1);

stroke(27, 0, 152);
rect(a++%200, 66, 0, 1);

stroke(152, 0, 142);
rect(a++%250, 75, 0, 1);

stroke(245, 240, 244);
rect(a++%80, 80, 0, 1);

stroke(255);
rect(a++%100, 150, 0, 1);

stroke(247, 169, 0);
rect(a++%240, 100, 0, 1);

stroke(0, 247, 47);
rect(a++%250, 105, 0, 1);

stroke(125, 137, 3);
rect(a++%230, 120, 0, 1);

stroke(252, 0, 135);
rect(a++%220, 130, 0, 1);

stroke(103, 103, 103);
rect(a++%210, 140, 0, 1);

stroke(124, 56, 107);
rect(a++%200, 160, 0, 1);

stroke(94, 124, 56);
rect(a++%190, 170, 0, 1);

stroke(245, 198, 255);
rect(a++%180, 180, 0, 1);

stroke(245, 198, 255);
rect(a++%170, 190, 0, 1);

stroke(251, 234, 255);
rect(a++%160, 200, 0, 1);

stroke(251, 234, 255);
rect(a++%150, 210, 0, 1);

stroke(255, 255, 255);
rect(a++%140, 220, 0, 1);

stroke(255, 255, 255);
rect(a++%130, 230, 0, 1);

stroke(196, 196, 196);
rect(a++%120, 240, 0, 1);

stroke(129, 129, 129);
rect(a++%110, 245, 0, 1);

stroke(67, 67, 67);
rect(a++%100, 250, 0, 1);

}

