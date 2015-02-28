
void setup() {
  size (200, 200);
}

void draw() {
  background (0,255,255);//blue sky
  smooth();

  ellipseMode(CENTER);
  //fill(160,20,116);//pink
  fill (mouseX,0,mouseY);
  //(mouseX + 19,mouseY-30,16,32);
  ellipse (100,25,40,40);//petal--top
  ellipse(135,41,41,41);//petal--right top
  ellipse(141,80,40,40);//petal-- right middle
  ellipse (120,111,40,40);//petal--bottom right
  ellipse(79,111,40,40);//petal--bottom left
  ellipse(55,80,40,40);//petal--left middle
  ellipse(62,40,40,40);//petal--left top
  fill (90,20,20);
  ellipse (100,70,90,90);//face 
  fill (255);//white
  ellipse (80,60,20,20);//left eye
  ellipse (120,60,20,20);//right eye
  fill (0);//black
  ellipse (80,65,10,10);//left eye black
  ellipse(120,65,10,10);//right eye black
  fill(255,0,0);//red
  triangle(80,90,100,100,120,90);//mouth

  fill(59,185,130);//green
  line (100,115,100,200);//stem
  fill (59,185,130);//green
  triangle (100,160,120,150,140,150);//leaf

  println("Flower Power!");
}



