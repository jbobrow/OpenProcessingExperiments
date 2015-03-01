

int x=0;
void setup() {
  size(700,500);
  smooth();
  

}

void draw(){
  background(255);
  float a = random(50,200);
  float b = random(10,30);
  frameRate(5);
  noStroke();
  fill(#dd7ca3);
  ellipse(x,250,a+b,a+b);
  fill(255);
  ellipse(x,250,a,a);
    x+=10;
  fill(#57b6a2);
  ellipse(700-x,250,a+b,a+b);
  fill(255);
  ellipse(700-x,250,a,a);
    x+=10;


}



