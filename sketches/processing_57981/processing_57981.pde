
float a;   //X Variable for ball 1
float b;   //Y Variable for ball 2
float da;  //X direction variable for ball 1
float db;  //Y direction variable for ball 1

float c;   //color variable for all balls

float x1;  //X variable for ball 2
float dx1; //X direction variable for ball 2
float y1;  //Y variable for ball 2
float dy1; //Y direction variable for ball 2

int  r = 25;//Radius of all balls

void setup() {    //Inital Setup function, only called once.
  size(900, 450); //sets size of screen
  
  smooth();       //Smoothes all shapes made
  
  noStroke();     //Deletes all stroke until strokeWeight code appears.
  
  a = 0;    //Sets Variable A
  b = 0;    //Sets Variable B
  da = 1;   //Sets Variable DA
  db = 1;   //Sets Variable DB
  
  c = 0;    //Sets  Varibale C
  
  r = 25;   //Sets Variable R
  
  x1 = 0;   //Sets Variable X1
  dx1 = 1;  //Sets Variable DX1
  y1 = 0;   //Sets Variable Y1
  dy1 = 1;  //Sets Varible DY1
}                //End Intital Setup Function

void draw() {            //Draw function, called ∞ times.
  
  background (255);      //Wipes screen at start of EVERY call.
  
  fill(0);               //Sets all fill to black.
  
  text("LA Lasers", width*1/4,60); //Positions Text.
  text( "Click to Shoot the Balls",width/2,60); //Positions text
  text( "Shoot Me", a-r, b); // Text at a-r, b
  
  fill(random(255),random(255),random(255));   //Sets fill to 255, Variable a-10,a-c
  ellipse(a,b, r*2, r*2); //Ball 1
  
  fill(random(128,255));  //Sets fill
  
  text("LA Lasers", width*1/4,60); //Positions Text.
  text( "Click to Shoot the Balls",width/2,60); //Positions text
  
  fill(random(128,255));  //Sets fill
  text( "Shoot Me", a-r, b); // Text at a-r, b
  
  a += 5*da;
  b += 9*db;
  if (a == width-25) {
    da = -1;
  }
  if (a <= 25) {
    da = +1;
  }
  if (b >= height-25) {
    db = -1;
  }
  if (b <= 25) {
    db = +1;
  }
  stroke(c);
  noFill();
  ellipse(mouseX,mouseY,30,30);
  strokeWeight(1);
  stroke(0);
  line(mouseX-20,mouseY,mouseX+20,mouseY);
  line(mouseX, mouseY-20,mouseX,mouseY+20);
  noStroke();
  if (mousePressed == true) {
    strokeWeight(3);
    stroke(255, 0, 0,128);
    line(mouseX-5, mouseY-5, 0, 0);
    stroke(0, 255, 0,128);
    line(mouseX+10, mouseY, width, height);
    stroke(0, 255, 0,128);
    line(mouseX-10, mouseY, 0, height);
    noStroke();
    fill(233,128,200);
    ellipse(mouseX,mouseY,30,30);
    stroke(0);
    strokeWeight(1);
    line(mouseX-20,mouseY,mouseX+20,mouseY);
    line(mouseX,mouseY+20,mouseX,mouseY-20);
  if (mouseX > (a-r) && mouseX < (a+r) && mouseY > (b-r) && mouseY < (b+r)) {
    a = (random (r, width));
    b = (random (r, height));
    }
  }
  strokeWeight(1);
  line(mouseX-20,mouseY,mouseX+20,mouseY);
  line(mouseX,mouseY+20,mouseX,mouseY-20);
  noStroke();
}

