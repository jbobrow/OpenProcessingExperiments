
void setup(){

size(400,400);
colorMode(RGB);
background(50);
noStroke();
}

void draw(){
  for(int x=20; x<width; x+=30) {
    for(int y=25; y<height; y+=55){
moons(x,y);
}
}
noLoop();
}

void moons(float x, float y){
  pushMatrix();
  translate(0,0);
  fill(0,random(100,200),random(75,150));
  arc(x, y, 30, random(40),PI/2,TWO_PI-PI/2);
arc(x,y+20, random(10,30),40, TWO_PI-PI/2,TWO_PI+PI/2);
popMatrix();
}

