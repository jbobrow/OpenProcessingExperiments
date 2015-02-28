
class Robot {
  float x;
  float y;
  float scalarr;
  float colorr;
  float l;
  float legs = random(0,5);
  float a;
  float armlength = random(3, 8);
  float speed = random(1, 5);
  
  Robot(float xa, float ya, float sa, float cr, float la, float aa) {
    x = xa;
    y= ya;
    scalarr = sa;
    colorr = cr;
    l = la;
    a = aa;
  }
  
  void move() {
    x += random(-speed/2, speed/2);
    x = constrain(x, 40, 500);
    y += speed/2;
    y = constrain(y, 100, height);
    //if (y>20 ||  y<400);
    //{y=-speed/2;}
  }
  
    void move2() {
    x += random(-speed/2, speed/2);
    x = constrain(x, 40, 500);
    y += speed/2;
    y = constrain(y, 100, height);
    if (y>20 ||  y<400);
    {y=-speed/2;}
  }
  
  void display() {
  pushMatrix();
  translate(x, y);
  scale(scalarr);
noStroke();
  fill(5);
  rect (53, 67, 6, 10); //neck
  rect(14-a, 84, 16+a, 6); //left arm
  rect(82, 84, 16+a, 6); //right arm
  rect(40, 130, 6, l); //left leg
  rect(67, 130, 6, l); //right leg
   fill(colorr);
  rect(40, 36, 31, 31); //head
  rect (30, 77, 52, 52); //body
    fill(255);
  ellipse(47,48, 3, 3); //left eye
 ellipse(64, 48, 3, 3); //right eye
 rect(48, 58, 16, 2); //mouth
  popMatrix();
  }

void movelegs() {
  l +=legs;
  if(l<5 || l >20) {
  legs = - legs;
  }
}

void movearms(){
 a += armlength;
  if (a <6 || a >20) {
  armlength =- armlength;
 }
}


  }


