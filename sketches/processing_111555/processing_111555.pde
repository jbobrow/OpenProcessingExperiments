
//Li Cheuk Hin 53077582
//assignment 2
boolean ov=false;
int a=-200, b=610;
PImage img, img2;

void setup() {
  size(600, 600);
  img=loadImage("kingpig.png");
  img2=loadImage("pig.png");
}

void draw() {
  background(0, 150, 200, 70);
  //egg 1
  //if we point at the egg, the stroke would turn into black colour
  if (mouseX > 400 && mouseX < 500 && 
    mouseY > 335 && mouseY < 465) {
    ov=true;
    stroke(0); 
    fill(255);
  } 
  else {
    stroke(153);
    fill(255);
    ov=false;
  }
  ellipse(450, 400, 100, 130);
  //egg 2
  if (mouseX > 100 && mouseX < 200 && 
    mouseY > 335 && mouseY < 465) {
    ov=true;  
    stroke(0); 
    fill(255);
  } 
  else {
    stroke(153);
    fill(255);
    ov=false;
  }
  ellipse(150, 400, 100, 130);
  image(img, b, 200, 200, 200);
  image(img2, a, 200, 200, 200);
}
void mousePressed() {
  //if we pressed the egg in left or right
  //the pig and king pig will come out from left and right respectively

  //if we pressed the area out of the two eggs
  //those pig would move backward
  if (mouseX > 400 && mouseX < 500 && 
    mouseY > 335 && mouseY < 465) {
    b=b-20;
  } 
  else if (mouseX > 100 && mouseX < 200 && 
    mouseY > 335 && mouseY < 465) {
    a=a+20;
  }
  else { 
    a=a-30;
    b=b+30;
  }
}



