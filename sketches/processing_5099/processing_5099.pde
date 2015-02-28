
class RoundRectButton {

  color col;
  color overCol;
  color pressCol;
  boolean over = false;
  boolean pressed = false;

  //rcRect variables
  int rad, sX, sY, pX, pY;

  //rect1 variables
  int r1sX, r1sY, r1pX, r1pY;

  //rect2 variables
  int r2sX, r2sY, r2pX, r2pY;

  //rect3 variables
  int r3sX, r3sY, r3pX, r3pY;


  //arc1 variables
  int arc1pX, arc1pY, arc1sX, arc1sY;
  float arc1st, arc1sp;

  //arc2 variables
  int arc2pX, arc2pY, arc2sX, arc2sY;
  float arc2st, arc2sp;

  //arc3 variables
  int arc3pX, arc3pY, arc3sX, arc3sY;
  float arc3st, arc3sp;

  //arc4 variables
  int arc4pX, arc4pY, arc4sX, arc4sY;
  float arc4st, arc4sp;

  // Constructor
  RoundRectButton (int radius, int sizeX, int sizeY, int posX, int posY, color c, color o, color p){

    //rcRect fields
    rad = radius;
    sX = sizeX;
    sY = sizeY;
    pX = posX;
    pY = posY;
    col = c;
    overCol = o;
    pressCol = p;

    // rectangle 1 fields
    r1pX = posX;
    r1pY = posY + radius;  
    r1sX = sizeX;
    r1sY = sizeY-2*radius;

    // rectangle 2 fields
    r2pX = posX + radius;
    r2pY = posY;
    r2sX = sizeX-2*radius;
    r2sY = radius;

    // rectangle 3 fields
    r3pX = posX + radius;
    r3pY = posY + sizeY - radius;
    r3sX = sizeX-2*radius;
    r3sY = radius;

    // arc1 fields
    arc1pX = posX + radius;
    arc1pY = posY + radius;
    arc1sX = radius*2;
    arc1sY = radius*2;
    arc1st = PI;
    arc1sp = TWO_PI-PI/2;   

    // arc2 fields
    arc2pX = posX + sizeX - radius;
    arc2pY = posY + radius;
    arc2sX = radius*2;
    arc2sY = radius*2;
    arc2st = TWO_PI-PI/2;
    arc2sp =  TWO_PI;   

    // arc3 fields
    arc3pX = posX + radius;
    arc3pY = posY + sizeY - radius;
    arc3sX = radius*2;
    arc3sY = radius*2;
    arc3st = PI/2;
    arc3sp =  PI;   

    // arc4 fields
    arc4pX = posX + sizeX - radius;
    arc4pY = posY + sizeY - radius;
    arc4sX = radius*2;
    arc4sY = radius*2;
    arc4st = 0;
    arc4sp =  PI/2;   
  }

  void update(){
    if ((mouseX >= r1pX) && (mouseX <= r1pX + r1sX) && (mouseY >= r1pY) && (mouseY <= r1pY + r1sY) || 
      (mouseX >= r2pX) && (mouseX <= r2pX + r2sX) && (mouseY >= r2pY) && (mouseY <= r2pY + r2sY) || 
      (mouseX >= r3pX) && (mouseX <= r3pX + r3sX) && (mouseY >= r3pY) && (mouseY <= r3pY + r3sY) ||
      (dist(mouseX,mouseY,arc1pX,arc1pY)< rad) ||
      (dist(mouseX,mouseY,arc2pX,arc2pY)< rad) ||
      (dist(mouseX,mouseY,arc3pX,arc3pY)< rad) ||
      (dist(mouseX,mouseY,arc4pX,arc4pY)< rad)) {

     // println("over");
      over = true; 
    }
    else{
    //  println("not over");
      over = false;
    }
  }

  boolean press() {
    if (over == true){
      pressed = true;
      return true;
    }
    else{
      return false;
    }
  }

  void release(){
    pressed = false;
  }



  void rcRect(int rad, int sX, int sY, int posX, int pY){

    // Central section
    rect(r1pX, r1pY, r1sX, r1sY);
    // Upper rect
    rect(r2pX, r2pY, r2sX, r2sY);
    // Bottom rect
    rect(r3pX, r3pY, r3sX, r3sY);
    // Left top corner
    arc(arc1pX, arc1pY, arc1sX, arc1sY, arc1st, arc1sp);
    // Right top corner
    arc(arc2pX, arc2pY, arc2sX, arc2sY, arc2st, arc2sp);
    // Left bottom corner
    arc(arc3pX, arc3pY, arc3sX, arc3sY, arc3st, arc3sp);
    // Right bottom corner
    arc(arc4pX, arc4pY, arc4sX, arc4sX, arc4st, arc4sp); 
  }

  void display() {
    if (pressed == true){
      fill(pressCol);
    }
    else if (over == true){
      fill(overCol);
    }
    else{
      fill(col);
    } 
    noStroke();   
    rcRect(rad, sX, sY, pX, pY);
  }









}






