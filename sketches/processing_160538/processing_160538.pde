
float r;
float g;
float b;
float a;
int minDiam = 10;
int maxDiam = 100;
int lineThickness = 10;
color lineColor = color(0, 0, 0);
int diam;
int increment=5;
void setup() {
  size(400, 400);
  diam=100;
  fill(#0018ff);
}
void draw() {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
}
void mouseDragged(){
    background(100);
    noStroke();
    fill(#0018ff);
    ellipse(mouseX, mouseY, r, g); 
    diam=diam+increment*15;
    if (diam>maxDiam||diam<minDiam){
    increment=-increment;
    }
} 


