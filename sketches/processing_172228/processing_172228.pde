
float counter=0;

void setup() {
size(500, 500);
smooth();
background(255);
}

void draw() {
  //colorMode(HSB,360,100,100);
  background(0);
  noStroke();
 float maus=map(mouseX,0,width,1,0.5);
  float amplitude =map(sin(counter),180,180,0,180);
  int i = mouseX;
while (i <= width) {
  fill(amplitude, random(360),random(50,100),50);
 
  ellipse(i, height/2, 120, 120);
  ellipse(i, height/2, 80, 80);
  i = i + 40;
  counter +=maus;
}
}
