
//Declare
Rubiks [] rubiksCollection = new Rubiks[100];


void setup() {
  size(800, 200);
  smooth();
  noLoop();
  noStroke();
  
  //Initialize
 for( int i=0; i< rubiksCollection.length ; i++){ 
 rubiksCollection[i] = new Rubiks(random(0, width), random(0, 200));
}
}

void draw() {

  background(230, 147, 141);
 //Call Function 
  for(int i=0; i<rubiksCollection.length ; i++) {
  rubiksCollection[i].run();
 
  }
  
  
}
void mousePressed(){
  redraw();
}
  //drawCube(xpos, ypos, green);
  //base "black"


class Rubiks {

  //Data
  float x=0;
  float y=0;
  float r;
  float s;
  float t;
  color c;
  color c2;
  color c3;
  float speedX = 20;
  float speedY = 10;
  
  //Constructor
  Rubiks(float _x, float _y) {
    c= color(random(255), random(255), random(255));
    c2= color(random(255), random(255), random(255));
    c3= color(random(255), random(255), random(255));
    x= _x;
    y= _y;
  }


  //Function

  void run() {
    blkCube();
    C1();
    C2();
    C3();
    C4();
    C5();
    C6();
    C7();
    C8();
    C9();
    move();
    bounce();
  }

  void blkCube() {
    rect(x, y, 90, 90);
    fill(0);
  }
///////1st row
  void C1() {
    fill(c);
    rect(x+3, y+3, 25, 25);
  }

  void C2() {
    fill(c);
    rect((x+3)+30, y+3, 25, 25);
  }

  void C3() {
    rect((x+3)+60, y+3, 25, 25);
    noStroke();
  }
///////////2nd row
  void C4() {
    fill (c2);
    rect(x+3, (y+3)+ 30, 25, 25);
  }
  void C5() {
    fill(c2);
    rect((x+3)+ 30, (y+3)+ 30, 25, 25);
  }
  void C6() {
    fill(c2);
    rect((x+3)+ 60, (y+3)+ 30, 25, 25);
  }
  ///////3rd row
  void C7() {
    fill(c3);
    rect(x+3, (y+3) + 60, 25, 25);
  }
  
 void C8(){
    fill(c3);
    rect((x+3) + 30, (y+3) + 60, 25, 25);
}
void C9(){
  fill(c3);
  rect((x+3) + 60,  (y+3) + 60, 25, 25); 
}
  void move() {
    x+= speedX;
    y+= speedY;
  }
void bounce() {
   if(x> width){
   speedX = speedX * -1;
  } 
   if(x< 0){
   speedX = speedX * -1;
  } 
   if(y> height){
   speedY = speedY * -1;
  } 
   if(y> 0){
   speedY = speedY * -1;
  } 
}
}

/* x=90;
 y=90;
 r= 240;
 s= 255;
 t= 0;
 */


