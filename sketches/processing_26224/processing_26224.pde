
int flowerX = 100;
int flowerY= 200;

void setup() {
  size (200, 200);
}

void draw() {
  background (0,255,255);//blue sky
  smooth();

  ellipseMode(CENTER);
  fill (mouseX,0,mouseY);
  ellipse (flowerX,flowerY-175,40,40);//petal--top
  ellipse(flowerX+35,flowerY-159,41,41);//petal--right top
  ellipse(flowerX+41,flowerY-120,40,40);//petal-- right middle
  ellipse (flowerX+20,flowerY-89,40,40);//petal--bottom right
  ellipse(flowerX-21,flowerY-89,40,40);//petal--bottom left
  ellipse(flowerX-45,flowerY-120,40,40);//petal--left middle
  ellipse(flowerX-38,flowerY-160,40,40);//petal--left top

  if (mousePressed == true) {
    fill (55,30,50);
  } 
  else {
    fill (255,230,0);//yellow
  }
  ellipse (flowerX,flowerY-130,90,90);//face 
  
  fill (255);//white
  ellipse (flowerX-20,flowerY-140,20,20);//left eye
  ellipse (flowerX+20,flowerY-140,20,20);//right eye
  fill (0);//black
  float leftEyePos = map(mouseX, 0, width, 75, 85);
  ellipse (leftEyePos,flowerY-135,10,10);//left eye black
  float rightEyePos = map (mouseX, 0, width, 115, 125);
  ellipse(rightEyePos,flowerY-135,10,10);//right eye black
  
  if (mousePressed == true) {
    fill (255,0,0);
  } 
  else {
    fill (255,0,0,50);//mouth
  }

  triangle(flowerX-20,flowerY-110,flowerX,flowerY-100,flowerX+20,flowerY-110);//mouth

  fill(59,185,130);//green
  line (flowerX,flowerY-85,flowerX,flowerY);//stem
  fill (59,185,130);//green
  triangle (flowerX,flowerY-40,flowerX+20,flowerY-50,flowerX+40,flowerY-50);//leaf
  println("Flower Power!");
}


