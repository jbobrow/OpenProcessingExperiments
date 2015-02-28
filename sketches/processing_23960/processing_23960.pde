
// movement inspired by Heidi Frank and Oscar Torres, "bouncing bunnies"
//photo of Siobhan Mukerji riding Leagh at Flowerhill Equestrian Center 

horse[] horses = new horse[50];   
float grav=0.282;
PImage bImgFor;
PImage bImgRev;
PImage bGrass;

void setup() {
  size(900,200);
  bImgFor = loadImage("lefttoright.png");   
  bImgRev = loadImage("righttoleft.png");   
  bGrass = loadImage ("race track.jpg");

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
      x = random(200,600);
    y = random(0,height/2);
    w = random(50,100);
    xSpeed = 5;
    ySpeed = 0;
    b = bImgFor;
  }
   
  void display() {  
    if(x > 1000) {
      b = bImgRev;
    }
      if(x < -350) {
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
    if(x > width+300) {
      xSpeed = xSpeed * -1;
    }
        if(x < -350) {
      xSpeed = xSpeed * -1;
    }
  }
}



