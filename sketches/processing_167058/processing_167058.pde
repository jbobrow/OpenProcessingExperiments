
//credit Mischa Abakumova "cell_multiplication" for original code. Changed it a bit. 

ArrayList<Sonic> sonics;



void setup() {
size(800,800);

  background(0);

  sonics = new ArrayList<Sonic>();  // Create an empty ArrayList
  sonics.add(new Sonic(width/2, height/2, 100));  // Start by adding one element
}
 
void draw() {
  background(80);
  int value = 0;

 
  for (int i = sonics.size ()-1; i >= 0; i--) {
   Sonic sonic = sonics.get(i);
    sonic.move();
    sonic.shapes();
    }
}
 
class Sonic {
  float radius;  //declare variable for radius
  float posx, posy;  //declare variables for x and y position
  float sonicXSpeed =  random(0,20);
  float sonicYSpeed =  random(0,20);
   
 
  Sonic(float x, float y, float s) {
    posx = x;  //set  x position
    posy = y; // set y position
    radius = s; // set  radius
  
  }
 
 
  //behavior for sonic
  void move() {
     //Bounce off sides of the screen
    if (posx > width - radius/2) {
      sonicXSpeed = sonicXSpeed * -2;
    }
    if (posx < 0 + radius/2) {
      sonicXSpeed = sonicXSpeed *-2;
     
    }
 
    //Bounce off top and bottom of the screen
    if (posy > height - radius/2) {
     sonicYSpeed = sonicYSpeed *-2; //bouncing the ball in the opposite direction
    }
    if (posy < 0 + radius/2) {
      sonicYSpeed = sonicYSpeed *-2;
    }
  }
 
 void shapes() {
    PImage sonics = loadImage("sonic.png");
sonics.resize(100,150);
image(sonics, posx, posy, 100, 150);
    posx = posx + sonicXSpeed;
    posy = posy + sonicYSpeed;
  }
}

void mouseReleased() {
  // Adds a new object when the mouse is pressed
 
 
    for (int i = sonics.size ()-1; i >= 0; i--) {
 
    if (dist(mouseX, mouseY, sonics.get(i).posx, sonics.get(i).posy) >= sonics.get(i).radius/2) {
      sonics.add(new Sonic(mouseX, mouseY, sonics.get(i).radius/2));
    }
  }
}

 


 



