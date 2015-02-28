
int x= 200;
int y= 200;
int r= 100;

void setup() {
  size(400,400);
  smooth();
  noStroke();
}

void draw() {
  if(mouseX > x){
    x=x+1;
  }else{x=x-1;}
   if(mouseY > y){
    y=y+1;
  }else{y=y-1;}
  fill(255,255,255,25);
  rect(0,0,width,height);
  fill(255,0,0);
  ellipse(x+30+random(10), y+30+random(10), 10, 10);
  fill(0,255,0);
  ellipse(x-30+random(10), y-30+random(10), 10, 10);
   fill(0,0,255);
  ellipse(x+30+random(10), y-30+random(10), 10, 10);
  if( (mouseX-x)<10 && (mouseX-x)>-10 && (mouseY-y)<10 && (mouseY-y)>-10){
  r=int(random(150));
  fill(255,255,0,40);
  ellipse(mouseX,mouseY,r,r);
  }
  
}
