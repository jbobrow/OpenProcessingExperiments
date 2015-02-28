
float dy, t;
int k;

void setup() {
  size(600, 600); 
  frameRate(30);
  dy = 0;
  k = 0;
  float t = 0.0;
  
  background(255);
}

void draw() {
  
  stroke(0,40);
  
  float x = width/4*sin(t+k)+width/2;
  float y = (3*height/8)*cos(t+k)+height/2+dy;
  float x2 = (3*height/8)*cos(t+10)+width/2;
  float y2 = width/4*sin(t+8)+height/2+dy;
  
  x = constrain(x,0,width-1);
  y = constrain(y, 0, height-1);
  x2 = constrain(x2,0,width-1);
  y2 = constrain(y2, 0, height-1);

  line(x, y,x2,y2);

  t += .1;
  dy += 0;
  k++;
}

void keyPressed() {
   if (keyCode == 32) {
      saveFrame("output/wrapping_paperI-####.png");
      println("saved");
   } 
}
