
//Declaring




perfume a;
perfume b;
perfume c;
perfume d;
perfume e;

void setup() {
  colorMode(RGB);
  size(1000, 600);
  background(215,213,222,100);
  smooth();
  noLoop();
  
  
   a = new perfume(100,50,2.5,200);
   b = new perfume(300,300,2.5,100);
   c= new perfume(10,50,2.5,200);
   d= new perfume(10,50,2.5,200);
   e= new perfume(10,50,2.5,200);
   
   
   }
void draw() {
  
  background(200);
  
  
a.run();
b.run();
c.run();
d.run();
e.run();
}
class perfume {



  //DATA

  float x, y ;
  float w, h;
  //  int fillval;


  perfume(float x, float y, float a, float b) {
  }










  //FUNCTIONALITY
  void run() {
    display();
    mousePressed();
    //update();
    // wrap();
  }

  void display() {
    //pushMatrix();
    translate(200, -100);  
    fill(100, random(40,255));
    stroke(255,random(40,100));
    rotate(0.3);

    quad(150, 511, 293, 510, 257, 567, 176, 566);
    quad(95, 454, 150, 511, 175, 565, 134, 555);
    quad(355, 469, 317, 555, 257, 567, 293, 510);
    quad(204, 499, 224, 491, 222, 511, 151, 511);
    triangle(224, 494, 291, 509, 222, 511);
    quad(95, 454, 224, 488, 203, 498, 150, 512);
    quad(355, 469, 293, 510, 229, 493, 241, 483);

    quad(168, 298, 222, 308, 221, 490, 95, 454);
    quad(222, 308, 221, 490, 355, 469, 284, 304);
    quad(220, 469, 246, 498, 225, 504, 204, 499);


    //top
    quad(224, 113, 224, 280, 181, 264, 140, 160);
    quad(224, 113, 305, 160, 268, 264, 224, 280);
    quad(170, 299, 197, 280, 256, 281, 284, 303);
    // popMatrix();
  }
}

 
void mousePressed () {
  redraw ();

  }



