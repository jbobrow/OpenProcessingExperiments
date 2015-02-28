
Box [] boxes = new Box [8000];


void setup() {
  size (1000,100);
  smooth();
  stroke(0);
  fill(0);

  for (int i = 0; i < boxes.length; i++) {
    boxes[i] = new Box(random(-2000,width), random(-3000,height), random(30), random(80), random(8));//size of boxes and where they start
  }  


}


void draw() {
  background(255);

  for (int i = 0; i < boxes.length; i++){
    boxes[i].display();
    boxes[i].dropleaves();
  }

}

class Box {

  //variables
  float x;
  float y;
  float hsize;
  float wsize;
  float xspeed;
  float yspeed;

  // constructor
  Box (float x_, float y_,  float wsize_, float xspeed_, float yspeed_)  {
    x = x_;
    y = y_;
    wsize = wsize_;
    hsize = wsize_;
    xspeed = xspeed_;
    yspeed = yspeed_;
  }

  //function leaves fall   
  void dropleaves () {  //motion
    x = x+ xspeed/4;
  y = Y+yspeed/4;
  }

  // function draw leaves
  void display ()  {
    noStroke ();
    fill (400,205,205);
     rect(x*5,y*10,hsize,wsize);
  }      

}    




