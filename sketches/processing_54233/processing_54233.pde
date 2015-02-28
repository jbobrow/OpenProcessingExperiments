
Dots dot1;
void setup(){
  background(0);
  size(1300,700);
  smooth();
  dot1=new Dots(600);
}
void draw(){
  fill(0,40);
  rect(0,0,width,height);

  dot1.display();
  dot1.move();
}

class Dots{
  float ang;
  float r;
  float x;
  float y;
  
  Dots (float newR){
    r=newR;
  }
  void move(){
    ang+=.05;
    x=cos(ang)*r+width/2;
    y=height/2;
  }
  void display(){
    noStroke();
    fill(255);
    rect(x,y,10,10);
  }
}

