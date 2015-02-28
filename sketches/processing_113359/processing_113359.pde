
int counter = 0;
int time = 0;
ArrayList<Rect> rectZ;
int mode = 0;
boolean setBack = true;

void setup() {
  size(500, 550, P3D);
  background(255);   
  rectMode(CENTER);
  rectZ = new ArrayList<Rect>();
  createRects();
  frameRate(50);
  strokeWeight(3);
}

void draw(){
  
  // println (mouseX +"_______" + mouseY);
  background(255);
  
  // Timer
  counter++;
  if (counter == 50) { time++; counter = 0;}
  fill(10,10,10);
  text(time, 5, 20);
  String temp = ("Resetmode is: " + setBack);
  text(temp, 5, 35);




  int near = 100;
  //rect (mouseX, mouseY, near, near); // test Rectangle
  // checks if the mouseposition is close to the middle of the rect (int near is number of px close to mid)
  for (int i = 0; i < rectZ.size(); i++){
   if(((mouseX - near < rectZ.get(i).getMid().x)) && (mouseX + near > rectZ.get(i).getMid().x)) {
      if(((mouseY + near > rectZ.get(i).getMid().y)) && (mouseY - near < rectZ.get(i).getMid().y)) {
       doSMTH(i);
      } else if (setBack) rectZ.get(i).reset();
   } else if (setBack) rectZ.get(i).reset();
  }
  


  // shows all the rects
  for (int i = 0; i < rectZ.size(); i++) rectZ.get(i).display(); 


// 2 for loops = number on top of all
//   for (int i = 0; i < rectZ.size(); i++) rectZ.get(i).showNumber(i);
}




void keyPressed(){
 if       (key == 'r') setBack = !setBack;
 else if  (key == 'a') mode = 1;
 else if  (key == 's') mode = 2;
 else if  (key == 'd') mode = 3;
 else if  (key == 'f') mode = 4;
 else if  (key == 'g') mode = 5;
 else if  (key == 'h') mode = 6;
 else if  (key == 'j') {
   setBack = false;
   for (int i = 0; i < rectZ.size(); i++) rectZ.get(i).collideNow = !rectZ.get(i).collideNow;
   mode = -1;
 }
 else {
   mode = 0;
   for (int i = 0; i < rectZ.size(); i++) rectZ.get(i).reset(); 
 }
 
}



void doSMTH(int i){
  
  switch(mode) {
  case 0:
    rectZ.get(i).reset();
    break;
  case 1: 
    rectZ.get(i).changeSize();
    break;
  case 2: 
    rectZ.get(i).goAway();
    break;
  case 3: 
    rectZ.get(i).disappear();
    break;
  case 4: 
    rectZ.get(i).roundEr();
    break;
  case 5: 
    rectZ.get(i).colorRun();
    break;
  case 6: 
    rectZ.get(i).rotatOr((int) random(8));
    break;
  }
}
  
  

void createRects(){
  println("--- r _ TO TOGGLE RESET MODE ---");
  println("- - - - - - - - - - - -");
  println("--- a _ TO go Big ---");
  println("--- s _ TO Fetch ---");
  println("--- d _ TO Hide ---");
  println("--- f _ TO Go Round ---");
  println("--- g _ TO Blink ---");
  println("--- h _ TO Rotate ---");
  println("--- j _ for collision mode ---");
  println("--- Any other Key to reset ---");
  
color tmp;
int id = 0;
  /* Rect Constructor:
    Rect(int x, int y, int w, int h, int edge, int stroke, int z, color c){
      x y w h -> rect
      edge -> radius rounded edges,
      stroke -> stroke
      z -> zOrder,
      c -> color
  */

  // # # # # # orange # # # # # \\ 
  tmp = color(240,129,34);
  rectZ.add(new Rect(222, 82, 144, 144, 15, -1, 0, tmp, id++));
  rectZ.add(new Rect(135, 115, 70, 70, 15, 255, 0, tmp, id++));
  
  tmp = color(165,85,26);
  rectZ.add(new Rect(235, 45, 50, 50, 8, 255, 1, tmp, id++));
  
  
  // # # # # # red # # # # # \\ 
  tmp = color(167,26,24);
  rectZ.add(new Rect(210, 180, 100, 100, 15, 255, 1, tmp, id++));
  rectZ.add(new Rect(338, 163, 135, 135, 15, 255, 1, tmp, id++));
  
  
  // # # # # # yellow # # # # # \\ 
  tmp = color(249, 183, 32);
  rectZ.add(new Rect(325, 202, 144, 144, 15, 255, 3, tmp, id++));
  rectZ.add(new Rect(225, 120, 70, 70, 15, 255, 4, tmp, id++));
  
  tmp = color(114,80,17);
  rectZ.add(new Rect(303, 208, 35, 35, 8, -1, 4, tmp, id++)); 
  rectZ.add(new Rect(338, 238, 55, 55, 8, -1, 4, tmp, id++));
  
  
  // # # # # # green # # # # # \\ 
  tmp = color(140,191,67);
  rectZ.add(new Rect(130, 190, 100, 100, 15, 255, 2, tmp, id++));
  rectZ.add(new Rect(170, 275, 110, 110, 15, 255, 3, tmp, id++));
  rectZ.add(new Rect(228, 213, 55, 55, 15, 255, 4, tmp, id++));
  
  tmp = color(78,102,38);
  rectZ.add(new Rect(175, 260, 20, 20, 8, -1, 5, tmp, id++));
  rectZ.add(new Rect(193, 278, 35, 35, 8, -1, 5, tmp, id++));
  
  
  // # # # # # blue # # # # # \\ 
  tmp = color(21,117,185);
  rectZ.add(new Rect(270, 305, 90, 90, 15, 255, 2, tmp, id++));
  
  
  // # # # # # pink # # # # # \\ 
  tmp = color(203,11,122);
  rectZ.add(new Rect(272, 403, 130, 130, 15, -1, 0, tmp, id++));
  rectZ.add(new Rect(200, 340, 80, 80, 15, -1, 0, tmp, id++));
  rectZ.add(new Rect(350, 335, 130, 130, 15, -1, 0, tmp, id++));
  
  tmp = color(129,21,85);
  rectZ.add(new Rect(245, 380, 60, 60, 8, -1, 1, tmp, id++));
  rectZ.add(new Rect(275, 405, 30, 30, 8, -1, 1, tmp, id++));
  rectZ.add(new Rect(338, 333, 45, 45, 8, -1, 1, tmp, id++));
  rectZ.add(new Rect(365, 305, 30, 30, 8, -1, 1, tmp, id++));

  
  // # # # # # purple # # # # # \\ 
  tmp = color(50,30,75);
  rectZ.add(new Rect(258, 473, 25, 25, 8, -1, 2, tmp, id++));
  rectZ.add(new Rect(275, 490, 30, 30, 8, -1, 2, tmp, id++));
  
  tmp = color(88,39,123);
  rectZ.add(new Rect(270, 490, 80, 80, 8, -1, 1, tmp, id++));
  rectZ.add(new Rect(228, 525, 30, 30, 8, -1, 1, tmp, id++));
}
class Rect{
  int x, y, w, h, edge;
  int x1, y1, w1, h1, edge1;
  int move1, move2;
  color c, c1;
 
  int z;
  int stroke;
  int id;
  int rotation = 0;
  boolean rotateNow = false;
  boolean collideNow = false;
  float speed = random(3,8);
  
  Rect(int x, int y, int w, int h, int edge, int stroke, int z, color c, int id){
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
   
   this.c = c;
   this.c1 = c;
   
   
   // never changed
   this.stroke = stroke;
   this.z = z;
   this.id = id;
   createMoveNumber();
 }

void createMoveNumber(){
 move1 = (int) random(-3, 3);
 move2 = (int) random(-3, 3);
 if ((move1 == 0) || (move2 == 0)) createMoveNumber();
}
 
 void display() {
   
    pushMatrix();
    
    translate(0,0,z);
    if (stroke < 0) noStroke();
    else stroke(stroke);
    fill(c);
    
    if (rotateNow) { 
      pushMatrix();
      translate(x,y);
      rotate(radians(rotation));
      rotation += speed;
      rect(0, 0, w, h, edge);
      popMatrix();
    } else rect(x, y, w, h, edge);
    
    if (collideNow) collide(50);
    popMatrix();
 }
 
 
 
 void collide(int size){
  if (w == size){
    // big if = movement stops at the edge
    if (!((y + size/2 < height) && (y - size/2 > 0) && (x + size/2 < width) && (x - size/2 > 0))){
      
      move1 = move1 * -1;
      move2 = move2 *- 1;
    } 
     x = x + move1;
     y = y + move2;
     checkCollide();

} else if (w > size){
    this.w--;
    this.h--;
  } else {
    this.w++;
    this.h++; 
  }
 }
 
void checkCollide(){
 for (int i = 0; i < rectZ.size(); i++){
   if (i != id){
     if ((this.x == rectZ.get(i).x) || (this.y == rectZ.get(i).y)){
       createMoveNumber();
       // println("COLLISIONs  : " + this.id + " & " + i);  
   }  
 }
 } 
}

 void rotatOr(int speed){
   
   rotateNow = true;
   
//    float theta = PI*mouseX / width; 
//    rotate(theta);

//    w = h = 0; // removes old rect
//    pushMatrix();
//    translate(x,y);     // translate to x and y as 0 0
//    fill(c);            // because we create a new rect
//    rotate(radians(rotation));
//    rect(0, 0, w1, h1, edge1);    // 0 0 because translate b4
//    popMatrix();
//    rotation += speed;
   
 }
 
 
 
 void goAway() {
   if (mouseX < getMid().x) this.x = x1 + w1;
   else this.x = x1 - w1;
 }
 
 
 void changeSize(){
  this.w++;
  this.h++; 
 }
 
 
  void disappear(){
    if (w > 0) w--;
    if (h > 0) h--;
  }

  void colorRun(){ c = color(random(255)); }
  void roundEr(){  edge = edge + 1; }
 
 
  void reset(){
   this.x = x1;
   this.y = y1;
   this.w = w1;
   this.h = h1;
   this.edge = edge1;
   this.c = c1;
   rotation = 0;
   rotateNow = false;
   collideNow = false;
   createMoveNumber();
   

  }
 
 PVector getMid(){
  // return  (new PVector((x1 + (w1/2)), (y1 + (h1/2))));
   return  (new PVector(x1,y1));
 }
 
 
 
void showNumber(int i){
  
  pushMatrix();
  translate(0,0,z);
  fill(0);
  text(i, getMid().x, getMid().y);
  fill(c1);  
  popMatrix();
 
 }
 
}


