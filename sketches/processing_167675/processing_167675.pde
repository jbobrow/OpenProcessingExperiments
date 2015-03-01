


void setup() {
  size(400,400);
  noStroke();
}

void draw() {
  float w = mouseY;
  float x = mouseX;
  float c = get(mouseX,mouseY);
  float r = red(get(mouseX,mouseY));
  float g = green(get(mouseX,mouseY));
  float b = blue(get(mouseX,mouseY));
  
  background(mouseY);

  fill(r+x,g+x/2,x-b,100);
  rect(0+x/5,0,200,2600);
  fill(255-x,x/2,pow(r,x),100);
  rect(120,0,200,200-x/4);
  fill(b+x/1.3,g+x,x/r,100);
  rect(200+x/2,200,200,200);
  fill(b,r*x,200-x,100);
  rect(0,300,200-x/3,200);
  fill(255,180);
  rect(30+x/2.5,0,(x*1.5+w)*10,pow(b,x)*100);
  fill(0,180);
  rect(0+x/7,280,(x*1.5+w)*10,pow(b,x)*100);
}


