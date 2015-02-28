
int shapes = 200;
float[]speedX = new float[shapes];
float[]speedY = new float[shapes];
float[]x = new float[shapes];
float[]y = new float[shapes];
float[]w = new float[shapes];
float[]h = new float[shapes];
color[]colors = new color[shapes];
void setup(){
size(400, 400);
smooth();
frameRate(50);
noStroke();

for (int i=0; i<shapes; i++){
x[i]=0;
y[i]=random(width);
w[i]=random(10, 20);
h[i]=w[i];
colors[i]=color(random(255), random(255), random(255),90);
speedX[i] = random(3, 7);
speedY[i] = random(-5, 5);
}
}
void draw(){
for (int i=0; i<shapes; i++){
fill(colors[i]);
rect(x[i], y[i], w[i], h[i]);
x[i]+=speedX[i];
y[i]+=speedY[i];
}
}
