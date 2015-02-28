
Pinwheel[] pinwheels = new Pinwheel[80];
PImage[] pictures;
Pinwheel q;

void setup() {
  size(1000, 900);
  pictures = new PImage[4];
  pictures[0] = loadImage("bluepinwheel.png");
  pictures[1] = loadImage("orangepinwheel.png");
  pictures[2] = loadImage("redpinwheel.png");
  pictures[3] = loadImage("yellowpinwheel.png");
  for (int i = 0; i < 10; i++) {
    for(int j = 0; j < 8; j++) {
      float x = (j*5+60)*i+(8-j)*17+50;  
      float y = (j*3+60)*j+240;
      pinwheels[8*i+j] = new Pinwheel(x, y, pictures[int(random(0,4))]);
    }
  }
}

void draw() {
  background(34, 137, 42);
  noStroke();
  fill(125, 234, 232);
  rect(0, 0, width, 175);
  for(int i = 0; i < 80; i++) {
    pinwheels[i].display();
    pinwheels[i].update();
  }
  
}

class Pinwheel {
  
  float xPos; 
  float yPos;
  float vel;
  float acc;
  PImage pinHead;
  
  Pinwheel(float xIn, float yIn, PImage choose) {
    xPos = xIn;
    yPos = yIn;
    pinHead = choose;
    vel = 0;
    acc = 0;
  }
   void update() {
     int frames = 0;
     float howClose;
     if(dist(mouseX, mouseY, xPos, yPos) < 150 && acc < .3) {
       acc += .01;
     } else if(acc > 0) {
       acc *= .9;
     }
     vel += acc;
     frames++;
   }
   
   void display() {
     stroke(126,88,29);
     strokeWeight(2);
     line(xPos, yPos, xPos, yPos+yPos/height*25+25);
     pushMatrix();
       translate(xPos, yPos);
       rotate(vel);
       imageMode(CENTER);
       image(pinHead, 0, 0, yPos/height*20+25, yPos/height*20+25);
       
     popMatrix();
   }
  
  /* I am trying to have the pointer be the wind and the sun, so the speed of the rotation goes up when the mouse is near, and the shadows move away from the mouse */
}


