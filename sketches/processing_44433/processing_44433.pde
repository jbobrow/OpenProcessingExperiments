
//Zena Koo
//ICM F11 Midterm
//ITP NYU
//Sheep & Sleep for the Insomniac


Sheep[] sheeps = new Sheep[2];
float grav=0.7;
PImage mySheep; 
PImage farmFence;

import hypermedia.video.*;        //  Imports the OpenCV library
OpenCV opencv;                    //  Creates a new OpenCV Object
 

void setup() {
  size (800, 800);  

  opencv = new OpenCV( this );    //  Initialises the OpenCV object
  opencv.capture( 320, 240 );     //  Opens a video capture stream


  mySheep=loadImage("Bahh_4.png");               // variable to hold the image     
    sheeps=new Sheep[2]; //creates array of sheep objects
  for ( int i=0; i<sheeps.length; i++) {   //loop to create each object
    sheeps[i]=new Sheep();
  }
  smooth();
}

void draw() {
  farmFence=loadImage("2missouriFarmland.png");
  farmFence.resize(800,800);
  background(farmFence);
    //background(#0D2A50); //midnight blue background color
    opencv.read();                  //  Grabs a frame from the camera
  image( opencv.image(), 260, 450 );  //  Displays the image in the OpenCV buffer to the screen

  for (int i=0; i<sheeps.length; i++) {
    sheeps[i].display();
    sheeps[i].move();
  }
}

class Sheep {
  float x;
  float y;
  //float sheepw;
 // float sheeph;
  float xSpeed;
  float ySpeed;
  PImage s;
  
Sheep () {  //constructor initializes variable for each sheep object
  x = constrain(x,0,width);  //random(10, width);
  y = 170;
  //sheepw = random(80, 300);
  //sheeph = random(60, 200);
  xSpeed = 8;
  ySpeed = constrain(ySpeed,-2.1,1.7);
  s = mySheep;
}
void display() {
      image(s,x,y);
  if(x > width-50) {
    image(s,x,y);
  //image(s, x, y, sheepw, sheeph);   //  image(mySheep, xpos, ypos);
}
}
void move() {
  x = x + xSpeed;
  y= y + ySpeed;
  ySpeed = ySpeed + grav; //gravity
  if (y > 160) {   //if the sheep is higher than about a 1/4 of the way up
  ySpeed = ySpeed * -1.108;   //leaping arc
 
  }
 // if (x > width-290) {
 //   xSpeed = xSpeed * 1.5;
//  }
   if (x>width){
     x=0;
   }
}
}


