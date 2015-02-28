
//red ants and black ants building the Charlotte Skyline

PImage img;
int num=100;
ant [] ant=new ant[num];
redant [] redant= new redant[num];

void setup() {
  smooth();
  size(900, 599);
  background (50);
  img=loadImage("Charlotte Skyline.jpg");
  img.loadPixels();

  //this gives the composition its left side starting point and beings creating the black ants
  for (int i=0; i<num; i++) {
    float x=(0);
    float y=(403);
    ant[i]=new ant(x, y);
  }
  //this gives the composition its right side starting point and begins creating the red ants
  for (int j=0; j<num; j++) {
    float x=(900);
    float y=(345);
    redant[j]=new redant(x, y);
  }
}


void draw() {
  //this draws the black ants as well as sets up the update and the display mode for the compostion
  for (int i=0; i<num; i++) {
    ant[i].update();
    ant[i].display();
  }
  //this draws the red ants as well as sets up the update and the display mode for the composition
  for (int j=0; j<num; j++) {
    redant[j].update();
    redant[j].display();
  }
}

//sets up the functions for the black ant
class ant {
  float x;
  float y;

  //xs and ys are the x and y spacing between ants
  float xs= 2;
  float ys= 2;

  //makes the x and y coordinates round to the nearest int number
  ant(float x_, float y_) {
    x=x_;
    y=y_;
  }

  //updates the composition so that you will be able to see the trail of the ants rather than seeing one specific ant at a time
  void update() {
    x+=xs;
    y+=ys;

    x=x++;
    y=y++;

    if (img.get(int(x), int(y)) !=color(255)) {
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
    //confines the ants to the skyline of Charlotte, without this the trails will just be random within the composition
    for (int c1=10; c1<height; c1+=30) {
      if (img.get(int(x), int(y)) !=color (0)) {

        stroke(0);
        fill(0);
        strokeWeight(1);
        ellipse(x, y, 2, 2);
      }
    }
  }
}

//sets up the functions for the red ant
class redant {
  float x;
  float y;
  
  //xs and ys are the x and y spacing between ants
  float xs= 2;
  float ys= 2;

//makes the x and y coordinates round to the nearest int number
  redant(float x_, float y_) {
    x=x_;
    y=y_;
  }

//updates the composition so that you will be able to see the trail of the ants rather than seeing on specific ant at a time
  void update() {
    x+=xs;
    y+=ys;

    x=x++;
    y=y++;

    if (img.get(int(x), int(y)) !=color(255)) {
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
    //confines the ants to the skyline of Charlotte, without this the trails will just be random within the composition
    for (int c1=10; c1<height; c1+=30) {
      if (img.get(int(x), int(y)) !=color (0)) {

        stroke(255, 0, 0);
        fill(255, 0, 0);
        strokeWeight(1);
        ellipse(x, y, 2, 2);
      }
    }
  }
}


