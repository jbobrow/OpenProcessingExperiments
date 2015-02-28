
float bPosax=100;
float bPosay=0;
float bPosbx=200;
float bPosby=0;
float bPoscx=300;
float bPoscy=0;  
float axSpeed=-4;
float aySpeed=1;
float bxSpeed=2;
float bySpeed=1;
float cxSpeed=3;
float cySpeed=1;

float gravity=0.3;



void setup() {
  size(700, 700);
}

void draw() {

  bPosax+=axSpeed;
  bPosay+=aySpeed;
  bPosbx+=bxSpeed;
  bPosby+=bySpeed;
  bPoscx+=cxSpeed;
  bPoscy+=cySpeed;


  aySpeed+=gravity;
  bySpeed+=gravity;
  cySpeed+=gravity;

  background(255);
  fill(0);
  noStroke();
  ellipseMode(CENTER);
  fill(100);
  ellipse(bPosax, bPosay, 50, 50);
  fill(200);
  ellipse(bPosbx, bPosby, 50, 50);
  fill(150);
  ellipse(bPoscx, bPoscy, 50, 50);

  if (bPosax>=width-25 || bPosax<=0) {
    axSpeed=axSpeed*(-0.95);
  }

  if (bPosay>=height-25 || bPosay<=0) {
    aySpeed=aySpeed*(-0.95);
  }

  if (bPosbx>=width-25 || bPosbx<=0) {
    bxSpeed=bxSpeed*(-0.95);
  }

  if (bPosby>=height-25 || bPosby<=0) {
    bySpeed=bySpeed*(-0.95);
  }

  if (bPoscx>=width-25 || bPoscx<=0) {
    cxSpeed=cxSpeed*(-0.95);
  }

  if (bPoscy>=height-25 || bPoscy<=0) {
    cySpeed=cySpeed*(-0.95);
  }
  
    if (dist(bPosax, bPosay, bPosbx, bPosby) <= 50) {
    axSpeed *= -1;
    aySpeed *= -1;
    bxSpeed *= -1;
    bySpeed *= -1;
  }
  
    if (dist(bPosax, bPosay, bPoscx, bPoscy) <= 50) {
    axSpeed *= -1;
    aySpeed *= -1;
    cxSpeed *= -1;
    cySpeed *= -1;
  }
  
     if (dist(bPosbx, bPosby, bPoscx, bPoscy) <= 50) {
    bxSpeed *= -1;
    bySpeed *= -1;
    cxSpeed *= -1;
    cySpeed *= -1;
  }
 
  
}


