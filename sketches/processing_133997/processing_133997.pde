
int x;
float speedX = 1.0;
int shapes = 40;
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
color[]colors = new color[shapes];
void setup(){
size(800, 400);
frameRate(80);
background(0,0,0);
noStroke();
for (int i=0; i<shapes; i++){
y[i]=random(height);
w[i]=random(15)+2;
h[i]=w[i];
colors[i]=color(random(255), random(255), random(255));
}
}
void draw(){
for (int i=0; i<shapes; i++){
fill(colors[i]*2);
rect(x, y[i], w[i], h[i]);
}
x+=speedX;
}
void mousePressed() {
  loop();
}


void mouseDragged() 
{
 for (int i=0; i<shapes; i++){
 colors[i] = colors[i] + 1000;  
  if (colors[i] > 140) {
    colors[i] = 0;
  }
}
}
void mouseReleased() {
  noLoop();
}
