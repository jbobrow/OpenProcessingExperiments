
//variables
float cartX;
float cartY;
float leftEyeX;
float leftEyeY;
float rightEyeX;
float rightEyeY;
float mouthX;
float mouthY;
float value=0;
PFont swear;
boolean state=false;

void setup() {
  size(1200, 800);
  //frameRate(5);
  cartX=random(600);
  cartY=random(600);
  swear = createFont("Arial", 100);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      cartY=cartY-200;
    } 
    else if (keyCode == DOWN) {
      cartY=cartY+200;
    } 
    else if (keyCode == LEFT) {
      cartX=cartX-200;
    } 
    else if (keyCode == RIGHT) {
      cartX=cartX+200;
    }
  }
}
void textDisp() {
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("Fuck off, you donkey-raping shit eater", mouseX, mouseY);
}
void mouseClicked() {
  if ((mouseX>=cartX-50)&&(mouseX<=cartX+50)&&(mouseY<=cartY)&&(mouseY>=cartY-235)) {
    //background(random(255), random(255), random(255));
    state = true;
  }
}

void draw() {
  mouseClicked();
  background(255);
  leftEyeX = cartX-15;
  leftEyeY = cartY-155;
  rightEyeX = cartX+15;
  rightEyeY = cartY-155;
  mouthX = cartX-10;
  mouthY = cartY-110;

  if (state==false) {
    //pants
    noStroke();
    fill(121, 83, 0);
    quad(cartX-80, cartY, cartX-90, cartY-10, cartX+90, cartY-10, cartX+80, cartY);

    //shoes
    fill(0);
    noStroke();
    arc(cartX-40, cartY, 80, 10, PI, TWO_PI);
    arc(cartX+40, cartY, 80, 10, PI, TWO_PI);

    //tshirt
    fill(255, 0, 0);
    noStroke();
    rect(cartX-100, cartY-110, 200, 100, 10);

    //line, buttons
    stroke(0);
    line(cartX, cartY-110, cartX, cartY-10);
    fill(0);
    ellipse(cartX-10, cartY-20, 5, 5);
    ellipse(cartX-10, cartY-50, 5, 5);
    ellipse(cartX-10, cartY-80, 5, 5);

    //face
    noStroke();
    fill(255, 233, 185);
    ellipse(cartX, cartY-160, 180, 140);

    //cap
    //blue portion
    fill(0, 227, 255);
    noStroke();
    arc(cartX, cartY-160, 182, 160, PI, TWO_PI);
    //yellow
    stroke(255, 255, 0);
    fill(255, 233, 185);
    strokeWeight(5);
    arc(cartX, cartY-160, 182, 60, PI, TWO_PI);

    //double chin
    noFill();
    stroke(0);
    strokeWeight(1);
    arc(cartX, cartY-135, 150, 80, 0+PI/8, PI-PI/8);

    //eyes
    fill(255);
    noStroke();
    ellipse(cartX-25, cartY-155, 50, 50);
    ellipse(cartX+25, cartY-155, 50, 50);
    fill(0);
    ellipse(leftEyeX, leftEyeY, 5, 5);
    ellipse(rightEyeX, rightEyeY, 5, 5);

    //eyebrows
    strokeWeight(2);
    stroke(0);
    line(cartX-50, cartY-180, cartX-20, cartY-200);
    line(cartX+50, cartY-180, cartX+20, cartY-200);

    //top yellow shit
    fill(255, 255, 0);
    noStroke();
    ellipse(cartX-20, cartY-235, 15, 15);
    ellipse(cartX-10, cartY-235, 20, 20);
    ellipse(cartX, cartY-235, 20, 20);
    ellipse(cartX+10, cartY-235, 15, 15);

    //mouth
    fill(0);
    rect(mouthX, mouthY, 20, 10, 20);

    //hands
    fill(255, 233, 185);
    ellipse(cartX-60, cartY-80, 20, 15);
    ellipse(cartX-60, cartY-65, 20, 15);
    ellipse(cartX-60, cartY-50, 20, 15);
    rect(cartX-80, cartY-87.5, 25, 45, 10);

    ellipse(cartX+60, cartY-80, 20, 15);
    ellipse(cartX+60, cartY-65, 20, 15);
    ellipse(cartX+60, cartY-50, 20, 15);
    rect(cartX+55, cartY-87.5, 25, 45, 10);
  }
  else {
    float time = millis()*0.001;
    if(time<3000)
    {
      textDisp();
    }
    state=false;
  }
}


