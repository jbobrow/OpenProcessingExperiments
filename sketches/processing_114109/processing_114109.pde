
int paperWidth = 50;
int paperHeight = 70;
PImage img;

Oblivion oblivion;
ArrayList<Paper> papers;

void setup() {
  size(550, 600);
  oblivion = new Oblivion(img);
  papers = new ArrayList<Paper>();
}

void draw() {
  oblivion.display();  

  for (int i = 0; i < papers.size(); i++) {
    Paper p = papers.get(i);
    if (oblivion.containsPaper(p)) {
      println("in oblivion.containsPaper()");
      p.disappear();
    }
    p.display();
    if ( p.w < 1 || p.h < 1) {
      papers.remove(i);
    }
  }
}

void mousePressed() {
  papers.add(new Paper(mouseX-paperWidth/2, mouseY-paperHeight/2, paperWidth, paperHeight));
}

class Oblivion {
  int voidX = width/2;
  int voidY = (width/2)-60;
  int voidSize = width-180;
  
  float rw, rh;

  boolean voidOver = false;

  Oblivion (PImage _img) {      //Constructor
    img = _img;
    img = loadImage("void.jpg");
  }
  
  void display() {
    image(img, 0, 0);
  }

  boolean overVoid() {                   // VERSION 2
    float disX = voidX - mouseX;
    float disY = voidY - mouseY;    
    if (sqrt(sq(disX) + sq(disY)) < voidSize/2) {
//      noFill();
//      stroke(200, 0, 0);
//      ellipse(voidX, voidY, voidSize, voidSize);
      return true;
    } 
    else {     
//      noFill();
//      stroke(0, 0, 200);
//      ellipse(voidX, voidY, voidSize, voidSize); 
      return false;
    }
  } 
  
  boolean containsPaper(Paper paper) {
    float disX = voidX - paper.x;
    float disY = voidY - paper.y;
    if (sqrt(sq(disX) + sq(disY)) < voidSize/2) {
      return true;
    } else {     
      return false;
    }
  }
}

class Paper {
  int x, y;
  int f, s;
  int diameter;
  float w, h;
  float rw, rh, r;
  float rotate = 0;
  boolean over;
  boolean targeted;
  boolean nothing = false;
  boolean dragging = false;
  boolean vanishing = false;

  Paper (int _x, int _y, int _w, int _h) {  // Constructor
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    f = 200;
    s = 160;
  }  // end constructor


  void display() {
    pushMatrix();
      translate(x+rw/2, y+rh/2);
      rotate(rotate);
      stroke(s);
      fill(f);
      rectMode(CENTER);
      rect(0, 0, w, h);
    popMatrix();
  }  // end display()
  
  void disappear() {
    rotate = rotate + 0.15;
//    println("in paper.disappear()");
//    println(w);
//    println(h);
    if (w > 0 || h > 0) {
      w = w - 1;
      h = h - 1.4;
    }
  }  // end disappear()


//  boolean overEvent() {            // Checks to see if the mouse is over the shape.
//    if (mouseX >= x && mouseX <= x + w && 
//      mouseY >= y && mouseY < y +h) {
//      return true;
//    } else {
//      return false;
//    }
//  }  // end overEvent()

//  void update() {                 // Constantly updates in draw().
//    if (overEvent()) {            // applies the overEvent and checks if it's true.
//      over = true;
//    } else {
//      over = false;
//    }
//    if (targeted) {              // animates the paper(), changes the x, y, vars when according to mouse 
//      x = mouseX-w/2;     
//      y = mouseY-h/2;
//    }    
//    if (!targeted) {
//      nothing = true;           // defines nothing state for display
//    } 
//    if (over && targeted) {     // defines dragging state for display
//      dragging = true; 
//    }
//
//    if (dragging) {           // needs to be in mousePressed() in main
//      nothing = false;
//      vanishing = false;
//      rw = w;
//      rh = h;
//      paper(rw, rh, 0);
//    }
//    if (vanishing) {          // needs to be in mouseReleased() in main
//      println("Vanishing is true");
//      nothing = false;
//      dragging = false;
//      paper(rw, rh, rotate);
//      disappear(); 
//    }
//  }  // end update()
  
//  void clicked() {                // This function is called in the mousePressed() function in main.
//    if (over) {
//      targeted = true;
//    }
//  }  // end clicked()

//  void unclick(boolean on) {      // This function is called in the mouseReleased() function in main.
//    if (on) {
//      println("unclick(on) is true");
//      targeted = false;
//      vanishing = true;
//    }

//  }  // end unclick()
  


  
}  // end class Paper



