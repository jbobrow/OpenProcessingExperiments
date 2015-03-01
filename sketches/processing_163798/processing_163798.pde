
PImage img1;
PImage img2;

float ellipseX;
float ellipseY;
float x;
float y;

//color of ballon
float a;
float b;
float c;

//accelorator
float ac;

//event
boolean button1 = false; //click ballon

//error
int error;

void setup() {
  size(600, 800);
  x=width/2;
  y=height/4;
  ac=3;
  img1 = loadImage("bart1.png");
  img2 = loadImage("bart2.png");
}
void draw() {
  ellipseX=x+13;
  ellipseY=700-y;

  //bg
  colorMode(HSB, 360, 100, 100);
  background(200, 50, 100);



  if (button1) {
    x=x;
    y=y-18;//ballon poped and Bart fell off
    ellipseX=-100;
    ellipseY=-100;
    image(img2, x, 800-y);
    fill(130, 0, 0);
    textSize(32);
    text("HAHA GOODBYE BART!", width/2, height/2);
  } else {
    x = x+ac;
    y = y+3;
    for (int i = 10; i < 600; i = i+20) {
      for (int j = 10; j < (ellipseY*2)/3; j = j+20) {
        fill(0, 0, 100);
        noStroke();
        ellipse(i, j, 10, 10);
      }
    }
    image(img1, x, 800-y);
    textSize(18);
    textAlign(CENTER);
    fill(0, 0, 0);
    text("click the balloon", width/2, 30);
    textSize(32);
    fill(0, 100, 100);
    text("NO!: "+error, width/2, 70);
  }




  if ((x>width-150)||x<100) {
    ac=-ac;
  }
  if (y>height) {
    y = 0;
  }





  //shaking bart!
  if ((mouseX>x)&&(mouseX<x+118)&&(mouseY>(800-y))&&(mouseY<(1037-y))) {
    x=x+random(-10, 10);
  }

  //balloon

  pushMatrix();
  translate(ellipseX, ellipseY);
  a = random(30, 35);
  b = random(255);
  c = random(255);
  //balloon
  stroke(255, 0, 0);
  strokeWeight(1);
  fill(a, b, c); //random color of ballon
  ellipse(0, 0, 100, 100);
  //line
  stroke(255, 0, 0);
  strokeWeight(2);
  line(-3, 150, -3, 50);
  popMatrix();
}

void mousePressed() {
  if (sqrt(sq(mouseX-ellipseX)-sq(mouseY-ellipseY))<=50) {
    button1=true;
  } else {
    error+=1;
  }
}



