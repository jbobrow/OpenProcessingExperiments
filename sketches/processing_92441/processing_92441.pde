
int number = 500;
int Clickety = 0;
float[] X_pos = new float[number];
float[] Y_pos = new float[number];
float[] Speed = new float[number];
float antigravity = -.1;

void setup() {
  size(600 , 600);
}
 
void draw() {
  background(0);
  
  
  for (int i = 0; i < number; i++) {
    Drawing(X_pos[i], Y_pos[i]);
    Y_pos[i] += Speed[i];
    Speed[i] += antigravity;
  }
}

void Drawing(float x, float y) {
  smooth();
 noStroke();
  fill(207, 6, map(y,0,height,0,255),150);

  ellipse(x,y,25,25);
  
 
  
}
 
void mouseMoved() {
  X_pos[Clickety] = mouseX;
  Y_pos[Clickety] = mouseY;
  Speed[Clickety] = -1;
  Clickety +=1;
  if (Clickety >= number) {
    Clickety =0;
  }
}
