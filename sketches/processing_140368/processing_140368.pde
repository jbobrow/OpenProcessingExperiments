
//Rachel Hill, Project #2, Ripples, March 14.

float [] bubbles = new float[100]; // array of bubbles

//group 1 of ripples, center right
Ripple waterRip1;
Ripple waterRip2;
Ripple waterRip3;
Ripple waterRip4;
Ripple waterRip5;
Ripple waterRip6;

//group 2 of ripples, top left
Ripple waterRip7;
Ripple waterRip8;
Ripple waterRip9;
Ripple waterRip10;
Ripple waterRip11;
Ripple waterRip12;

//group 3 ripples, at bottom
Ripple waterRip13;
Ripple waterRip14;
Ripple waterRip15;
Ripple waterRip16;
Ripple waterRip17;
Ripple waterRip18;

//group 4 ripples, position controlled by mouse
Ripple waterRip19;
Ripple waterRip20;
Ripple waterRip21;
Ripple waterRip22;
Ripple waterRip23;
Ripple waterRip24;


void setup() {
  size(800, 600); //canvas size
  frameRate(1);    
  smooth();
  
  //represents color of ripple as well as position and speed
  //of group 1, ripples on center right
  waterRip1 = new Ripple(color(#21B766, 45), 10, 25, 10);
  waterRip2 = new Ripple(color(#21B79D, 45), 40, 75, 10);
  waterRip3 = new Ripple(color(#2195B7, 45), 20, 20, 10);
  waterRip4 = new Ripple(color(#2172B7, 45), 50, 15, 10);
  waterRip5 = new Ripple(color(#214AB7, 45), 35, 25, 10);
  waterRip6 = new Ripple(color(#21B72A, 45), 20, 30, 10);

  //represents color of ripple as well as position and speed
  //of group 2, ripples on top left
  waterRip7 = new Ripple(color(#21B72A, 35), 10, 25, 1);
  waterRip8 = new Ripple(color(#21B766, 35), 40, 75, 1);
  waterRip9 = new Ripple(color(#214AB7, 35), 20, 20, 1);
  waterRip10 = new Ripple(color(#21B79D, 35), 50, 15, 1);
  waterRip11 = new Ripple(color(#2172B7, 35), 35, 25, 1);
  waterRip12 = new Ripple(color(#2195B7, 35), 20, 30, 1);

  //represents color of ripple as well as position and speed
  //of group 3, ripples at bottom
  waterRip13 = new Ripple(color(#2195B7, 40), 10, 25, 5);
  waterRip14 = new Ripple(color(#2172B7, 40), 40, 75, 5);
  waterRip15 = new Ripple(color(#21B79D, 40), 20, 20, 5);
  waterRip16 = new Ripple(color(#214AB7, 40), 50, 15, 5);
  waterRip17 = new Ripple(color(#21B766, 40), 35, 25, 5);
  waterRip18 = new Ripple(color(#21B72A, 40), 20, 30, 5);

  //represents color of ripple as well as position and speed
  //of group 4
  waterRip19 = new Ripple(color(#2303FF, 50), 10, 25, 1);
  waterRip20 = new Ripple(color(#0311FF, 50), 40, 75, 1);
  waterRip21 = new Ripple(color(#0354FF, 50), 20, 20, 1);
  waterRip22 = new Ripple(color(#038FFF, 50), 50, 15, 1);
  waterRip23 = new Ripple(color(#03CEFF, 50), 35, 25, 1);
  waterRip24 = new Ripple(color(#03FFDF, 50), 20, 30, 1);
}

void draw() {
  background(30); //gray background
  
  //controls random position and size of array of bubbles
   for(int bub = 0; bub <bubbles.length; bub++){
    ellipse(random(0,800),random(0,600), 10,10);
  }
  
  //changes background to white when mouse pressed
  if (mousePressed) {
    noStroke();
    fill(255);
    rect(0, 0, width, height);
  }
  //changes bubbles to gray when mouse pressed
    if (mousePressed) {
    for (int bub = 0; bub <bubbles.length; bub++) {
      stroke(30,100);
      ellipse(random(0, 800), random(0, 600), 10, 10);
    }
  }

  //group 1
  waterRip1.mov();
  waterRip1.display();
  waterRip2.mov();
  waterRip2.display();
  waterRip3.mov();
  waterRip3.display();
  waterRip4.mov();
  waterRip4.display();
  waterRip5.mov();
  waterRip5.display();
  waterRip6.mov();
  waterRip6.display();

  //group 2
  waterRip7.mov();
  waterRip7.display2();
  waterRip8.mov();
  waterRip8.display2();
  waterRip9.mov();
  waterRip9.display2();
  waterRip10.mov();
  waterRip10.display2();
  waterRip11.mov();
  waterRip11.display2();
  waterRip12.mov();
  waterRip12.display2();

  //group 3
  waterRip13.mov();
  waterRip13.display3();
  waterRip14.mov();
  waterRip14.display3();
  waterRip15.mov();
  waterRip15.display3();
  waterRip16.mov();
  waterRip16.display3();
  waterRip17.mov();
  waterRip17.display3();
  waterRip18.mov();
  waterRip18.display3();

  //group 4
  waterRip19.mov();
  waterRip19.display4();
  waterRip20.mov();
  waterRip20.display4();
  waterRip21.mov();
  waterRip21.display4();
  waterRip22.mov();
  waterRip22.display4();
  waterRip23.mov();
  waterRip23.display4();
  waterRip24.mov();
  waterRip24.display4();
}

class Ripple {
  color c; //color
  float xpos; //position on the x   
  float ypos; //position on the y   
  float speed; //speed


    Ripple(color wC, float rxpos, float rypos, float rspeed) {
    c = wC;
    xpos = rxpos;
    ypos = rypos;
    speed = rspeed;
  }

  float circ = 5;    // controls number of ripples (rings)
  float sc = random(width); //scale of ellipse
  float r = random(1, 5); //controls number of ripples (rings)

  //group 1 ripples on right
  //controls position and repetition of ripples
  void display() {
    for (int i = 0; i<circ; i++) {
      stroke(c);
      noFill();
      ellipse(600, 300, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;
      
      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -1000; //controls fading of circles
      }
    }
  }

  //group 2 ripples on top left
  //controls position and repetition of ripples
  void display2() {
    for (int i = 0; i<circ; i++) {
      stroke(c);
      noFill();
      ellipse(100, 100, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;
      
      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -1000; //controls fading of circles
      }
    }
  }

  //group 3 ripples at bottom
  //controls position and repetition of ripples
  void display3() {
    for (int i = 0; i<circ; i++) {
      stroke(c);
      noFill();
      ellipse(300, 550, sc, sc); //position and scale of ellipse

      //controls movement
      sc=sc+r;
      
      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -1000; //controls fading of circles
      }
    }
  }

  //group 4 controled by mouse
  //controls position and repetition of ripples
  void display4() {
    for (int i = 0; i<circ; i++) {
      stroke(c);
      noFill();
      //position and scale of ellipse controled by mouse
      ellipse(mouseX, mouseY, sc, sc); 

      //controls movement
      sc=sc+r;
      
      //keeps ripples on a loop
      if (sc>width+10) {
        sc = -1000; //controls fading of circles
      }
    }
  }
  void mov() {
    display();
    xpos = xpos + 10;
  }
}
