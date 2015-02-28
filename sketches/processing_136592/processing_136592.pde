
void setup() {
size(600,600);
background(0,168,255);
colorMode(HSB);
}
void draw(){
for (int a=0; a<60; a++){
  for(int b=0; b<60; b++){
    float d=dist (a*10,b*10,mouseX,mouseY);
    fill(random(109), mouseY,random(200));
    ellipse(mouseX, b*10, random(d*0.5),random(40));
  }
}
}

