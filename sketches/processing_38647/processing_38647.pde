
int x;
int y;
int radius = 15;
int offset = 10;

void setup(){
  size(300,300);
  smooth();
  ellipseMode(RADIUS);
  x = height/4;
}

void draw() {
  background(204);
  float d = dist(mouseX,mouseY,x,y);
  if (d > radius) {
    radius++;
    fill(0,4,4);
  }
  else {
    fill(0,8,90);
  }
  if (mousePressed) {
    if(mouseButton == LEFT){
      fill(23,40,60);
    }else {
      fill(233,0,90);
    }    
  }
  ellipse(x,y,radius,radius);
  
  if (mouseX > x) {
    x += 0.5;
    offset = -10;
  }
  if (mouseX < x) {
    x -= 0.5;
    offset = 10;
  }
  if (mouseY > y){
    y += 0.5;
    offset = 20;
  }
  if (mouseY < x){
    y-= 0.5;
    offset = 10;
  }  
  fill(244,0,0);
  ellipse(x,50,y,width);
  fill(0,244,0);
  //triangle(50,x,60,y,width,100);
  fill(0,0,233);
  rect(x,0,y,width/2);
  rect(100,100,50,50);
  fill(239,250,0);
  rect(120,80,50,50);
  triangle(50,x,60,y,width,100);
  fill(255,0,60);
  ellipse(180,90,50,50);
  fill(90,50,20);
  ellipse(120,80,30,30);
  line(mouseX,mouseY,mouseX+offset,mouseY-10);
  line(mouseX,mouseY,mouseX+offset,mouseY+10);
  line(mouseX,mouseY,mouseX+offset*3,mouseY);
}               
