
class Heart{
  float x;
  float y;
  
  float diam;
  color c;
  float yspeed;
  
  
  Heart( float tx, float ty,float tdiam, color tc,float tyspeed)
  {
    x=tx;
    y=ty;
    diam=tdiam;
    c=tc;
    yspeed=tyspeed;
  }
  void setup(){
  size(500,500);
  }
  
  void draw(){
    background(255);
    display();
    move();
  }
  void display(){
    stroke(c);
    fill(c);
    triangle(x,y,x+20,y,x+10,y+20);
    ellipse(x+5,y,diam,diam);
    ellipse(x+15,y,diam,diam);
  }
  void move(){
    y=y+yspeed;
    if(y<0){
      y=500;
    }
  }
}
Heart[] myheart= new Heart[100];

int n=0;

void setup(){
  size(500,500);
 for(int n=0; n<100;n++){
 myheart[n]=new Heart(random(0,500),random(0,500),10,color(255,0,0),
 random(-3,-1));
}
}
void draw(){
background(0);
textSize(50);

fill(252,15,186);
text("I Love You",0,250);
text("Setareh",0,400);

for(int n=0; n<myheart.length; n++){
  myheart[n].display();
  myheart[n].move();
  
}
}



