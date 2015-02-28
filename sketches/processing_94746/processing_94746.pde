
float r=20;
float xp;
float yp;
float xs=20;
float ys=20;

void setup(){
  size(800,600);
  background(255);
  xp=width/2;
  yp=height/2;
}
void draw(){
  fill(255,20);
  rect(0,0,width,height);
  xp+=xs;
  yp+=ys;
  noStroke();
  fill(150,0,255);
  ellipse(xp,yp,r,r);
//  ellipse(xp,yp+random(50),r,r);
//  ellipse(xp+random(50),yp+random(50),r,r);
//  ellipse(xp+random(80),yp+random(80),r,r);
  if(xp>width || xp<0){
   xs*=-1 ;
  }
  if(yp>height || yp<0){
     ys*=-1;
  }
}


