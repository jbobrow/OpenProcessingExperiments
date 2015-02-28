
//Bat Robot is not happy

PImage space;
Robot robot1;
Robot robot2;
Robot robot3;


void setup() {
  size (800, 400);
  space = loadImage("space.jpg");

  robot1 = new Robot(100, 120, 50, 240,240,240, 39,80,167, 150,150,150, 0.5);
  robot2 = new Robot(150, 120, 70, 93,32,83, 214,140,210, 143,86,209, 1);
  robot3 = new Robot(200, 120, 100, 209,178,112, 247,60,60, 108,75,63,0.2);

//fill(240,240,240); GREY 
//fill(93,32,83); PURPLE
//fill(209,178,112); BEIGE

//fill(39,80,167); BLUE
//fill(214,140,210); PINK
//fill(247,60,60); RED

//fill(150,150,150); LIGHT GREY
//fill(143,86,209); GREY-PURPLE
//fill(108,75,63); GREY-BROWN
}

void draw() {
  background(0);
  image(space, -100, -100, 1274, 796);

  robot1.move_vertically();
  robot1.display();
  robot1.left_box();
  robot1.right_box();
  
  robot2.move_horizontally();
  robot2.display();
  robot2.left_box();
  
  robot3.move_horizontally();
  robot3.move_vertically();
  robot3.display();
  robot3.right_box();
  
}

class Robot {
  float x;
  float y;
  float sz;
  float speed;
  int direction = 1;
  
  float a;
  float b;
  float c;
  float aa;
  float bb;
  float cc;
  float A;
  float B;
  float C;

  Robot (float x_in, float y_in, float sz_in, float a_in, float b_in, float c_in, float aa_in, float bb_in, float cc_in, float A_in, float B_in, float C_in, float speed_in) {
    x = x_in;
    y = y_in;
    sz = sz_in;
    a = a_in; //STRUCTURE COLOR
    b = b_in;
    c = c_in;
    aa = aa_in; //STUFF ON TOP COLOR
    bb = bb_in;
    cc = cc_in;
    A = A_in; //STROKE COLOR
    B = B_in;
    C = C_in;
    speed = speed_in;
}

  void display () {
    pushMatrix();
    translate(x, y);
    smooth();
    strokeJoin(BEVEL);
    
            // Overall Structure
    fill(a,b,c);
    stroke(A,B,C);

    //**RIGHT ARM**
    strokeWeight(sz/70);
    rect(x-sz/2, y+sz/10, sz/4, sz);
    arc (x-sz/2, y+sz/1.65, sz/4, sz/4, 0, PI);
    quad(x-sz/2.5, y+sz/1.35, x-sz/1.65, y+sz/1.35, x-sz/1.5, y+sz/1.1, x-sz/3, y+sz/1.1);
    
    //**LEFT ARM**
    strokeWeight(sz/70);
    rect(x+sz/2, y+sz/10, sz/4, sz);
    arc (x+sz/2, y+sz/1.65, sz/4, sz/4, 0, PI);
    quad(x+sz/2.5, y+sz/1.35, x+sz/1.65, y+sz/1.35, x+sz/1.5, y+sz/1.1, x+sz/3, y+sz/1.1);
    
    // **BODY**
    rectMode(CENTER);
    rect (x, y, sz, sz);
    
    // **FACE**
    strokeWeight(sz/70);
    ellipseMode(CENTER);
    arc(x, y-sz/2, sz, sz, PI, TWO_PI);
    
    
      //Stuff On Top
fill(aa,bb,cc);
    //** STUFF ON RIGHT ARM**
    noStroke();
    rect(x-sz/1.86, y+sz/10, sz/16, sz/2);
   
    // **STUFF ON LEFT ARM**
    noStroke();
    rect(x+sz/1.86, y+sz/10, sz/16, sz/2);
    
    // **STUFF ON BODY**
    noStroke();
    rect (x-sz/30, y-sz/4.5, sz/1.7, sz/15);
    rect (x-sz/30, y-sz/3.2, sz/1.7, sz/15);
    rect (x-sz/30, y-sz/2.5, sz/1.7, sz/15);
    rect (x-sz/30, y+sz/5, sz/5, sz/4);

    // *(STUFF ON FACE**
    noStroke();
    rect (x-sz/10+sz/5, y-sz/1.5, sz/12, sz/5);
    rect (x-sz/10+sz/3, y-sz/1.5, sz/12, sz/5);
    rect (x-sz/10-sz/5, y-sz/1.5, sz/12, sz/5);
    
    rect(x-sz/10, y-sz/1.5, sz/5, sz/5);
    quad(x+sz/10,y-sz/1.05, x+sz/75,y-sz/1.05, x+sz/15,y-sz/1.2, x+sz/4,y-sz/1.2);
    quad(x-sz/35,y-sz/1.05, x-sz/10,y-sz/1.05, x-sz/4,y-sz/1.2, x-sz/7,y-sz/1.2);
    fill(0);   
    ellipse(x-sz/10, y-sz/1.5, sz/8, sz/8);
    fill(209,53,58);
    ellipse(x-sz/30, y-sz/1.7, sz/15, sz/15);
  popMatrix();
  }

void move_horizontally() {
pushMatrix();
x += speed * direction;
x = constrain (x,0,390);
if (x==390 || x==0) {
  direction = -direction;
}
popMatrix();
}

void move_vertically() {
  pushMatrix();
y += speed * direction;
y = constrain (y,0,200);
if (y==200 || y==0) {
  direction = -direction;
}
 popMatrix();
}

void left_box (){
 pushMatrix();
  translate (x,y);
    fill(random(0,255), random(0,255), random(0,255));
    stroke(A,B,C);
    strokeWeight(1);
    rect (x-sz/4, y+sz/5, sz/7, sz/4);
    noFill();
    rect (x+sz/5.4, y+sz/5, sz/7, sz/4);
   popMatrix();
}

void right_box () {
 pushMatrix();
 translate (x,y);
    fill(random(0,255), random(0,255), random(0,255));
    stroke(A,B,C);
    strokeWeight(1);
    rect (x+sz/5.4, y+sz/5, sz/7, sz/4);
    noFill();
    rect (x-sz/4, y+sz/5, sz/7, sz/4);

  popMatrix();
}

}


