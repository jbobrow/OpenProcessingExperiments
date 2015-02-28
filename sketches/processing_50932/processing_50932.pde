
Ball[] balls= new Ball[30];
int y = 450;

void setup(){
  size(900,450);
  smooth();
  
  for(int i=0 ; i<balls.length; i++){
    balls[i]=new Ball(color(i*10),845,i*2,i/20.0);
  }
}

void draw(){
  background(255);
  translate(10,-50);
  for(int i=0 ; i<balls.length; i++){
    balls[i].move();
    balls[i].display();
  }
  
  for(int x=0 ; x<width ; x+=45){
  fill(0);
  beginShape();
  vertex(x,y);
  vertex(x+25,y);
  vertex(x+25,(y-50)-x/3); 
  vertex(x,(y-40)-x/3);
  endShape(CLOSE);
  fill(0); 
  }
}

class Ball{
  color c;
  float xpos;
  float ypos;
  float yspeed;
  
  Ball(color c_, float xpos_,float ypos_,float yspeed_){
    c=c_;
    xpos=xpos_;
    ypos=ypos_;
    yspeed=yspeed_;
  }
  
  void display(){
    
    stroke(0);
    fill(c);
    ellipse(xpos,ypos,15,15);
  }
  
  void move(){
    ypos=ypos+yspeed;
    if (ypos>height){
      ypos=450;
    }
  }
}
  

