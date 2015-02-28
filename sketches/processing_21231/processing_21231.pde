
void setup(){
  size(480,720);
  background(255);
  smooth();
}

void draw(){
  rectMode(CENTER);
  noStroke();
  fill(155,200,30);
for(int c=10; c<=width;c+=20){
ellipse(c,30,10,10);
}
for(int c=10; c<=width;c+=20){
ellipse(c,50,10,10);
}
for(int c=10; c<=width;c+=20){
ellipse(c,690,10,10);
}
for(int c=10; c<=width;c+=20){
ellipse(c,670,10,10);
}
rect(width/2,height/2,width,height-250);
fill(255);
for(int e=10; e<=width; e+=30){
rect(e,125,20,20);
}
for(int e=10; e<=width; e+=30){
rect(e,595,20,20);
}
fill(255);

for (int a = 200; a <=530; a +=25) {
rect (width/2, a+5, 10, 10);
  }
  for (int b = 200; b <=530; b +=25) {
rect (width/2-30, b+5, 20, 20);
  }
  for (int b = 200; b <=530; b +=25) {
rect (width/2+30, b+5, 20, 20);
}
rect(100,265,150,150);
rect(380,265,150,150);
rect(100,465,150,150);
rect(380,465,150,150);
fill(155,200,30);
rect(100,265,100,100);
rect(380,265,100,100);
rect(100,465,100,100);
rect(380,465,100,100);
fill(255);
rect(100,265,50,50);
rect(380,265,50,50);
rect(100,465,50,50);
rect(380,465,50,50);
}
