
Path [] path = new Path [1000];              //sets up 1000 objects


void setup() {
  size(600,600);
  background(15);
  smooth();

  for (int i=0; i < path.length;i++) {
    path[i] = new Path(25,25);               //seeds the array
  }
}

void draw() {

  for (int i=0; i < path.length; i++) { 
    path[i].create();                        //sets up void create()
    path[i].animate();                        //sets up void animate()
  }
}

class Path {

  float x;
  float y;
  float rot = random(0,90);                    //spreads the shapes radially
  float monster = random (50);                 

  Path(float x, float y) {
    x = x;
    y = y;
  }


  void create() {

    if (monster < 1) {            //sets a minute chance of a "monster"appearing
      fill(255,0,0,50);            //draws a "monster"
      ellipse (x,y,50,50);
      fill(0);
      ellipse (x,y+8,45,50);
    }
    else {

      fill(200);                    //draws the white shapes
      ellipse(x, y,10,25);
      fill(0);
      ellipse(x,y+2,9,20);
    }
  }


  void animate() {                            
    x = x + random(-1, 1);              //shakes the shapes back and forth
    y = y + random(-1, 2);              //moves the shapes in a linear direction
    rotate(radians(rot));
  }
}


