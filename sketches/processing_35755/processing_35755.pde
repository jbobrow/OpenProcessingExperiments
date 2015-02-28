
void setup(){
  size(400,400);
  colorMode(HSB,100);
}

int x = 20;

void draw() {
  background(50,50,200);//draw sky
  fill(mouseX*2,90,mouseY/2);
  rectMode(CENTER);
  triangle(0,height,0,0,mouseX-10,height/2);
  triangle(width,height,mouseX+10,height/2,width,0);
  noStroke();
  rect(mouseX,width/2,60,20);
}

