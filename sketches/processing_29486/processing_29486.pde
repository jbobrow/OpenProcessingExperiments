
boolean button = false;
int x = 30; 
float y = 0; 
int velocidad = 2; 
float velocidady = 0.1;
float c = 120;
float m = 50;
float k = 250;
int r =30;
int v = 30;
int b = 75;
int a = 150;
int w = 50;
int h = 25;
void setup() {
size(200,200);
}
void draw() {
background(c,m,k);
noStroke();
fill(255,0,0);
ellipse(x,y,v,r);


if((x > width) ||(x<10)) {
  velocidad=velocidad*-1;
  r=64;
}
if((y>height)||(y<0)){
  velocidady=velocidady*-0.25;
  r=64;
}
if (button) {
x = x + velocidad;
y = y + velocidady;
}
fill(255);
rect(b,a,w,h);
r=constrain(r-2,30,64);

if(mouseX > width/2) {
c = c + 1;
} else {
c = c - 1;
}
if (c > 255) {
c = 255;
} else if (c < 0) {
c = 0;
}
}
void mousePressed(){
  if (mouseX > b && mouseX < b + w && mouseY > a && mouseY < a + h){
button = !button;
}
}

