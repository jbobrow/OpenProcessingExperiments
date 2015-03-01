
Circle[] circle = new Circle[200];
int Data = 200;

void setup(){
  size(400,400);
  for(int i = 0;i<Data;i++){
    float x = 200;  //x is center
    float y = 200;  //y is center
    float xspeed = random(-1,1); //speed x is 0 to 10
    float yspeed = random(-1,1); //speed y is 0 to 10
    circle[i] = new Circle(x,y,xspeed,yspeed);
  }
}

void draw(){
  background(0);
  for(int i = 0; i<Data;i++){
    circle[i].move();
    circle[i].display();
    //saveFrame("output/sequence_####.jpg"); 
  }
}

class Circle{
  
  float x,y;  //x and y-coordinate
  float xspeed,yspeed;  //x and y speed
  
  Circle(float tmpx, float tmpy, float tmpxspeed,float tmpyspeed){
    x = tmpx;  //initial position x
    y = tmpy;  //initial position y
    xspeed = tmpxspeed;  //x speed(0-10)
    yspeed = tmpyspeed;  //y speed(0-10)
  }
  
  void move(){
    if(x<0.0f || x>width)  xspeed *= -1.0f;  //reverse a direction
    if(y<0.0f || y>height) yspeed *= -1.0f;  //reverse a direction
    
    x += xspeed;  //x shift
    y += yspeed;  //y shift
  }
  
  void display(){
    noStroke();
    ellipse(x,y,10,10);  //write circle at (x,y)
  }
}
