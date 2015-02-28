
float r= 0;
float g= 0;
float b= 0;

void setup() {
  size(500,500);
  smooth();
}
 
void draw() {
  background(r, g, b);
  stroke(0);
  strokeWeight(.5);
  fill(mouseX,mouseY,70,100);
  rect(mouseX, mouseY, mouseX-30, mouseY-30);

if(mouseX > width/2){
  r= r+1;
} else {
  b= b-1;
}
 
if(mouseY > width/2){
  b= b+1;
} else {
  g= g-1;
}

if(mousePressed){
  g= g+1;
} else {
  r= r-1;
}

r= constrain (r,0,255);
g= constrain (g,0,255);
b= constrain (b,0,255);
}


