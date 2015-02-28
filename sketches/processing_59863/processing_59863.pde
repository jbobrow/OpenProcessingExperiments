
float x=250;
float y=250;
float z=0;

float xoff=250;
float yoff=250;
float zoff=0;
myTime mt= new myTime();


void setup() {
  size(500, 800, P3D);
  background(0);
  camera(0, 360, -250, 250, 250, -110, 0, 0, 1);

  //load font
  PFont myFont = createFont("Arial", 10);
  stroke(200);
  textFont(myFont);

  frameRate(50);
}

void draw() {

  mt.Axis();
  mt.Drawvalue();
  mt.Initialize();


  //STOP LOOP @24 HOURS
  if (z==-240.5) {
    noLoop();
  }
}

//RESTART
void mousePressed() {
  background(0);
  x=250;
  y=250;
  z=0;

  xoff=250;
  yoff=250;
  zoff=0;
  loop();
}


class myTime {

  void Axis() {
    stroke(255);
    strokeWeight(2);
    line(300, 300, z, 300, 300, zoff);
    line(300, 300, 0, 200, 300, 0);
    line(300, 300, 0, 300, 200, 0);
  }

  //INCREMENT VALUES
  void Initialize() {
    x=x+random(-25, 25);
    y=y+random(-25, 25);
    z=z-0.5;
    x=constrain(x, 200, 300);
    y=constrain(y, 200, 300);
    
    stroke(255, 20, 147);
    strokeWeight(0.5);
    point(x, y, z);
    
  }

  //DRAW CIRCULATION
  void Drawvalue() {
    //DRAW 6 HOURS MARK
    if (z%60==0) {
      strokeWeight(1);
      text("6", 300, 325, z);
      stroke(255, 50);
      line(300, 315, z, 300, 305, z);
      //rec
      stroke(255, 50);
      line(300, 300, z, 200, 300, z);
      line(300, 300, z, 300, 200, z);
      line(200, 300, z, 200, 200, z);
      line(300, 200, z, 200, 200, z);
    }

    stroke(255, 20, 147,50);
    strokeWeight(1);
    line(x, y, z, xoff, yoff, zoff);

    //PASS VALUES
    xoff=x;
    yoff=y;
    zoff=z;
  }
}


