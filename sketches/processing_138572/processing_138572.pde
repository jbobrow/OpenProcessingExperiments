
m

yDali line;
myDali ellipse;
myDali rectangle;


void setup(){
 size(600,300);
 background(0,0,255);
  line(0,100,600,100);
  line(0,200,600,200);
  
  
  line = new myDali(0,45);
  rectangle = new myDali(0,80);
  ellipse = new myDali(0,110);
  
}


void draw(){
  line.move();
  line.display();
  fill(0,random(255),0);
  rectangle.move();
  rectangle.display();
  fill(random(55),random(55),random(55));
  ellipse.move();
  ellipse.display();
  fill(random(255),random(255),random(255));
  
}

class myDali{
  float x, y;
  
  
  myDali(float _x, float _y) {
    x=_x;
    y=_y;
  }
  
  
  
  
  void display(){
    line(x,y,100,30);
    rect(x,y,50,50);
    ellipse(x,y,50,50);
  }
  
}


void move(){
  x= x+1;
  
}
