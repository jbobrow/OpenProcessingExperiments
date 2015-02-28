
int winsizex = 400;
int winsizey = 400;
float midx = winsizex/2;
float midy = winsizey/2;
float transxpos = 0; //camera view horizontal
float transypos = 0; //camera view vertical
int ballFollow = -1; //id of ball being followed
int ballhit = 0; //used for turning on/off collisions
int ballNum = winsizex/40;//number of balls
int newBall = 0;
float spring = 0.05;
float collisions = 1;//used for polygon fading
circle[] circles = new circle[ballNum]; //creates array of balls, starting with a set number
diamond polygon1; //creates the polygon


void setup() {
  
  smooth();
  frameRate(1000);
  background(255); 
  size(winsizex, winsizey);
  polygon1 = new diamond();
 baller();//loads in array of balls with randomised appearance
}

void baller() {
  for (int i = 0; i < ballNum; i++){
    circles[i] = new circle(color(
    random(0,255), //red value
    random(0,255), //green value
    random(0,255)),//blue value
    random(12.5, 50),//ball size
    random(25,175),  //x location
    random(25,175),  //y location
    random(-.3,.3),  //x speed
    random(-.3,.3),  //y speed
    i, circles);     // ID used for collision
}

}

void draw() {
   
  pushMatrix();
  cam();//chooses camera location depending of selected ball
  translate(transxpos, transypos);
  polygon1.display(); 
  
  for (int i = 0; i < ballNum; i++){
    circles[i].display();//shows balls
    circles[i].collision();//initialises collisions
  }
 
  popMatrix();
  

}
void cam() { //changes viewpoint to chosen ball
  if( ballFollow == -1){
 
  transxpos=0;
  transypos=0;
  return;
}
  else {
    transxpos =-1*(circles[ballFollow].xps-midx);
    transypos =-1.*(circles[ballFollow].yps-midy);
  }

  
}
class circle {
  color c;
  float sz;
  float xps;
  float yps;
  float xsp;
  float ysp;
  int ball;
  circle[] others;//used for collisions between balls
  float hit;
  float maxspd = winsizey/400;
  float minspd = winsizey/400*-1;

  circle(color clr, float size, float xposition, float yposition, float xspeed, float yspeed, int idin, circle[] oin) {
    c = clr;
    sz = size/200*winsizey;
    xps = xposition/200*winsizex;
    yps = yposition/200*winsizey;
    xsp = xspeed/200*winsizey;
    ysp = yspeed/200*winsizey; // changes appearance in relation to windowsize
    ball = idin;
    others = oin;
    hit = sz/2;
  }

  void display() {
    stroke(0, 0);
    fill(c);
    ellipseMode(CENTER);
    ellipse(xps, yps, sz, sz);

    move();
  }
  void move() {

    if (yps > winsizey - hit||yps < 0 + hit) {
      ysp=ysp*-1;
    }
    if (xps > winsizex - hit||xps < 0 + hit) {
      xsp=xsp*-1;
    }
    xps=xps+xsp;
    yps=yps+ysp;
    if (ballhit < 2) {                                //from here to...
      for (int i = ball; i < ballNum; i++) {
        float dx = mouseX - xps;
        float dy = mouseY - yps;
        float distance = sqrt(dx*dx + dy*dy);
        float minDist = hit;
        if (distance < minDist) {
          float angle = atan2(dy, dx);
          float targetx = xps + cos(angle) * minDist;
          float targety = yps + sin(angle) * minDist;
          float ax = (targetx - mouseX) * spring;
          float ay = (targety - mouseY) * spring;
          xsp -= ax;
          ysp -= ay;
          if (mousePressed == true){
            xps = mouseX;
            yps = mouseY;                              //...here is used for collision with mouse
          }
        }
      }


      if (xsp > maxspd) {  //speed limits
        xsp = maxspd;
      }
      if (xsp < minspd) {
        xsp = minspd;
      }
      if (ysp > maxspd) {
        ysp = minspd;
      }
      if (ysp < minspd) {
        ysp = minspd;
      }
    }
  }

  void collision() {
    if (ballhit == 1) {                                   //collisions between balls
      for (int i = ball + 1; i < ballNum; i++) {
        float dx = others[i].xps - xps;
        float dy = others[i].yps - yps;
        float distance = sqrt(dx*dx + dy*dy);            //finds distance between centres of every ball
        float minDist = others[i].hit + hit;             //finds hitting point of balls
        if (distance < minDist) {
          float angle = atan2(dy, dx);                   //finds angle of rebound
          float targetx = xps + cos(angle) * minDist;    //gets xdirection of rebound
          float targety = yps + sin(angle) * minDist;    //gets ydirection of rebound
          float ax = (targetx - others[i].xps) * spring;  //gets speed of horizontal rebound
          float ay = (targety - others[i].yps) * spring;  //gets speed of vertical rebound
          xsp -= ax;  //sends circle 
          ysp -= ay;  //away from others
          others[i].xsp += ax; //sends others
          others[i].ysp += ay; //away from itself
         // collisions += .5;    //used for polygon fading
        }
      }
    }
  }
}
class diamond {
  float shapesz;
  float rotation;
  int sides;
  float wgt;
  float weight;
  int transtemp;
  float transparency;

  diamond() {
    shapesz = winsizey / 3;
    sides = 4;
    wgt=10;
    weight = wgt/200*winsizey;
    transtemp = 255;  // gets lower with each collision of balls, makes polygon fade
    
  }


  void display() {
    pushMatrix();
    background(255);//resets background after rotations
    translate(midx, midy);//goes to middle for rotation
    noFill();
    transparency = transtemp-collisions;
    stroke(255, 0, 0, transparency);
    strokeWeight(weight);
    polygon(sides, 0, 0, shapesz, rotation);//used to create shape
    popMatrix();
  }
}

void RotateRight() {
  polygon1.rotation=polygon1.rotation+.5;//rotates polygon clockwise
}

void RotateLeft() {
  polygon1.rotation=polygon1.rotation-.5;//rotates polygon anti-clockwise
}

void keyPressed() {
  if (key == 'd'||key =='D') {  //d key event
    RotateRight();
  }

  if (key == 'a'||key == 'A') { //a key event
    RotateLeft();
  }


  if (key == 'w'||key == 'W') { //w key event
    if (polygon1.sides<15) {    //polygon side limit
      polygon1.sides++;         //increases amount of polygon sides
    }
  }
  if (key == 's'||key == 'S') { //s key event
    if (polygon1.sides>3)       //polygon side limit
      polygon1.sides--;         //reduces amount of polygon sides
  }
  if (key == 'r'|| key == 'R') {
    if (ballFollow == ballNum -1) {  //changes viewport to centre if has cycled through all circles
      ballFollow = -1;
    }
    else if (ballFollow < ballNum - 1) //cycles up through circles selecting one for camera to follow
    ballFollow++;
  }

  if (key == 'f'|| key == 'F') {
    if (ballFollow == -1){         //changes viewport to centre if has cycled through all circles
      ballFollow = ballNum -1;
    }
    else if (ballFollow > -1){     //cycles down through circles selecting one for camera to follow
    ballFollow--;
  }
  }
  
  if (key == '0') {
    ballFollow=-1;                 //changes viewport to centre
  }
  if ( key == 'e'|| key == 'E'){
    collisions = 1;                //resets polygon transparency
  }
  
 

  if (key == 'q'|| key == 'Q') {
    if (ballhit == 0) {
      ballhit = 1;                //toggles circle collisions
      }
    else { 
      ballhit = 0;
    }
  }
}

void mousePressed(){                 //disregard this, failed attempt to increase ball number at mouse click
  if (newBall < 20){
  newBall++;
 circle[] circles = new circle[newBall];
  }
 
}
 




void polygon(int n, float cx, float cy, float r, float rot) {    //used to create polygons
  {
    float angle = 360.0/n;           //finds angle between each edge of polygon, depending on number of sides

    beginShape();
    for (int i = 0; i < n; i++) //used to cycle between edges being drawn
    {

      rotate(radians(rot));  //rotates shape when a or d key are pressed

      vertex(cx + r * cos(radians(angle * i)),  //creates a vertex between certain points with given angle
      cy + r * sin(radians(angle * i)));
    }
    endShape(CLOSE);
  }
}


