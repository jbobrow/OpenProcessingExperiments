
float x,y;
float dx,dy;
float easing;

void setup(){
  size(300,300);
  smooth();
  noStroke();
  x=0;
  y=0;
  easing=.01;
}

void draw(){
  background(255);
  dx=mouseX-x; 
  dy=mouseY-y;
  x=x+dx*easing;
  y=y+dy*easing;  
  float mx = constrain(mouseX,50,80);
  float my = constrain(mouseY,60,80);
  float nx = constrain(mouseX,10,30);
  float ny = constrain(mouseY,20,30);
  
  //monster2
  fill(0);
  ellipse(20,30,nx,ny);
  ellipse(20,30,ny,nx);
  fill(0);
  ellipse(nx,ny,20,20);
  fill(255);
  ellipse(nx,ny,15,15);
  fill(0);
  ellipse(nx,ny,5,5);
  
  //monster
  fill(0);
  ellipse(60,70,my,mx);//body
  ellipse(60,70,mx,my);//body
  fill(0);
  ellipse(mx,my,35,35);//eye outline
  ellipse(my,mx,45,45);//eye outline
  fill(255);
  ellipse(mx,my,30,30);//eye
  ellipse(my,mx,40,40);//eye
  fill(0);
  ellipse(mx,my,10,10);//pupil
  ellipse(my,mx,15,15);//pupil
 
  
}

