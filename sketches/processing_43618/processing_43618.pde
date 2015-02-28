
int num = 2000; //number of objects that are fed into the array
Thing things[] = new Thing[num]; // creates an array called things with num positions

void setup() {
  size(300, 300);

  for (int i=0; i<num; i++) { //seeding the array
    things[i] = new Thing(random(width), random(height)); // spread them randomly over the window
    if (random(2) > 1) { //fills half red and half blue
      things[i].flip = true;
    }
  }
  noStroke();
}

void draw() {
  background(220);

  for (int i=0; i<num; i++) {
    //for (int j=0; j<num; j++) {
    //things[j].check(things[i]);
    //}

    things[i].check(things, i); //

    things[i].display();
    things[i].move();
  }
}



//Creating a class Thing
class Thing {
  //creates some variables
  float x;
  float y;
  boolean flip;
  float r = 5;

  Thing(float x_, float y_) {
    x = x_;
    y = y_;
  }
//decide the movement of Thing
  void move() {
    y+=random(-1,1);
    x+=random(-1,1);
  }

  void check(Thing[] a, int num) {

    for (int i=0; i<a.length; i++) {
      if (i != num) {//make sure that it doesn't compare itself with itself
        if (dist(x, y, a[i].x, a[i].y) < r) { //if the distance sis less then r flip is true otherwise flip is false
          flip = true;
          break;
        }
        else {
          flip = false;
        }
      }
    }
  }

  void display() {
    if (flip == true) { //if distance is less than r fill red
      fill(255, 0, 0);
    }
    else {
      fill(0, 0, 255);//if distance is more than r fill blue
      //noFill();
    }
    ellipse(x, y, r, r); //draw the ellipse
  }
}


