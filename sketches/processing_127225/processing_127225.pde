
/*@pis preload="apple2.png";*/
int i = 250;
float a, b, c;
int speed =5;
PImage img;
PFont hello;


void setup() {   
  hello = loadFont("SWIsot3-48.vlw"); 
  size (450, 450);
  background(0);
  stroke(255);
  noFill();
  img = loadImage("apple2.png");
  textAlign(CENTER);
  a = 0;
  b = 0;
  c = 0;
}


void draw() {
  fill(0, 0, 0,40);
  rect(0, 0, width, height);
  if (mousePressed == true) {
    for (int r = 3; r<50; r+=40) {
      fill(a, b, c, 40);
      stroke(255-r);
      strokeWeight(1);
      ellipse(mouseX, mouseY, r+speed, r+speed);
    }
    
    for (int r = 10; r<40; r+=20) {
      fill(a, b, c ,0);
      stroke(a,b,c,100);
      strokeWeight(3);
      speed += 13;
      ellipse(mouseX, mouseY, r+speed, r+speed);
    }

    //end for
  } //end if

  if (mousePressed == false) {
    speed = 0;
  }
  image(img,0,0);
    textFont(hello, 60); 
   fill(255);
  text("Apple",width/2, 430);
}
void mousePressed() {
  a = random(255);
  b = random(255);
  c = random(255);
}





