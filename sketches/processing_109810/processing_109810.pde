
float ArrX[];
float yoff = 0.0;
float yoff2 = 0.0;
float yoff3 = 0.0;

void setup(){
size(500,500);
frameRate(60);
}

void draw(){
background(255,255,255,100);

for (int i = 0; i < 500; i = i+5) {
  for (int j = 0; j < 500; j = j+5) {
    stroke(i/random(0,2), j/random(0,2), random(0,255), 200);
    strokeWeight(random(1,5));
    point(i, j);
  }
}
  strokeWeight(1);
  stroke(0,0,0,100);
  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);
  star(0, 0, 10, 100, 3); 
  popMatrix();


  fill(150,150,255,random(150,200));
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff, yoff), 0, 1, 300,400); // Option #1: 2D Noise
    vertex(x, y); 
    xoff += 0.05;
  }
  yoff += 0.08;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  fill(100,100,255,random(50,150));
  beginShape(); 
  float xoff2 = 0;       // Option #1: 2D Noise
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff2, yoff2), 0, 1, 350,450); // Option #1: 2D Noise
    vertex(x, y); 
    xoff2 += 0.05;
  }
  yoff2 += 0.12;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);
  
  fill(50,50,255,random(10,50));
  beginShape(); 
  float xoff3 = 0;       // Option #1: 2D Noise
  for (float x = 0; x <= width; x += 10) {
    float y = map(noise(xoff3, yoff3), 0, 1, 400,500); // Option #1: 2D Noise
    vertex(x, y); 
    xoff3 += 0.05;
  }
  yoff3 += 0.05;
  vertex(width, height);
  vertex(0, height);
  endShape(CLOSE);

}

void star(float x, float y, float radius1, float radius2, int npoints) {
  fill(255);
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}


