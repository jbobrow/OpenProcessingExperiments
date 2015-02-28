
// Tank Sketch using Object Oriented Programming
// Whim of ImagineN4tion

int i = 0;
Tank tank1;
Bullet bullet1;
int mpress = 0;


void setup(){
  size(600,600);
  fill(100,0,0);
}

void draw(){
  // Initialize tank1 object
  tank1 = new Tank(color(0,255,0), mouseX);
  background(75);
  tank1.display();
  if (mpress != 0) {
    bullet1.trajectory();
    bullet1.display();
  }
}

void mousePressed (){
  bullet1 = new Bullet(mouseX, 475);
//    bullet(i).trajectory();
//    bullet(i).display();
    mpress = mpress + 1;
}

//Create Bullet Class
class Bullet{
  float xpos;
  float ypos;
  
  Bullet(float tempXpos, float tempYpos){
    xpos = tempXpos;
    ypos = tempYpos;
  }
  
  void trajectory(){
    ypos = ypos - 1;
    if (ypos <= 5){
      ypos = 5;
      mpress = 0;
    }
  }
  
  void display(){
    ellipse(xpos,ypos,5,5);
  }
}

   

//Create Tank Class
class Tank{
  color c;
  float pos;
  
  Tank(color tempC, float tempPos){
    c = tempC;
    pos = tempPos;
  }
  
  void display(){
    rectMode(CENTER);
    rect(pos,500,20,30);
    rect(pos,480,5,10);
    rect(pos-13,500,6,20);
    rect(pos+13,500,6,20);
    ellipse(pos,500,10,10);
  }
}


