
float winkel = 0.0;
float radius = 150.0;
int xLeft = width/4;
int yUp = height/4;
int xRight =  (width/4)*3;
int yDown =  (height/4)*3;
PFont f;


void setup() {
  f =createFont("Helvetica",14,true);
  size (800, 800);
  smooth();
  noFill();
}
void draw() {
  background(0);
  textAlign(CENTER);
     textFont(f,14);
     fill(255);
     text("click with mouse",width/2,height/2);
     noFill();
  xLeft = width/4;
  yUp = height/4;
  xRight =  (width/4)*3;
  yDown =  (height/4)*3;
  //vollkreis darstellen



  //mooving x,y,coordinates
  float x = width/2 + radius * cos(winkel);
  float y = height/2 - radius * sin(winkel);


  //-----------------------------
  if (mousePressed ==true) {
    stroke(255, 255, 0);
    strokeWeight(2);
    ellipse(xLeft, yUp, 60, 60);
    ellipse(xLeft, yDown, 60, 60);
    ellipse(xRight, yUp, 60, 60);
    ellipse(xRight, yDown, 60, 60);
    ellipse(width/2, height/2, radius*2, radius*2);
    ellipse(x,yUp+40,60,60);
    ellipse(x,yDown-40,60,60);
    ellipse(x,y,60,60);
  }

  stroke(255, 0, 0);
  strokeWeight(2);
  //-------Left UP
  line(width/4, height/4, x, y);
  line(x, yUp+40, x, y);
  line(x-40, height/4, width/4, height/4);
  //-------right UP
  line(xRight, yUp, x, y);
  line(x+40, yUp, xRight, yUp);
  //schrägen
  line(x+40, yUp, x, yUp+40);
  line(x-40, yUp, x, yUp+40);

  //-------Left Down
  line(xLeft, yDown, x, y);//no
  line(x-40, yDown, xLeft, yDown);

  //-------Right Down
  line(xRight, yDown, x, y);//no
  line(x, yDown-40, x, y);//no
  line(x+40, yDown, xRight, yDown);
  line(x+40, yDown, x, yDown-40);
  //linke schräge unten
  line(x-40, yDown, x, yDown-40);

  //-------Right side
  line(xRight, yDown, xRight, yUp);//no
  line(xRight, y, x, y);
  //-------Left side
  line(xLeft, yDown, xLeft, yUp);//no
  line(xLeft, y, x, y);
  //println("y = " + dist(x, y, xLeft+xLeft, yDown));
 

  winkel +=0.005; //erhöhung des winkelwertes
}



