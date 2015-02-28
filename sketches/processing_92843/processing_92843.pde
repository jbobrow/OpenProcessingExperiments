
//Elli_102912_multiple_particle_system_with_images

ArrayList AllTess;
PImage tess1;
PImage tess2;

void setup() {
  background(200);
  size(300, 300);
  frameRate(30);
  smooth();
  // Create an empty list (see JavaDocs for full info)
  AllTess = new ArrayList();
  tess1 = loadImage("tes_1.png");
  tess2 = loadImage("tes_2.png");

  //make some instances of Ball and store references to them in the list
  AllTess.add(new Tes(32)); //NOTE  "add" appends an item to end of an ArrayList
  AllTess.add(new Tes(24));
  AllTess.add(new Tes(20));
  AllTess.add(new Tes(38));
  AllTess.add(new Tes(18));
}

void draw() {
 //s background(200);
  // Move and display balls

  for (int i=0; i<AllTess.size(); i++) {  //oops

    //how to address one of the objects in the list...
    Tes aTes = (Tes)AllTess.get(i);  //NOTE "get" instead of [bracket]
    //requires specific use type-casting, to avoid compiler confusion
    aTes.move();
    //meaning: "Get the i-th ball from the list and tell it to move()."
  }

  for (int i=0; i < AllTess.size(); i++) {
    int partner;
    if (i == AllTess.size() - 1) {
      partner = 0;
    } else {
      partner=i+1;
    }
      
    Tes aTes = (Tes)AllTess.get(i);
    Tes bTes = (Tes)AllTess.get(partner);
  }

  for (int i=0; i < AllTess.size(); i++) {
    Tes aTes = (Tes)AllTess.get(i);
    aTes.display();
  }
}

void mousePressed() {
    AllTess.add(new Tes(random(10,35)));
    Tes aTes = (Tes)AllTess.get(AllTess.size()-1);
    aTes.locateyourself(mouseX,mouseY); 
}

void keyPressed() {
  setup();
}

class Tes {
  float r; // radius
  float x, y;
  float x2, y2;
  float x2speed, y2speed;
  float xspeed, yspeed;

  // Constructor
  Tes (float r_) {
    r = r_;
    x = random(width);
    y = random(height);
    x2 = random(width+10);
    y2 = random(height+10);
    xspeed = random(-7, 2);
    yspeed = random(-5, 5);
    x2speed = random(-6,6);
    y2speed = random(-3,3);
  }
  
  void locateyourself(int _mx, int _my) {
    x = _mx;
    y= _my;
  }

  void move() {
    x += xspeed; // Increment x
    y += yspeed; // Increment y
    x2 += x2speed;
    y2 += y2speed;
    // Check horizontal edges
    if (x > width || x < 0) {
      xspeed *= -1;
    }
    // Check vertical edges
    if (y > height || y < 0) {
      yspeed *= -1;
    }
    
    if (x2 > width || x2<0) {
      x2speed *=-1;
    }
    
    if (y2>height || y2<0 ) {
      y2speed*=-1;
    }
  }

  void display() {
   // tint(random(100,200), random(50,100));
//    tint (random(100,200), 200);
    image(tess1, x2, y2, r*2, r*2);
    image(tess2, x, y, r*4, r*4);

  }
  
}



