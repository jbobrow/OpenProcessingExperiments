
int x = 10;
int buttoncolor = 0;
int highlight = #FFFFFF;
PFont fontA;
PFont fontB;
PFont fontC;
CircleButton circle1, circle2, circle3, circle4;
boolean locked = false;
import controlP5.*;
ControlP5 controlP5;
int newton = 0;
int newton1 = 0;
int C = newton-newton1;
int D = newton1-newton;

void setup() {
  size(600,300);
  background(255,0,0);
  smooth();
  fontA = loadFont("Tahoma-10.vlw");
  textFont(fontA, 10);
  buttoncolor = color(0,0,0);
  highlight = color(255,255,255); 
  circle1 = new CircleButton(100, 40, 20, 255, 0);
  buttoncolor = color(0);
  highlight = color(255,255,255); 
  circle2 = new CircleButton(300, 40, 20, 255, 0);
  buttoncolor = color(0);
  highlight = color(255,255,255); 
  circle3 = new CircleButton(500, 40, 20, 255, 0);
  fill(0);
  text("Forces: Unbalanced & Balanced", 0, 10);
  text("Click Here For A Visual Explanation Of Forces", 10, 60);
  text("Click Here to See A Definition List", 230, 60);
  text("Click Here For A Net Force Calculator", 420, 60);
  fill(255,255,255);
  text("A Project By Riley Galloway & Sierra Hearn", 0, 20);
}

void draw() {
  stroke(255,255,255);
  update(mouseX, mouseY);
  circle1.display();
  circle2.display();
  circle3.display();
}

void update(int x, int y) {
  if(locked == false) {
    circle1.update();
    circle2.update();
    circle3.update();
  } 
  else {
    locked = false;
  }
  if(mousePressed) {
    if(circle1.pressed()) {
      explanatoryForces();
    }
    else if(circle2.pressed()) {
      createText();
    }
    else if(circle3.pressed()) {
      forceCalculator();
    }
  }
}

void explanatoryForces() {
  fill(0);
  rect(0,62,599,237);
  fontB = loadFont("Tahoma-20.vlw");
  textFont(fontB, 20);
  fill(255,255,255);
  text("Visual Explanation:", 0, 78);
  fontA = loadFont("Tahoma-10.vlw");
  textFont(fontA, 10);
  fill(255,0,0);
  stroke(255,255,255);
  strokeWeight(3);
  line(2,87,52,87);
  triangle(52,87,49,84,49,90);
  line(57,87,107,87);
  triangle(57,87,60,84,60,90);
  text("x N(ewton)", 2, 100);
  text("x N", 67, 100);
  text("= 0", 50, 110);
  fontC = loadFont("Tahoma-15.vlw");
  textFont(fontC, 15);
  fill(255,255,255);
  text("2 Forces of equal Newton,", 2, 120);
  text("Will cancel each other out,", 2, 135);
  text("Causing no Net Force on the Object.", 2, 150);
  strokeWeight(1);
  line(0,155,300,155);
  line(225,155,225,62);
  strokeWeight(3);
  line(2,180,37,180);
  triangle(37,180,34,177,34,183);
  line(2,200,28,200);
  triangle(28,200,25,197,25,203);
  noStroke();
  rect(45,177,25,35);
  fontA = loadFont("Tahoma-10.vlw");
  textFont(fontA, 10);
  fill(255,0,0);
  text("Net", 45, 184);
  text("Force", 45, 193);
  text("Forces", 2, 174);
  textFont(fontC, 15);
  fill(255,255,255);
  text("When 2 forces are added to the same direction,", 2, 230);
  text("The forces are unbalanced, and create a larger", 2, 245);
  text("Net Force on the object.", 2, 260);
  strokeWeight(1);
  stroke(255,255,255);
  line(300,155,300,300);
  line(0,82,225,82);
  strokeWeight(3);
  line(229,95,280,95);
  triangle(280,95,277,92,277,98);
  rect(295,75,55,35);
  line(360,95,385,95);
  triangle(360,95,363,92,363,98);
  fill(255,0,0);
  textFont(fontA, 10);
  text("8 N", 245, 85);
  text("4 N", 369, 85);
  text("Net Force", 295, 82);
  stroke(255,0,0);
  line(295,95,320,95);
  triangle(320,95,317,92,317,98);
  text("4 N", 300, 110);
  textFont(fontC, 15);
  fill(255,255,255);
  text("If there are 2 forces of different newton values on each", 250, 140);
  text("side of the object, the Net Force will subtract", 305, 175);
  text("the smaller force from the larger force, and the", 305, 190);
  text("remaining force will go in the larger force's", 305, 205);
  text("direction as the Net Force.", 305, 220);
  strokeWeight(1);
}

void createText() {
  fill(255,0,0);
  stroke(255,0,0);
  rect(0,62,599,237);
  fontB = loadFont("Tahoma-20.vlw");
  textFont(fontB, 20);
  fill(255,255,255);
  text("Definitions:", 0, 80);
  textFont(fontA, 10);
  fill(0);
  text("Force: A 'push' or 'pull' exerted on an object.", 0, 90);
  text("Newton: A unit of measurement that equals the force required to accelerate 1kM of mass at 1m per/sec per/sec.", 0, 100);
  text("Unbalanced Forces: Forces that make a non-zero net force upon an object, causing motion/movement in the object, being it's direction", 0, 110);
  text("going towards the smaller newton force.", 30, 120);
  text("Balanced Forces: Equal forces acting on an object, causing no motion or movement in the object.", 0, 130);
  text("Net Force: The overall force on an object, determining its motion and direction of motion.", 0, 140);
}

void forceCalculator() {
  fill(255,0,0);
  stroke(255,0,0);
  rect(0,62,599,237);
  textFont(fontA, 10);
  fill(0);
  buttoncolor = color(0);
  highlight = color(255,255,255); 
  circle4 = new CircleButton(500, 200, 20, 255, 0);
  controlP5 = new ControlP5(this);
  controlP5.addButton("calculate",15,260,90,80,20);
  controlP5.addSlider("newton",0,100,2,90,200,20);
  controlP5.addSlider("newton1",0,100,360,90,200,20);
  text("Enter This Side's Newton Force Value:", 2, 75);
  text("Enter This Side's Newton Force Value:", 434, 75);
  text("Enter Newton Values and this will calculate the Net Force of an object and it's direction. To refresh, hit button again.", 2, 268);
  text("You must refresh after each calculation, or buildup of text will occur.", 2, 278);
  text("To calculate newton values and get net force and direction, drag the sliders to the number and hit 'CALCULATE'.", 2, 288);
  text("NOTE: Sliders only goto an integer point of 100, If held 'ALT', you can drag the sliders and buttons. They WILL show up on other pages.", 2, 298);
  rect(250,125,100,100);
}

public void calculate() {
  smooth();
  if (newton > newton1) {
    int D = newton1-newton;
    strokeWeight(3);
    stroke(255,255,255);
    line(380,175,400,175);
    fill(255,255,255);
    triangle(400,175,397,172,397,178);
    fontB = loadFont("Tahoma-20.vlw");
    textFont(fontB, 20);
    text(""+-D, 282, 180);
    strokeWeight(1);
  }
  if (newton < newton1) {
    int C = newton-newton1;
    strokeWeight(3);
    stroke(255,255,255);
    line(200,175,220,175);
    triangle(200,175,203,172,203,178);
    fill(255,255,255);
    fontB = loadFont("Tahoma-20.vlw");
    textFont(fontB, 20);
    text(""+-C, 282, 180);
    strokeWeight(1);
  }
  if (newton == newton1) {
    fill(255,255,255);
    fontB = loadFont("Tahoma-20.vlw");
    textFont(fontB, 20);
    text("0 NF", 282, 180);
  }
}

class Button {
  int x, y;
  int size;
  color basecolor, highlightcolor;
  color currentcolor;
  boolean over = false;
  boolean pressed = false;   
  void update() {
    if(over()) {
      currentcolor = highlightcolor;
    } 
    else {
      currentcolor = basecolor;
    }
  }

  boolean pressed() {
    if(over) {
      locked = true;
      return true;
    } 
    else {
      locked = false;
      return false;
    }
  }
  boolean over() { 
    return true;
  }
  boolean overCircle(int x, int y, int diameter) {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if(sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}

class CircleButton extends Button { 
  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
    icolor = 0;
    ihighlight = #FFFFFF;
    basecolor = 0;
  }
  boolean over() {
    if( overCircle(x, y, size) ) {
      over = true;
      return true;
    } 
    else {
      over = false;
      return false;
    }
  }
  void display() {
    stroke(255,255,255);
    fill(0);
    ellipse(x, y, size, size);
  }
}

