
void setup(){
size (700, 700);
background(255);
smooth();
}

void draw(){
  face(350,350);
  face(150,250);
  face(550,250);
}

void face(float x, float y) {  
  //head
  noStroke();
  fill(172, 228, 247);
  ellipse (x, y, 200, 200); 
  //bags under eyes
  fill(105, 163, 183, 100);
  ellipse(x+45, y-40, 60, 30);
  ellipse(x-45, y-40, 60, 30);
  //eyes
  fill(255, 255, 255);
  ellipse (x+50, y-50, 60, 30);
  ellipse (x-50, y-50, 60, 30);
  //pupils
  fill (0);
  ellipse (x+45, y-45, 20, 20);
  ellipse (x-45, y-45, 20, 20);
  //blush
  fill(255, 178, 178, 100);
  ellipse (x+75, y-10, 25, 25);
  ellipse (x-75, y-10, 25, 25);
  //mouth
  fill(0);
  arc (x, y, 150, 150, radians(0), radians(180));
  //teeth
  fill(255);
  for (float i=0;i<130; i+=20) {
    arc ((x-60)+i, y, 20, 20, radians(0), radians(180));
  }
}

