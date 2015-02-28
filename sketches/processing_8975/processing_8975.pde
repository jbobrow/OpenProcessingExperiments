
Ball[]b=new Ball[200];

void setup(){
  size(400,400);
  smooth();
  frameRate(40);
  for (int i = 0; i<b.length;i++){
    b[i]= new Ball(random(width),random(height),random(30),random(-7,7), color(random(255),random(255),random(255)));
  }
}

void draw(){
  fill(255,70);
  noStroke();
  rectMode(CORNER);
  rect(0,0,width,height);
  for (int i = 0;i<b.length;i++){
    b[i].show();
    b[i].move();
  }
}
class Ball{
  float x,y,dia,spd;
  color c;

  Ball(float x_,float y_,float dia_,float spd_, color c_){
    x=x_;
    y=y_;
    dia=dia_;
    spd=spd_;
    c=c_;
  }

  void show(){
    noStroke();
    fill(c);
    ellipseMode(CENTER);
    ellipse(x,y,dia,dia);
    noFill();
    stroke(c);
    ellipse(x+random(-10,10),y+random(-10,10),dia,dia);
  }

  void move(){
    x+=spd;
    y+=3*cos(x);

    if (x>width){
      x=0;

    }
    if (x<0){
      x=width;
    }    
  }
}








