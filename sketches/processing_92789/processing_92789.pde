
int x, y;
float rot = 0;

PImage happyFace1, happyFace2;
PShape happyFace3;

boolean showFace = false;

void setup () {
  size (400, 400);
  
  happyFace1 = loadImage("face.png");
  
  happyFace2 = loadImage("happy.jpeg");

  happyFace3 = loadShape("Smiley.svg");
  
  happyFace3.disableStyle();
  
  y = height / 2;
  
  x = width / 2;
  
}

void draw() {
//  background(0);
fill(0,0,0,5);
  rect(0,0,width, height);
  x+= random(-5, 5);
  if (x > width+25) { 
    x = -25;
  }
  if (x < -25) { 
    x = width+25;
  }

  y+= random(-5, 5);
  if (y > height+25) { 
    y = -25;
  }
  if (y < -25) { 
    y = height+25;
  }


  imageMode(CENTER);
  image(happyFace2, width/2, height/2, width/2, height/2);
  if ((random(-5,5) > -4) || ( showFace))
  image(happyFace1, width/2, height/2, width/2+90, height/2+90);
  
rot += 0.01;

  image(happyFace1, x, y, 100, 100);

fill(0,123,234,5);
stroke(0,90,123,5);
///*
for (int i=0; i<20; i++) {

    for (int j=0; j<20; j++) {
      pushMatrix();
      translate(i*20, j*30);
      rotate(radians(i+j)+rot);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, 10+i, 10+j);
      popMatrix();
    }
  }
//  */

  

fill(123,234,0);
stroke(90,123,0);
  shape(happyFace3, 50, 50, 100, 100);

  return;
}


void mousePressed() {
   showFace = true;
}

void mouseReleased() {
   showFace = false;
}


/*
void draw() {
 pushMatrix();
 translate(width/2, height/2);
 rotate(radians(30));
 rect (30, 40, 100, 100);
 popMatrix();
 
 myCircle(mouseX, mouseY, 34);
 myCircle(mouseY, mouseX, 43);
 myCircle(mouseX, mouseX, 33);
 myCircle(mouseY, mouseY, 44);
 return;
 }
 
 void myCircle(int moveX, int moveY, int size) {
 
 pushMatrix();
 translate(moveX, moveY);
 rotate(radians(30));
 ellipse(0, 0, size, size);
 popMatrix();
 
 return;
 }
 */


