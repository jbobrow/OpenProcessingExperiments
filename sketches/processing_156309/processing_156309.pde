
 int a=255;
 int b=255;
 int c=255;
 int d=255;

int ax=150;
int bx=250;
int cx=350;
int dx=450;
int hover;
void setup(){
size(500,500);
}

void draw(){
  drawCircles();
  checkHover();
 a=255;
 b=255;
 c=255;
 d=255;

switch(hover) {
    case 1:
    a = 0;
    case 2:
    b = 0;
    case 3:
    c = 0;
    case 4:
    d = 0;
}
}

void drawCircles(){
    fill(a);
  ellipse(150,250,50,50);
    fill(b);
  ellipse(250,250,50,50);
    fill(c);
  ellipse(350,250,50,50);
    fill(d);
  ellipse(450,250,50,50);
}

void checkHover(){
    if(dist(mouseX,0,ax,0)<25){
hover =1;
}
  checkHover();
  if(dist(mouseX,0,bx,0)<25){
hover =2;
}
  checkHover();
  if(dist(mouseX,0,cx,0)<25){
hover =3;
}
  checkHover();
  if(dist(mouseX,0,dx,0)<25){
hover =4;
  }
}



