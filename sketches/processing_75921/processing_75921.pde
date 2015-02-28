

Flip[] myflip = new Flip[20];

void setup(){
  size(800,200);
  for(int i=0;i<myflip.length;i=i+1){
    myflip[i]=new Flip(random(10),random(height),random(30),0,random(20));
  }
}

void draw(){
  background(0);
  for(int i=0; i<myflip.length;i=i+1){
  myflip[i].move();
  myflip[i].bounce();
  myflip[i].display();
  }
}

class Flip {
  float x;
  float y;
  float x_speed;
  float y_speed;
  float allsize;
  Flip(float xpos, float ypos, float xx_speed, float yy_speed, float S){
  x=xpos;
  y=ypos;
  x_speed = xx_speed;
  y_speed = yy_speed;
  allsize=S;
}

void move(){
  x=x+x_speed;
  y=y+y_speed;
}

void bounce(){
if (x>width||x<0||y>height||y<0) {
      x_speed = x_speed * -1;
      y_speed = y_speed * -1;
}
}

void display(){
noFill();
stroke(mouseX/2-50,mouseY);
ellipse(x,y,allsize,allsize);
ellipse(x,y,allsize+10,allsize+10);
line(x,y,allsize-100,allsize+200);
fill(255);
ellipse(x,y,allsize/2,allsize/2);

}
}



