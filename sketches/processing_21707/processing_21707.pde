

horse[] horses = new horse[1];   
float grav=0.282;
PImage bImgFor;
PImage bImgRev;
PImage bGrass;
PImage fGrass;
 
void setup() {
  size(900,500);
  bImgFor = loadImage("lefttoright.png");   
  bImgRev = loadImage("righttoleft.png");   
  bGrass = loadImage("pretty field.jpg");   

  for(int i=0; i < horses.length; i++) {   
    horses[i] = new horse();   
  }
}
 
void draw() {
  image(bGrass,0,0,width,height);   
  for(int i=0; i < horses.length; i++) {   
    horses[i].display();
    horses[i].move();
  }

}
 
class horse {
  float x;
  float y;
  float w;
  float xSpeed;
  float ySpeed;
  PImage b;
   
  horse() {   
    x = int(200);
    y = int(0);
    w = int(400);
    xSpeed = 10;
    ySpeed = 0;
    b = bImgFor;
  }
   
  void display() {  
    if(x > 800) {
      b = bImgRev;
    }
      if(x < -300) {
      b = bImgFor;
    }
    image(b,x,y,w,w);
  }
   
  void move() {   
    x = x + xSpeed;   
    y = y + ySpeed;   
    ySpeed = ySpeed+grav;   
    if(y > 150) {   
      ySpeed = ySpeed * -0.95;
    }
    if(x > width-100) {
      xSpeed = xSpeed * -1;
    }
        if(x < -350) {
      xSpeed = xSpeed * -1;
    }
  }
}



