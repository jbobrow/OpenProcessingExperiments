
void setup(){
  size(1000,300);
  background(225);
}
float t=0;
int x=0;

void draw() {
float nt= noise(t);
strokeWeight(random(10,30));
//stroke(random(150,200),50,random(100,150),80);
stroke(x%width,50,nt*height,80);
point(x % width,nt*height);
//t=t+1;
//t=t+0.05;
t=t+0.002;
x++;
}
