
//Project 2
//Antfarm
//Candice Clark and Ben Samelak

//This sketch simulates ants in an ant farm as they burrow through the soil 

PImage myPic;
int num=15;                      //changes the number of ants
ants [] ants = new ants[num];

void setup() {
  smooth();
  size(500, 400);
  myPic=loadImage("sand.jpeg");
  myPic.loadPixels();
  background (myPic);


  for (int i=0; i<num; i++) {    //starts the ants at the top of the sketch, on the surface
    float x = (random(0, 500));   //of the soil.
    float y = 0;
    ants[i] = new ants(x, y);
  }
}


void draw() {
  for (int i=0; i<num; i++) {     //draws the ants
    ants[i].update();
    ants[i].display();
  }
}

//setting up the ant class
class ants {
  float x;
  float y;

  //makes the ants move one pixel and draw a black dot every pixel to make the tunnel
  float xs=1;
  float ys=1;

  //rounds x and y to nearest int
  ants(float x_, float y_) {
    x=x_;
    y=y_;
  }

  //makes the ant tunnels visible, rather than just the ants
  void update() {
    x+=xs;
    y+=ys;

    x=x++;
    y=y++;

    if (myPic.get(int(x), int(y)) !=color(255)) {
      if (random(10)>5) {
        //moves the ants in the opposite y direction
        ys=-ys;
      }
      else {
        //moves the ants in the opposite x direction
        xs=-xs;
      }
    }
  }


  void display() {

    if (myPic.get(int(x), int(y)) !=color (0)) {   //draws the dots to make the tunnel 
      stroke(0);
      fill(0);
      strokeWeight(1);
      ellipse(x, y, 2, 2);
    }
  }
}






