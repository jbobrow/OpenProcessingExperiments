
int posX;
int posY;
float x = 0;
float y = 0;
float dx = 0;
float dy = 0;
color[] colors = { #08FAD7, #02E064, #B2FF00, #FAFF03, #FF8E03, #FF0303, #FF039A, #AA03FF, #3C03FF, #030CFF,#037EFF, #03ECFF,#1C1F21,#000305,#CCCDCE};

void setup(){
  size(600,600);
  fill(0);
  noStroke();
  dx = random(width);
  dy = random(height);
}

void draw(){
  background(255);
  ellipse(x,y, 30,30);
  
  x = lerp(x, dx, 0.1);
  y = lerp(y, dy, 0.1);
  
  float ball = dist(x,y,dx,dy);
  if(ball<1){
    dx = random(width);
    dy = random(height);
  }
}

void mousePressed(){
  if( dist(mouseX, mouseY, x, y) < dx/2) {
  color c;
  c = colors[floor(random(0, colors.length))];
  fill(c);
  }
}
