
int H;
int S = 35;
int B = 95;
int n = 0;
int f = 0;

void setup(){
  size(600,600);
  colorMode(HSB,360,100,100);
  background(0,0,99);
  smooth();
  noStroke();
}

void draw(){
  H = int(random(0,359));
  fill(H,S,B);
  if(mouseX != pmouseX || mouseY != pmouseY){
    n = abs(mouseX - pmouseX) * abs(mouseY - pmouseY);
    ellipse(mouseX,mouseY,n,n);
  }
  
  if(mouseButton == LEFT){
    background(0,0,99);
  }
  
  fill(0,0,99,15);
  rect(0,0,600,600);
}
