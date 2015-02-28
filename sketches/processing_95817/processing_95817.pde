
int numpoints = 0;
int frame = 0;
int elements = 50000;
float x[] = new float[elements];
float y[] = new float[elements];

 
void setup(){
  size(600,600);
  noStroke();
}
 
void mouseDragged() {
  x[numpoints] = mouseX;
  y[numpoints] = mouseY;
  numpoints += 1;
}
 
void draw() {
  background(164,102,255 );
  fill(255,255,255);
  rect(150, 520, 300, 100,7,7,0,0);
  rect(200, 420, 200, 100,7,7,0,0);
  fill(153,224,0);
  rect(290, 320, 20, 100);
  fill(255,0,0);
  ellipse(302,299,35,45);
  fill(255,255,0);
  ellipse(302,304, 20,30);
  fill(255, 180,255);
  rect(150,520,300,20,7,7,0,0);
  rect(200,420,200,20,7,7,0,0);
  fill(255,72,199);
  ellipse( 180, 565, 30,30);
  ellipse( 257, 565, 30, 30);
  ellipse( 340, 565, 30,30);
  ellipse( 413, 565, 30,30);
  ellipse( 220, 460, 20,20);
  ellipse(270, 460, 20,20);
  ellipse(330, 460, 20,20);
  ellipse(380, 460, 20,20);
  for (int i = 1; i < numpoints; i++) {
      x[i] += random(-1, 1);
      y[i] += random(-1, 1);
      int size = (frame + i) % 50;
      fill(x[i], y[i],x[i],x[i]);
      arc (x[i], y[i], size, size,0, PI+QUARTER_PI, PIE);
     
    float phase = frame / i;
   y[i] += phase % 10;
     
  }
  frame += 1; 
}
