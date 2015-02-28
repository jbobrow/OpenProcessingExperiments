
int counter = 0;
int counter2 = (int) random(10,50);

boolean rndm = false;
int angle = -35;  // org. angle

// needed for the rect size @ yellow method
int x = gimme5();
int xOld = x;

ArrayList<Rect> rectZ;


int mode = 0;


void setup() {
  size(500, 550);
  background(255);
  rectZ = new ArrayList<Rect>();
  createRects();
}




void draw(){
  
  // print mouse 
  // println (mouseX +"_______" + mouseY);

 
  strokeWeight(3);  
  frameRate(50);
  background(255);
  
 
  // rndly new angle (btw. 25 - 45°) after rndm time btw. 1 and 5 seconds
  if (rndm) {
    counter++;
    if (counter == counter2) {
     // angle = (int) random(-45, -25);
      counter2 = (int) random(10,50);
     // translate(-200,80);
      counter = 0;
    }
  } else { 
    // rotate(radians(-35));
    // translate(-200,80);
  }


  // checks if the mouseposition is close to the moddle of the rect
  for (int i = 0; i < rectZ.size(); i++){
   if(((mouseX - 80 < rectZ.get(i).getMid().x)) && (mouseX + 80 > rectZ.get(i).getMid().x)) {
     if(((mouseY + 80 > rectZ.get(i).getMid().y)) && (mouseY - 80 < rectZ.get(i).getMid().y)) {
       doSMTH(i);
      } else rectZ.get(i).reset();
    } else rectZ.get(i).reset();
  }
  
    
    
pink_();
purple_();
blue_();
orange_();
red_();
yellow_();
green_();  

}




void keyPressed(){
  rndm = false;
 if       (key == 'q') mode = 1;
 else if  (key == 'w') mode = 2;
 else if  (key == 'e') mode = 3;
 else if  (key == 'r') mode = 4;
 else mode = 0;
 
}



void doSMTH(int i){
 
  switch(mode) {
  case 0:
    rectZ.get(i).reset();
    break;
  case 1: 
    rndm = true;
    break;
  case 2: 
    rectZ.get(i).changeSize();
    break;
  case 3: 
    rectZ.get(i).goAway();
    break;
   case 4: 
    rectZ.get(i).disappear();
    break;   
  }
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

// int 80 - 200 (ALWAYS divisible with 3)
int gimme5(){
 int x = (int )random(80,200);
 if ( x % 3 == 0) return x;
 else return(gimme5());
}


void red_(){
  
  if (rndm) {stroke(gimme());
    fill(gimme(), gimme(), gimme());
    rect(160, 130, 100, 100, 15);
    rect(270, 95, 135, 135, 15);
  } else {
    stroke(255);
    fill(167,26,24);
    rect(rectZ.get(0).x, rectZ.get(0).y, rectZ.get(0).w, rectZ.get(0).h, rectZ.get(0).edge);
    rect(rectZ.get(1).x, rectZ.get(1).y, rectZ.get(1).w, rectZ.get(1).h, rectZ.get(1).edge);
  }
}




void orange_(){
  noStroke();
  fill(240,129,34);
  if (rndm) {
    rect(150, 10, gimme2(), gimme2(), 15);
    stroke(255);
    rect(100, 80, gimme3(), gimme3(), 15);
    fill(165,85,26);
    rect(210, 20, gimme3(), gimme3(), 8);
  } else {
    fill(240,129,34);
    rect(rectZ.get(2).x, rectZ.get(2).y, rectZ.get(2).w, rectZ.get(2).h, rectZ.get(2).edge);
    stroke(255);
    rect(rectZ.get(3).x, rectZ.get(3).y, rectZ.get(3).w, rectZ.get(3).h, rectZ.get(3).edge);
    fill(165,85,26);
    rect(rectZ.get(4).x, rectZ.get(4).y, rectZ.get(4).w, rectZ.get(4).h, rectZ.get(4).edge);
    }  
}



void pink_(){

  noStroke();
  if (rndm) fill(gimme(),gimme(),gimme());
  else fill(203,11,122);
  rect(rectZ.get(5).x, rectZ.get(5).y, rectZ.get(5).w, rectZ.get(5).h, rectZ.get(5).edge);
  rect(rectZ.get(6).x, rectZ.get(6).y, rectZ.get(6).w, rectZ.get(6).h, rectZ.get(6).edge);
  rect(rectZ.get(7).x, rectZ.get(7).y, rectZ.get(7).w, rectZ.get(7).h, rectZ.get(7).edge);
  
  if (rndm) fill(gimme(),gimme(),gimme());
  else fill(129,21,85);
  rect(rectZ.get(8).x, rectZ.get(8).y, rectZ.get(8).w, rectZ.get(8).h, rectZ.get(8).edge);
  rect(rectZ.get(9).x, rectZ.get(9).y, rectZ.get(9).w, rectZ.get(9).h, rectZ.get(9).edge);
  rect(rectZ.get(10).x, rectZ.get(10).y, rectZ.get(10).w, rectZ.get(10).h, rectZ.get(10).edge);
  rect(rectZ.get(11).x, rectZ.get(11).y, rectZ.get(11).w, rectZ.get(11).h, rectZ.get(11).edge);
}


void green_(){
  
  stroke(255);
  fill(140, 191,67);
  
  if(rndm) {
    rect(gimme2(), 220, 110, 110, 15);
    rect(200, (int) random(180, 200), 55, 55, 15);
    if ((int) random(2) == 1) rectMode(CENTER);
  } else {
      rect(rectZ.get(12).x, rectZ.get(12).y, rectZ.get(12).w, rectZ.get(12).h, rectZ.get(12).edge);
      rect(rectZ.get(13).x, rectZ.get(13).y, rectZ.get(13).w, rectZ.get(13).h, rectZ.get(13).edge);
      rect(rectZ.get(14).x, rectZ.get(14).y, rectZ.get(14).w, rectZ.get(14).h, rectZ.get(14).edge); 
  }
  fill(78,102,38);
  noStroke();
  rect(rectZ.get(15).x, rectZ.get(15).y, rectZ.get(15).w, rectZ.get(15).h, rectZ.get(15).edge);
  rect(rectZ.get(16).x, rectZ.get(16).y, rectZ.get(16).w, rectZ.get(16).h, rectZ.get(16).edge);
  rectMode(CORNER);
}

void yellow_(){
  
  stroke(255);
  if (rndm) {
    fill(random(255));
     // smooth rndm size change
    if (x < xOld) {
      rect(235, 130, x, x, 15);
      x = x + 3;
    } else if (x > xOld) {
      rect(235, 130, x, x, 15);
      x = x - 3;
    } else {
      rect(235, 130, x, x);  // if not: one frame without the rect
      xOld = gimme5();
      // println("new size: " + xOld);
    }
  } else {
    fill(249,183,32);
    rect(rectZ.get(17).x, rectZ.get(17).y, rectZ.get(17).w, rectZ.get(17).h, rectZ.get(17).edge); 
  }
    
 
  // smooth rndm size change #2
  fill(249,183,32);
  if (rndm) {
    float y1 = random(0.1,1);
    rect(190, 85, x*y1, x*y1, 15); 
    noStroke();
    fill(114,80,17);
    rect(285, 190, x/3, x/3, 8); 
    rect(310, 210, x/2, x/2, 8);
  } else {
    rect(rectZ.get(18).x, rectZ.get(18).y, rectZ.get(18).w, rectZ.get(18).h, rectZ.get(18).edge);  
    noStroke();
    fill(114,80,17);
    rect(rectZ.get(19).x, rectZ.get(19).y, rectZ.get(19).w, rectZ.get(19).h, rectZ.get(19).edge); 
    rect(rectZ.get(20).x, rectZ.get(20).y, rectZ.get(20).w, rectZ.get(20).h, rectZ.get(20).edge);  
  }  
}




void blue_(){  
  
  if (rndm) {
    strokeWeight(random(15));
    stroke(random(255));
  } else {
    strokeWeight(3); 
     stroke(255); 
  }
  fill(21, 117,185);
  rect(rectZ.get(21).x, rectZ.get(21).y, rectZ.get(21).w, rectZ.get(21).h, rectZ.get(21).edge); 
  
  strokeWeight(3);  
}

void purple_(){
  if (rndm) fill(0, random(255), 0);
  else fill(88,39,123);
  rect(rectZ.get(22).x, rectZ.get(22).y, rectZ.get(22).w, rectZ.get(22).h, rectZ.get(22).edge); 
  noStroke();  
  rect(rectZ.get(23).x, rectZ.get(23).y, rectZ.get(23).w, rectZ.get(23).h, rectZ.get(23).edge); 
  fill(50,30,75);
  rect(rectZ.get(24).x, rectZ.get(24).y, rectZ.get(24).w, rectZ.get(24).h, rectZ.get(24).edge); 
  rect(rectZ.get(25).x, rectZ.get(25).y, rectZ.get(25).w, rectZ.get(25).h, rectZ.get(25).edge); 
  
}



void createRects(){

  println("--- q _ GO RANDOM ---");
  println("--- w _ TO BE BRAVE ---");
  println("--- e _ TO FETCH ---");
  println("--- r _ TO HIDE ---");
  println("--- Any other Key to reset ---");
  rectZ.add(new Rect(160, 130, 100, 100, 15));
  rectZ.add(new Rect(270, 95, 135, 135, 15));
  rectZ.add(new Rect(150, 10, 143, 143, 15));
  rectZ.add(new Rect(100, 80, 70, 70, 15));
  rectZ.add(new Rect(210, 20, 50, 50, 8));
  rectZ.add(new Rect(207, 338, 130, 130, 15));
  rectZ.add(new Rect(160, 300, 80, 80, 15));
  rectZ.add(new Rect(285, 270, 130, 130, 15));
  rectZ.add(new Rect(215, 350, 60, 60, 15));
  rectZ.add(new Rect(260, 390, 30, 30, 8));
  rectZ.add(new Rect(315, 310, 45, 45, 8));
  rectZ.add(new Rect(350, 290, 30, 30, 8));
  rectZ.add(new Rect(80, 140, 100, 100, 15));
  rectZ.add(new Rect(115, 220, 110, 110, 15));
  rectZ.add(new Rect(200, 185, 55, 55, 15));
  rectZ.add(new Rect(165, 250, 20, 20, 8));
  rectZ.add(new Rect(175, 260, 35, 35, 8));
  rectZ.add(new Rect(235, 130, 143, 143, 15));
  rectZ.add(new Rect(190, 85, 70, 70, 15)); 
  rectZ.add(new Rect(285, 190, 35, 35, 8)); 
  rectZ.add(new Rect(310, 210, 55, 55, 8));
  rectZ.add(new Rect(225, 260, 90, 90, 15));
  rectZ.add(new Rect(230, 450, 80, 80, 8)); 
  rectZ.add(new Rect(213, 510, 30, 30, 8));  
  rectZ.add(new Rect(245, 460, 25, 25, 8));
  rectZ.add(new Rect(260, 475, 30, 30, 8));
}
class Rect{
  int x, y, w, h, edge;
  int x1, y1, w1, h1, edge1;
  
  boolean toggle = false;
 
  Rect(int x, int y, int w, int h, int edge){
   this.x = x;
   this.x1 = x;
   
   this.y = y;
   this.y1 = y;
   
   this.w = w;
   this.w1 = w;
   
   this.h = h;
   this.h1 = h;
   
   this.edge = edge;
   this.edge1 = edge;
   
   
   
   rect (x, y, w, h, edge);
 }

 
 void setSize(int plus) {

 }
 
 
 void goAway() {
   if (mouseX < getMid().x) this.x = x1 + w1/2;
   else this.x = x1 - w1;
 }
 
 
 
 void changeSize(){
  this.x--;
  this.y--;
  this.w++;
  this.h++ ; 
 }
 



void reset(){
 this.x = x1;
 this.y = y1;
 this.w = w1;
 this.h = h1;
 this.edge = edge1;
  
  
}

void disappear(){
  this.x = -1000;
  this.y = -1000;
}



 
 PVector getMid(){
   return  (new PVector((x1 + (w1/2)), (y1 + (h1/2))));

 }
 
}


