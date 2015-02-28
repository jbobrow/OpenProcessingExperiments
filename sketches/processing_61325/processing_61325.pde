
EllipseConnectDraw ellip1, ellip2, ellip3, ellip4, ellip5, ellip6,ellip7, ellip8, ellip9, ellip10 ;
boolean toggleLoop = true;

void setup() {
  size(500, 500);
  smooth();
  frameRate(8);

  ellip1 = new EllipseConnectDraw();
  ellip2 = new EllipseConnectDraw();
  ellip3 = new EllipseConnectDraw();
  ellip4 = new EllipseConnectDraw();
  ellip5 = new EllipseConnectDraw();
  ellip6 = new EllipseConnectDraw();
  ellip7 = new EllipseConnectDraw();
  ellip8 = new EllipseConnectDraw();
  ellip9 = new EllipseConnectDraw();
  ellip10 = new EllipseConnectDraw();
  
}

void draw() {
  ellip1.run();
  ellip2.run();
  ellip3.run();
  ellip4.run();
  ellip5.run();
  ellip6.run();
  ellip7.run();
  ellip8.run();
  ellip9.run();
  ellip10.run();
 
}


void mousePressed() {
  if (mouseButton == LEFT) {
    if (toggleLoop) {
      noLoop();
      toggleLoop = false;
    }
    else {
      loop();
      toggleLoop = true;
    }
  }
}
public class EllipseConnectDraw {

  //Declare Variables.
  float x, y, cx, cy;
  float _x, _y, _cx, _cy;
  float size;
  int col;

  //Constructor and Variable Initialization.
  EllipseConnectDraw() {
    x = height / 2;
    y = height / 2;
    _x = width / 2;
    _y = width / 2;
    cx = width / 2;
    cy = height / 2;
    _cx = width / 2;
    _cy = height / 2;
    size = random(10,50);
    background(200);
  }

  //run() invokes the other methods in the class, called by draw().
  void run() {
    backgroundFill();
    ellipseDraw();
  }

  //backgroundFill(), fills the the background with a full screen rectangle with a sky blue colour and 5% opacity.
  void backgroundFill() {
    noStroke();
    fill(200, 230, 250,100);
    rect(0, 0, width, height);
  }

  //ellipseDraw(), draws the ellipses based on a semi-random area, each ellipse point is within +- 50 of the previous ellipse.
  void ellipseDraw() {     
    size = random(25, 80);
    x = _x;
    y = _y;
    cx = _cy;
    cy = _cx;

    col = color(random(100, 160), random(100, 200), random(100, 200));     

    _y = constrain(x + random(-30, 50), 0, width);
    _x = constrain(y + random(-70, 50), 0, height);            

    noStroke();
    fill(col, 40);
    ellipse(mouseX, mouseY, size * 1.5f, size * 1.5f);         

    fill(col*2);
    ellipse(mouseX, mouseY, size, size);

    fill(col);
    ellipse(x, y, size / 2.5f, size / 2.5f);
  }
}


