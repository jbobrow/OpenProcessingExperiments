
// movement inspired by Heidi Frank and Oscar Torres, "bouncing bunnies"
//photo of Siobhan Mukerji riding Leagh at Flowerhill Equestrian Center 

horse[] horses = new horse[10];   
float grav=0.3;
PImage bImgFor;
PImage bImgRev;
PImage bGrass;
PImage bBugler;

void setup() {
  size(1000,300);
  bImgFor = loadImage("Carausel.png");   
  bImgRev = loadImage("Carausel2.png");   
  bGrass = loadImage ("surreal.jpg");
  bBugler = loadImage ("Bugler.png");

  for(int i=0; i < horses.length; i++) {   
    horses[i] = new horse();   
  }

  //Why isn't this working??
  
  if (mousePressed){
  if(mouseButton==LEFT){
  image(bBugler,random(mouseX+5,mouseX-5),random(mouseY+5,mouseY-5));
     } 
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
      x = random(300,600);
    y = random(0,100);
    w = random(60,100);
    xSpeed = 4;
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
  {
 
  
}
}
 }


