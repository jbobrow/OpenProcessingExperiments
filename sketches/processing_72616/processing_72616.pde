
int numFrames = 3;  //The Number of frames in the animation
int frame = 0;
PImage[] images = new PImage[numFrames];

void setup() 
{
  
  size(800, 600);
  frameRate(1000);

  
  images[0] = loadImage("Bob1.png");
  images[1] = loadImage("Bob2.png");
  images[2] = loadImage("Bob3.png");


for (int i = 0; i < Burger.length; i++ ) {
    Burger[i] = new Burger(random(width), random(height), random(1, 3));
  }
}

Burger[] Burger = new Burger[20];

void draw() {
  PImage img;
  img = loadImage("burger.JPG");
  background(img);
  frame = (frame +3);
  if (frame>=numFrames){
    frame=3;

  //frame= (frame+1) % numFrames; // use % to cycle through frames
image(images[frameCount % numFrames],420,300);
}

  if (mousePressed == false)
    for (int i = 0; i < Burger.length; i++ ) { 
      Burger[i].swimfast();
      Burger[i].killerfish();
      Burger[i].display();
    } 
  else {      
    for (int i = 0; i < Burger.length; i++ ) { 
      Burger[i].swim();
      Burger[i].display();
    }
  }
}


class Burger {   

  float xpos;
  float ypos;
  float xspeed; 

  Burger(float tempx, float tempy, float tempspeed) {
    
    println("a Burger has been created");


    xpos = tempx;  
    ypos = tempy;
    xspeed = tempspeed;
  }

  void display() {
    PImage Burger;
    Burger = loadImage("Cheeseburger.png");
    image(Burger, xpos, ypos);
  }

  void swim() {             
    xpos = xpos + xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

  void swimfast() {             
    xpos = xpos + 25*xspeed;
    if (xpos > width) {
      xpos = 0;
    }
  }

  

void killerfish() {
    PImage killerfish;


    imageMode(CENTER);





    if ((xpos < mouseX + 50) && (xpos > mouseX - 50)) {
      if ((ypos < mouseY + 50) && (ypos > mouseY - 50)) {
        xpos+=70;
        ypos+=70;

        if ((xpos > 300) & (ypos > 300)) {
          xpos=random(0, 200);
          ypos = random(0, 200);
        }
      }
    }
  }
}


