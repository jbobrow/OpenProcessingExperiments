
/*
Fear and anxiety is a reaction to perceived threat. Our bodies have uncontrollable reactions, often with us having the urge to flight or flight.
'Anxiety' represents this reaction with a set of functions responding to way the mouse interacts with the objects.
When the mouse comes close to the objects, they can sense its presence and will start to panic. 
When the mouse runs over the object they react with a ‘fight’ response and use their changing colours to scare off danger.
When the mouse moves away they return to floating around the screen.


*/


TubeWorm[] worm=new TubeWorm[20]; //declaire and create array
PImage img;
PImage img2[] = new PImage[26]; //declaire and create array

// DECLAIRING SCALE VARIABLES      (Norman, 2009)
float max_acc = .05;
float max_vel = .4;
float z_limit = 6;
int max_size = 100;
int min_size = 30;
int max_blobs = 3;
float max_scale = .4;

int imageRandom = 0;



void setup() {
  size(500, 700);
  img = loadImage("hide.png");          //IMAGE FOR FLOATING FUNCTION
  img2[0] = loadImage("worm1.png");     //ARRAY OF IMAGES FOR HIDE FUNCTION
  img2[1] = loadImage("worm1.png");     //ASSIGNING THE VALUES
  img2[2] = loadImage("worm2.png");
  img2[3] = loadImage("worm2.png");
  img2[4] = loadImage("worm3.png");
  img2[5] = loadImage("worm3.png");
  img2[6] = loadImage("worm4.png");
  img2[7] = loadImage("worm4.png");
  img2[8] = loadImage("worm5.png");
  img2[9] = loadImage("worm5.png");
  img2[10] = loadImage("worm6.png");
  img2[11] = loadImage("worm6.png");
  img2[12] = loadImage("worm7.png");
  img2[13] = loadImage("worm7.png");
  img2[14] = loadImage("worm8.png");
  img2[15] = loadImage("worm8.png");
  img2[16] = loadImage("worm9.png");
  img2[17] = loadImage("worm9.png");
  img2[18] = loadImage("worm10.png");
  img2[19] = loadImage("worm10.png");
  img2[20] = loadImage("worm11.png");
  img2[21] = loadImage("worm11.png");
  img2[22] = loadImage("worm12.png");
  img2[23] = loadImage("worm12.png");
  img2[24] = loadImage("worm13.png");
  img2[25] = loadImage("worm13.png");
  imageMode(CENTER);
  rectMode(CENTER);
  smooth();

  //INITIALIZING VARIABLES FOR WORMS SO EACH FUNCTION RUNS
  for (int i = 0; i < worm.length; i++) {
    float x = random(width);
    float y = random(height);


    //SCALE VARIABLE
    float z = random(0, 25);  
    int r = i + 2;
    worm[i] = new TubeWorm(x, y, r, z);
  }
}


//FUNCTIONS
void draw() {
  smooth();
  background(252, 218, 185);   //sets peach background
  for (int i = 0; i < worm.length; i++) { //INITIALIZING 
    worm[i].change_momentum();
    worm[i].move();
    worm[i].shake();
    worm[i].hide();
  }
}

//CLASS THAT HOLDS ALL THE FUNCTIONS DEFINED IN VOID DRAW
class TubeWorm {
  int diameter;
  float x, y, z;
  float dx, dy, dz;
  float speed =2.5; //controls speed of shake 

 
  TubeWorm(float tempX, float tempY, int tempDiameter, float tempZ) {     // declaring temporary variables so the worms can move freely
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    z = tempZ;


    //SCALE VALUES (Norman, 2009)
    dx = random(-max_vel, max_vel);   
    dy = random(-max_vel, max_vel);
    dz = random(-max_vel, max_vel);
  }

  //SHAKE FUNCTION WHEN MOUSE IS CLOSE TO OBJECT
  void shake() {
    float d = dist(mouseX, mouseY, x, y);     //distance between mouse position and centre of object
    if ((d < diameter*5)&&(d>diameter)) {     // if distance is close to, but not less than diameter of object
      x += random(-speed, speed);             // shake function by generating random x and y values
      y += random(-speed, speed);
    }
    else {
    }
  }


  //FLOATING  FUNCTION (Norman, 2009) allows for the objects to move around the screen, keeping within the parameters of the set window
  void move() {       
    x += dx;
    y += dy;
    z += dz;

    if (x > width) {
      x = width; 
      dx = 0;
    }
    if (x < 0) {
      x = 0; 
      dx = 0;
    }
    if (y > height) {
      y = height; 
      dy = 0;
    }
    if (y < 0) {
      y = 0; 
      dy = 0;
    }
    if (z > max_size) {
      z = max_size; 
      dz = 0;
    }
    if (z < min_size) {
      z = min_size; 
      dz = 0;
    }
  } 

  //FLOATING FUNCTION  (Norman, 2009) allows for the objects to change in size, creating almost a pulsing effect
   void change_momentum() {             
    dx += random(-max_acc, max_acc);
    dy += random(-max_acc, max_acc);
    dz += random(-max_acc, max_acc);

    if (dx >  max_vel) dx =  max_vel;
    if (dx < -max_vel) dx = -max_vel;
    if (dy >  max_vel) dy =  max_vel;
    if (dy < -max_vel) dy = -max_vel;
    if (dz >  max_vel) dz =  max_vel;
    if (dz < -max_vel) dz = -max_vel;
  } 

  //CHANGE OBJECT SHAPE WHEN MOUSE RUNS OVER DIAMETER
  void hide() {
    float d = dist(mouseX, mouseY, x, y);                           //When distance is less than diameter - diameter is equal to width and height of 
    if (d < diameter) {     
      image(img2[imageRandom], x, y, diameter+z, diameter+z);      //RUNS THROUGH ARRAY IF MOUSE RUNS OVER DIAMETER           
      imageRandom++;
      if (imageRandom >= img2.length) { //array for two toned tubeworm
        imageRandom=0;
      }
    }
    else {
      image(img, x, y, diameter/3+z, diameter/3+z); //returns to normal floating function if mouse is not in diameter


      diameter = constrain(diameter, 30, 120); // constrains the size 
    }
  }
}


//REFERENCES
//Norman, J. (2009, January 17). Floating Blobs. Retrieved April 10, 2012, from Open Processing: http://www.openprocessing.org/sketch/814
//Fry, C. R. (2010). Getting Started With Processing. Sebastopol, CA: O'Reilly Media, Inc.


