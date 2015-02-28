
void setup(){
  size(500,500);
  background(0,0,0);
  noStroke();
  smooth();
}

void draw(){
for(int x=100;x<=width-100;x=x+100){
  for(int y=100;y<=height-100;y=y+100){
    fill(255,0,0);
    ellipse(x,y,80,80);
    fill(255,255,255);
    ellipse(x,y,70,70);
    fill(255,0,0);
    ellipse(x,y,60,60);
    fill(255,255,255);
    ellipse(x,y,50,50);
    fill(255,0,0);
    ellipse(x,y,40,40);
    fill(255,255,255);
    ellipse(x,y,30,30);
    fill(255,0,0);
    ellipse(x,y,20,20);
    fill(255,255,255);
    ellipse(x,y,10,10);
  }
}
}

