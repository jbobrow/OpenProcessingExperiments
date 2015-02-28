

float speed= .2;
//i had thought this would be a variable to work with but it is more about the movement it does effect time but not consistently
float time=200;
salt[] salts;
Vect[] vels;
int[] closest = new int[600];

void setup () {
  size(400, 400);
  salts = new salt[600]; 
  vels = new Vect[600];
// going through 600 salts in the array 1 by 1 ..was thinking that i should have made it a variable
  for(int i=0; i<600; i=i+1) {
    salts[i] = new salt(random(salts.length),random(salts.length),random(1,6));
    vels[i]=new Vect();
  }

  smooth();
  noStroke();
}

void draw() {

  background(0);
  for (int i=0; i< 600; i=i+1) {
    salts[i].X += vels[i].Vx;
    salts[i].Y += vels[i].Vy;
    fill(i);
    stroke(i);
   //constructer dot syntax through array ...also making salt move to the center 
    rectMode(CENTER);
    rect(salts[i].X, salts[i].Y, salts[i].R*2, salts[i].R);
    stroke(255);
  }

  changeVeloc(salts,vels);
}
//cast
//relate classes to each other
void changeVeloc(salt[]  b, Vect[] v) { 
//loop in a loop accident but dont fully understand how it works ... was just trying to relate
  for(int i=0; i<600; i=i+1) {
    for(int j=0; j<600; j=j+1) {  
    }

    //associate array movement to mouse position
    float moveX=mouseX-b[i].X;
    float moveY=mouseY-b[i].Y;
//moving togehter based on dist
    float x2 = moveX*cos(time)-moveY*sin(time);
    float y2 = moveX*sin(time)+moveY*cos(time);
    moveX=x2;
    moveY=y2;
    float dist=sqrt(moveX*moveX+moveY*moveY);
    v[i].Vx=speed*moveX/dist;
    v[i].Vy=speed*moveY/dist;
  }
}
//interactive zone 

void mousePressed() {
  if (speed == 0) {
    speed = .2;
  }
  else {
    speed =.8;
  }
}

void mouseReleased() {
  if (speed == .8) {
    speed = .3;
  }
  else {
    speed =.4;
  }
}


void keyPressed(){
 save ("3.tif");}





