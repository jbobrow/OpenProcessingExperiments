
float x,y,x1,y1,hownear,k,e=2.71,rad;
color c;
int u = 10;
void setup() {
  size(800,800);
  smooth();
  noStroke();
  x=random(width);
  y=random(height);
  rad=5;
  hownear = 0.0001;
  colorMode(HSB,100);
  noStroke();
  c = color(100,100,100);
}
void draw() {
  fill(0,u);
  rect(0,0,width,height);
  fill(c);
  ellipse(x,y,rad,rad);
  x1 = mouseX;
  y1 = mouseY;
  k = - log(hownear)/(x-x1);
  for(int i = 0; i <= abs(x-x1); i++) {
    float ynow = y + (y1-y)*pow(e, -k*(i*(x-x1)/abs(x-x1)));
    ellipse(x1+i*(x-x1)/abs(x-x1),ynow,rad,rad);
  }
  if(mousePressed) {
    if(mouseButton==LEFT) {
      x=mouseX;
      y=mouseY;
    }
  }
  if(keyPressed){
  if(key==CODED){
    if(keyCode==LEFT){
      u = constrain(u-1,0,100);
    }else if(keyCode==RIGHT){
      u = constrain(u+1,0,100);
    }else if(keyCode==UP){
      rad++;
    }else if(keyCode==DOWN){
      rad = abs(rad - 1);
    }
  }
}
}
void mousePressed() {
  if(mouseButton==RIGHT) {
    c= color(random(100),random(100),100);
    fill(c);
  }
}

