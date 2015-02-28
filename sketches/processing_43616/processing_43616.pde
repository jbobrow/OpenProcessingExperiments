
ArrayList mens;
ArrayList womans;
int ballWidth = 10;//size of the objects
PImage pic; 
PImage img;

void setup() {
  size(500, 500);
  smooth();
  noStroke();
  pic = loadImage("Capitol3.jpg");//the picture that the system read from
  img = loadImage("Capitol.jpg");//background picture
  pic.loadPixels();



  // Create an empty ArrayList
  mens = new ArrayList();
  // A very bad way to start the system with 20 men
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));
  mens.add(new Men(random(width), random(height), ballWidth));

  womans = new ArrayList();
  //a very bad way to start the system with 20 women

  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
  womans.add(new Woman(random(width), random(height), ballWidth));
}

void draw() {
  background(img);


  for (int i = 0; i < mens.size(); i++) {  
    // An ArrayList doesn't know what it is storing so we have to cast the object coming out
    Men men = (Men) mens.get(i);
    men.display();

    men.move();
  }
  for (int i = 0; i < womans.size(); i++) {
    Woman woman = (Woman) womans.get(i);
    woman.display();
    woman.move();
    woman.check(mens);
  }
}

//void mousePressed() {

// mens.add(new Men(random(width), random(height), ballWidth));
// womans.add(new Woman(random(width), random(height), ballWidth));
//}






class Men {

  float x;
  float y;
  float w;





  Men(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }




  void move() {
    y+=random(-5, 5);
    x+=random(-5, 5);
    //wrap around
    if (x > width) x = 0;
    if (y > height) y = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;

    int tx = floor(x);
    int ty = floor(y);
    //check to see if the objects are in water or not. Does not work that good
    color c = pic.pixels[(ty*(width-1)) + tx];

    if (c == color(255, 255, 255)) {//if its in water the object is removed
      mens.remove(this);
    }
  }

  void display() {
    // Display the circle
    fill(0);

    ellipse(x, y, w, w);
  }
}





class Woman {

  float x;
  float y;
  float w;
  float r = 7;//distance to create men
  float k = 2;//distance to create women



  Woman(float tempX, float tempY, float tempW) {
    x = tempX;
    y = tempY;
    w = tempW;
  }




  void move() {
    y+=random(-1, 1);
    x+=random(-1, 1);
    //wrop around
    if (x > width) x = 0;
    if (y > height) y = 0;
    if (x < 0) x = width;
    if (y < 0) y = height;

    int tx = floor(x);
    int ty = floor(y);

    color c = pic.pixels[(ty*(width-1)) + tx];//if the object is i water, remove it

    if (c == color(255, 255, 255)) {
      womans.remove(this);
    }
  }
  //proximity
  void check(ArrayList _bs) {
    ArrayList bs = _bs;
    int tx = floor(x);
    int ty = floor(y);
    //check the distance between men and women
    for (int i=0; i<bs.size(); i++) {
      Men b = (Men)bs.get(i);
      float distance = dist(tx, ty, b.x, b.y);

      if (distance < r) {//if distance less than r add a man
        mens.add(new Men(random(width), random(height), ballWidth));
        // womans.add(new Woman(random(width), random(height), ballWidth));
      }
      if (distance < k) {//if distance less than k add a woman
        womans.add(new Woman(random(width), random(height), ballWidth));
      }
    }
  }

  void display() {
    // Display the circle
    fill(255, 0, 0);

    ellipse(x, y, w, w);
    //println(x);
  }
}


