
/*Steven Ko
 suyunk@andrew.cmu.edu
 copyright ©  Steven Ko || OCT 2012 Pittsburgh PA 15213 All Rights Reserved
 */

holder walkers;

void setup() {
  size(800,600);
  background(0);
  noFill();

  walkers = new holder(30);    //number of walkers generated
}

void draw() {
  walkers.update();
  walkers.drawWalkers();

}

///////////////////////////////////////////////////

class holder {
  Vector<walker> people = new Vector<walker>();

  holder(int _n) {

    for (int i = 0; i < _n; i++) {
      walker w = new walker(random(0, width), random(0, height), color(random(255)));
      people.add(w);
    }
  }

  void update() {

    for (int i = 0; i < people.size(); i++) {
      walker w = people.get(i);
      w.step();
     
    }
  }


  void drawWalkers() {

    for (walker w : people) {

      w.mark();
       w.boundary();
    }
  }

  void addWalker(float _x, float _y) {
    walker w =  new walker(_x, _y, color(random(0, 255), random(0, 255), random(0, 255)));
    people.add(w);
  }
}

//////////////////////////////////////////////////////

class walker{
  float x;
  float y;
  float xOld;
  float yOld;
  float stepSize = random(5,12);   //variables for length of "step"
  color c;
  
  
  walker(float _x, float _y, color _c){
    x = _x;
    y = _y;
    c = _c;
  }
  
  void step(){                //random roll for cartesian movement
    float roll = random(1);
    xOld = x;
    yOld = y;

    if (roll > .75) {
      x+=stepSize;
    }
    else if (roll < .75 && roll > .5) {
      x-=stepSize;
    }
    else if (roll < .5 && roll > .25) {
      y+=stepSize;
    }
    else {
      y-=stepSize;
    }  
  }
  
  void boundary() {            //walkers "bounce" off boundary
    if (x <= 0 || x >= width){
      x = -x;
    }
    if (y <= 0 || y >= height) {
      y = -y;
    }
  }
  
  void mark(){
   stroke(c);
   line(xOld, yOld, x, y);
  }
  
}
 


