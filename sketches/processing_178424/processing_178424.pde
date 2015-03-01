
Mover[] movers = new Mover[100]; //array of the pVectors
color strokeColor ; //color off the objects
PImage img; // fly
PImage img2;// ruby
PImage img3;// flower
int angle = 0;// angle of inner cirkles in the drawn flowers


void setup() 

{
  size(800,600);
  smooth();
  colorMode(HSB, width, height,100); 
  background(100,0,99);
img=loadImage("fly.png");
img2=loadImage("rubin.png");
img3=loadImage("flower.png");
 
  // Initializing all the elements of the array
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(); 
  }

 }

void draw() {
  

  // Calling functions of all of the objects in the array.
  for (int i = 0; i < movers.length; i++) {
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display(); 
  }

if(mousePressed){
// dwawing of flowers
 angle += 5;
    float val = cos(radians(angle)) * 22.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(mouseX,height,100);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    stroke(strokeColor);

    ellipse(mouseX, mouseY, 2, 2);
  }

}



class Mover {
  //array of lines 

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(-300,0);
    topspeed = 2;
  }

  void update() {

    // Our algorithm for calculating acceleration:
    PVector mouse = new PVector(mouseX,mouseY);
      PVector dir = PVector.add(mouse,location);  // Find vector pointing towards mouse
   //dir.normalize();     // Normalize
  dir.mult(0.5);       // Scale 
    acceleration = dir;  // Set to acceleration

    //Motion 101!  Velocity changes by acceleration.  Location changes by velocity.
   velocity.add(acceleration);
   velocity.limit(topspeed);
   location.add(velocity);
  
    
  }

  void display() {
    noStroke();
     fill(location.x,mouseY,100);
     ellipse(location.x,location.y,1,1);
     if (keyPressed) {  // key oprtions
      if (key == 'b' || key == 'B') {
      image(img, location.x, location.y,img.width/2, img.height/2) ;
     }
      if (key == 'n' || key == 'N') {
      image(img2, location.y, location.x,20,15) ;
    }
      if (key == 'm' || key == 'M') {
       image(img3, location.y, location.x,img.width/3, img.height/3) ;
    }
    
   }
  }
void checkEdges() {
 
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    }  else if (location.y < 0) {
      location.y = height;
    }
}
}
void keyReleased(){ // clear screen
if (key == BACKSPACE) background(360);
if (key == DELETE )background(101,0,100);
}





