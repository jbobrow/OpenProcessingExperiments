
// This is about some knitted feeling with geometric matters.
// You can increase or not using A,S and also manipulate radius using Z,X
   
        
float len = 50;
float theta;
float sides = 15;
float angle = radians(720/sides);
float aVelocity = 0.005;
float thetaVel = 0.01;
float amplitude = 0.01;

void setup() {
  size(900, 450);
  background(3,252,209);
  smooth();
  noFill();
}

void draw() {  
    if (mousePressed) return;
  float x = amplitude * cos(angle);
  float y = amplitude * sin(len);
  
  angle += aVelocity;
  float aAcceleration = random(10);
  
  for (int i = 0; i <= width; i +=1) {
  float a = map(sin(theta),-1,1,0,random(1));
  }  
  
  translate(width * .5, height * .5);
  background(3,252,209);
  float a = (mouseX / (float) width) * 90;
  theta = radians(a);
  for (int i = 0 ; i < sides; i++) {
    pushMatrix();
    translate(cos((TWO_PI/sides)*i) * len * .15, sin((TWO_PI/sides)*i) * len * .15);
    rotate(angle * i);
    recurse(len);
    popMatrix();
  }
}

void keyReleased() {
  switch(keyCode) {//check for key input
  case 65://q
    if (len < 400) len+= 15;//increase the number of elements
    break;
  case 90://w
    if (len > 40) len-= 15;//decrease the number of elements
    break;
  case 83://e
    if (sides < 32) sides++;//increase the initial radius
    angle = radians(360/sides);
    break;
  case 88://r
    if (sides > 3) sides--;//decrease the initial radius
    angle = radians(360/sides);
    break;
  }
}

void recurse(float len) {
  len /= 1.66;
  boolean flip = false;
  if (len > 10) {
    pushMatrix();
    translate(50, len * 3.14);
    flip = !flip;
    if (flip)rotate(theta + radians(90));
    else rotate(theta);
    recurse(len);
    popMatrix();
  }
  
  
 translate(width/2, height/2);
  for (int j=0;j<4;j++) {
    rotate(PI/2*j);
    for (int k = 0; k<4; k++) {
      pushMatrix();
      translate(40*k, 40*k);
      noStroke();
      fill(random(250), random(50), random(50),100);
      rect(50, 150, 100, 40);
      rect(150, 50, 400, 10);
      rect(50, 50, 100, 10);
      rect(-50, -50, 100, 10);    
      popMatrix();
    } 

}
}

