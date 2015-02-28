

// wk07
// how do you select the same random value?

chair[] a  = new chair[100];

float x;
float y;

void setup() {
  size(600, 600);
  smooth();
  stroke(0);
  line(0, height/4, width, height/3.5);


  for (int i = 0; i < a.length ; i++) {
    x = random(width-80);
    y = random(height/2, height/1.4);

    a[i] = new chair(x, y, 80, 200);
  }
}


void draw() {



  for (int i = 0; i < a.length; i++) {

    float angle = 0;
    pushMatrix();
    rotate(angle);
    angle += 0.1;
    a[i].display();
    popMatrix();
  }
}






void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}

class chair {
  //data

  float xpos;
  float ypos;
  int w;
  int h;

  //constructor
  chair(float _xpos, float _ypos, int _w, int _h) {
    //from setup----------

    xpos = _xpos;
    ypos = _ypos;
    w = _w;
    h = _h;
  }

  
  //functions-----------
  void display() {
       

  
//  translate(0, height/2);
  fill(240, 250, 255);
  stroke(random(255),random(255), random(255));
  frameRate(10);
//  w=int(random(80,100));

  rect(xpos, ypos, w, -h * 0.5); //top
  rect(xpos, ypos, w * 0.125, h * 0.4); //leg 01
  rect(xpos + 20, ypos, w * 0.125, h * 0.5); //leg 02
  rect(xpos + 80, ypos, w * 0.125, h * 0.4); //leg 05
  rect(xpos + w, ypos, w * 0.125, h * 0.5); //leg 04
  

  rect(xpos, ypos, w * 1.25, h * 0.05); //seat

  
    
  }
  
  

  
  
  
  
}








