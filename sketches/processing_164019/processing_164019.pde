
float a = 0;
float elpX;
float elpY;
color[] c1, c2;
int col;
int numBoxes = 350;
int boxesPerSide = int(sqrt(numBoxes));
 
void setup() {
  size(525, 525);
  frameRate(30);
  colorMode(HSB, 360, 100, 100);
  c1 = new color[numBoxes];
  c2 = new color[numBoxes];
  randomColors();
 
}
 
void draw() {
 
  rectMode(CENTER);
  noStroke();
  background(0);
  a += 3;
 float amount = (frameCount%255)/255.0;

 
  float val = abs(cos(radians(a)) * 45.0);
  float val2 = abs(cos(radians(a)) * 45.0);
  for (int i=0; i<numBoxes;i++){
    int x = i/boxesPerSide;
    int y = i%boxesPerSide;
    fill(lerpColor(c1[i], c2[i], amount));
  if  (mousePressed) {
    rect(x*30, y*30, val, val);}
  else {ellipse(x*30, y*30, val, val);}  
  }
  
  if (val<0.01){
    randomColors();
  }
 
  fill(0, 0, 0, 200);
  stroke(150);
  strokeWeight(3);
  if (mousePressed) {
     ellipse(mouseY, mouseX, 10+val*5, 10+val*1);
     ellipse(pmouseX, pmouseY, 10+val*1, 10+val*5);}
  else {ellipse(mouseY, mouseX, 10+val*1, 10+val*5);
     ellipse(pmouseX, pmouseY, 10+val*5, 10+val*1);}
  fill(0, 0, 100);
  if (mousePressed) {
    ellipse(mouseY, mouseX, 25, 25);}
  else {rect(mouseX, mouseY, 25, 25);}
}
 
 
void randomColors() {
  for (int i=0; i<numBoxes; i++){
    c1[i] = color(random(360),100,100);
    c2[i] = color(random(360),100,100);
  }
}
