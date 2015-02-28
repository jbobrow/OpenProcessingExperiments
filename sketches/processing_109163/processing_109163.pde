
void setup() {
  //noLoop();  // draw wird nicht gelooped
  size(500, 500);
  background(255);
}

int counter = 0;
int counter2 = (int) random(10,50);

int angle = -35;  // org. angle

// needed for the rect size @ yellow method
int x = gimme5();
int xOld = x;
Rect rect1 = null; 



void draw(){
  
  // print mouse 
  // println (mouseX +"_______" + mouseY);
  
 
  strokeWeight(3);  
  rotate(radians(angle));
  translate(-200,80);
  frameRate(10);
  background(255);
  
 
 counter++;
 
  // rndly new angle (btw. 25 - 45°) after rndm time btw. 1 and 5 seconds
  if (counter == counter2) {
    angle = (int) random(-45, -25);
    counter2 = (int) random(10,50);
    counter = 0;
  }


  /** load org. image
  PImage img;
  img = loadImage("comp1.png");
  background (0);
  if (mousePressed)image(img,100, 0);
  */
  
  pink_();
  purple_();
  blue_();
  orange_();
  red_();
  yellow_();
  green_();
}



// int 0 - 255
int gimme(){
  return((int) random(0, 255));
}

// int 50 - 150
int gimme2(){
  return ((int) random(50, 150));  
 }
 
// int 10 - 50
int gimme3(){
  return((int) random(10, 50));
}

// int 80 - 200 (ONLY EVEN) !!!!! - not needed anymore
int gimme4(){
 return (2 * (int) random((80+1)/2, 200/2)); 
}

// int 80 - 200 (ALWAYS divisible with 3)
int gimme5(){
 int x = (int )random(80,200);
 if ( x % 3 == 0) return x;
 else return(gimme5());
}



void red_(){
  
  stroke(gimme());
  fill(gimme(), gimme(), gimme());
  rect(160, 130, 100, 100, 15);
  rect(270, 95, 135, 135, 15);
}



void orange_(){
  
  noStroke();
  fill(240,129,34);
  rect(150, 10, gimme2(), gimme2(), 15);

  stroke(255);
  rect(100, 80, gimme3(), gimme3(), 15);
  
  fill(165,85,26);
  rect(210, 20, gimme3(), gimme3(), 8);
}

void pink_(){

  noStroke();
  fill(gimme(),gimme(),gimme());
  rect(207, 338, 130, 130, 15);
  rect(160, 300, 80, 80, 15);
  rect(285, 270, 130, 130, 15);
  
  fill(gimme(),gimme(),gimme());
  rect(215, 350, 60, 60, 15);
  rect(260, 390, 30, 30, 8);
  
  rect(315, 310, 45, 45, 8);
  rect(350, 290, 30, 30, 8);
}


void green_(){
  
  stroke(255);
  fill(140, 191,67);
  rect(gimme2(), 220, 110, 110, 15);
  rect(200, (int) random(180, 200), 55, 55, 15);
  
  if ((int) random(2) == 1) rectMode(CENTER);
  fill(78,102,38);
  noStroke();
  rect(165, 250, 20, 20, 8);
  rect(175, 260, 35, 35, 8);
  rectMode(CORNER);
}



// found another way, therefore useless :(
class Rect{
  int x3; 
 
 Rect(int x1, int x2, int x3, int x4){
   this.x3 = x3;
   rect (x1,x2,x3,x4,15);
 } 
 
 int getWH() { return x3; }

}




void yellow_(){
  
  stroke(255);
  fill(random(255));
  
  // Only called 1 time at the start
  if (rect1 == null) rect1 = new Rect(235,130,x,x);
   
   // smooth rndm size change
  if (x < xOld) {
    rect1 = new Rect(235, 130, x, x);
    x = x + 3;
  } else if (x > xOld) {
    rect1 = new Rect(235, 130, x, x);
    x = x - 3;
  } else {
    rect1 = new Rect(235, 130, x, x);  // if not: one frame without the rect
    xOld = gimme5();
    println("new size: " + xOld);
}
 
  // smooth rndm size change #2
  fill(249,183,32);
  float y1 = random(0.1,1);
  rect(190, 85, x*y1, x*y1, 15); 
    
  noStroke();
  fill(114,80,17);
  rect(285, 190, x/3, x/3, 8); 
  rect(310, 210, x/2, x/2, 8);  
}




void blue_(){  
  
  strokeWeight(random(15));
  stroke(random(255));
  fill(21, 117,185);
  rect(225, 260, 90, 90, 15);
  
  strokeWeight(3);  
}

void purple_(){
  
  float s = random(30);
  fill(88,39,123);
  rect(230, 450, 80, 80, s);
  noStroke();  
  rect(213, 510, 30, 30, s);  
  fill(50,30,75);
  rect(245, 460, 25, 25, s);
  rect(260, 475, 30, 30, s);
  
}


