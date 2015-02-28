

float bodyX, bodyY, bodyZ, bodyX2, bodyY2, bodyZ2, ror;
float de=0.3;
PImage bg, face1, face2, eye;
boolean legMove=false;
boolean face=false;
boolean bye=false;
PImage[] c=new PImage[5];
PImage[] fa=new PImage[2];
int t=1;
float m;
int blink;


void setup()
{//background(0);

  size(311, 400, P3D);
  noStroke();
  //smooth();
  eye = loadImage("pupil.png");
  bg=loadImage("ff.jpg");
  face1=loadImage("emotion1.jpg");
  face2=loadImage("emotion2.jpg");
  for (int i=0; i< c.length; i++)
  {
    c[i]=loadImage(i+".jpg");
  }
  for (int i=0; i< fa.length; i++)
  {
    fa[i]=loadImage("face"+i+".jpg");
  }


  textureMode(NORMAL);
}
void draw()

{
  m=millis()/1000;
  println(m);
  background(bg);
  camera(width/2, height/2, (height/2) / tan(PI/6), 200, 150, 0, 0, 1, 0);
  directionalLight(255, 239, 213, 0, 0, -1);
  float rads = radians(frameCount);
  translate(width/2, height/2, 0);

  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      t=0;
      println(0);
    }
    else if (key == 'b' || key == 'B')
    { 
      t=1;
      println(1);
    }
    else if (key == 'c' || key == 'C')
    {
      t=2;
      println(2);
    }
    else if (key =='d' || key == 'D') {
      t=3;
      println(3);
    }
    else if (key =='e' || key == 'E') {
      t=4;
      println(3);
    }
  }

  if (m%3==0)
  {
    blink=1;
  }

  else {
    blink=0;
  }




  float  x = map(mouseX, 0, width, -45, 45);
  rotateY(radians(x));

  pushMatrix();
  rotateZ(radians(15));
  rotateY(radians(5));
  fill(247, 46, 20);
  translate(60, -40, 0);

  textSize(18);
  fill(250, 30, 20, 220);
  text("I'm in hurry", -170, -120);
  text(" Pls help me to choose a dress", -140, -100);
  popMatrix();

  fill(255);


  translate(0, -90, 0);
  translate(-55/2, -55/2, 55/2);//face
  beginShape();
  texture(fa[blink]);
  vertex(0, 0, 0, 0, 0);
  vertex(55, 0, 0, 1, 0);
  vertex(55, 55, 0, 1, 1);
  vertex(0, 55, 0, 0, 1);
  endShape();
  translate(55/2, 55/2, -55/2);
  translate(0, 90, 0);


  //dress
  // textureMode(IMAGE);
  translate(-20, -60, 11);//front
  beginShape();
  texture(c[t]);
  vertex(40, 10, 0, 1, 0);
  vertex(40, 70, 0, 1, 1);
  vertex(0, 70, 0, 0, 1);
  vertex(0, 10, 0, 0, 0);
  endShape();

  beginShape();
  texture(c[t]);
  vertex(-1, 10, 1.5);
  vertex(-1, 10, -20);
  vertex(-1, 70, -20);
  vertex(-1, 70, 1.5);
  endShape();

  beginShape();
  texture(c[t]);
  vertex(41, 10, 1.5);
  vertex(41, 10, -20);
  vertex(41, 70, -20);
  vertex(41, 70, 1.5);
  endShape();



  translate(20, 60, -11);
  //  beginShape();
  //  texture(a);
  //  



  pushMatrix();   //upper body
  beginShape(TRIANGLE_STRIP);
  bodyX=-30;
  bodyY=10;
  bodyZ=10;
  translate(bodyX, bodyY, bodyZ);
  texture(c[t]);
  vertex(0, 35, 10);
  vertex(10, 0, 0);
  vertex(20, 35, 10);
  vertex(30, 0, 0);
  vertex(40, 35, 10);
  vertex(50, 0, 0);
  vertex(60, 35, 10);
  endShape();
  translate(-bodyX, -bodyY, -bodyZ);

  beginShape(TRIANGLE_STRIP); //bottom body front &back
  bodyX2=-30;
  bodyY2=10;
  bodyZ2=-10;
  translate(bodyX2, bodyY2, bodyZ2);
  texture(c[t]);
  vertex(0, 35, -10);
  vertex(10, 0, 0);
  vertex(20, 35, -10);
  vertex(30, 0, 0);
  vertex(40, 35, -10);
  vertex(50, 0, 0);
  vertex(60, 35, -10);
  endShape();

  beginShape();
  texture(c[t]);
  vertex(0, 35, -10);
  vertex(60, 35, -10);
  vertex(60, 35, 30);
  vertex(0, 35, 30);
  endShape(CLOSE);


  beginShape();   //left side
  texture(c[t]);
  vertex(10, 0, 0);
  vertex(10, 0, 20);
  vertex(0, 35, 30);
  vertex(0, 35, -10);
  endShape(CLOSE);

  beginShape();   //right side
  texture(c[t]);
  vertex(50, 0, 0);
  vertex(50, 0, 20);
  vertex(60, 35, 30);
  vertex(60, 35, -10);
  endShape(CLOSE);

  translate(-bodyX2, -bodyY2-20, -bodyZ2);
  scale(2, 4, 1);
  box(20);
  popMatrix();

  pushMatrix();  //head
  translate(0, -90, 0);
  scale(1.05, 1.05, 1.05);
  box(50);
  popMatrix();



  pushMatrix(); //neck
  translate(0, -65, 0);
  scale(0.7, 0.7, 0.5);
  box(25);
  popMatrix();

  pushMatrix();  // left arm
  translate(-35, -23.5, 0);
  rotate(PI/6);
  scale(0.3, 1.5, 0.3);
  box(50);
  popMatrix();

  pushMatrix();  // right arm
  translate(35, -23.5, 0);
  rotate(-PI/6);
  scale(0.3, 1.5, 0.3);
  box(50);
  popMatrix();


  ror+=de;
  if (ror>=10) de*=-1;
  if (ror<=-10) de*=-1;

  pushMatrix();   //right limb
  rotateX(radians(ror));
  translate(5, 45, 0);
  beginShape();
  vertex(0, 0, 7.5);
  vertex(20, 0, 7.5);
  vertex(20, 10, 7.5);
  vertex(17, 70, 7.3);
  vertex(3, 70, 7.3);
  vertex(0, 70, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //left limb
  rotateX(radians(-ror));
  translate(-20, 45, 0);
  beginShape();
  vertex(0, 0, 7.5);
  vertex(20, 0, 7.5);
  vertex(20, 10, 7.5);
  vertex(17, 70, 7.3);
  vertex(3, 70, 7.3);
  vertex(0, 10, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //right limb back
  rotateX(radians(ror));
  translate(5, 45, -15);
  beginShape();
  vertex(0, 0, 7.5);
  vertex(20, 0, 7.5);
  vertex(20, 10, 7.5);
  vertex(17, 70, 7.7);
  vertex(3, 70, 7.7);
  vertex(0, 10, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //left limb back
  rotateX(radians(-ror));
  translate(-20, 45, -15);
  beginShape();
  vertex(0, 0, 7.5);
  vertex(20, 0, 7.5);
  vertex(20, 10, 7.5);
  vertex(17, 70, 7.7);
  vertex(3, 70, 7.7);
  vertex(0, 10, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb side
  rotateX(radians(-ror));
  translate(-20, 45, -15);
  beginShape();
  vertex(0, 10, 7.5);
  vertex(0, 0, 7.5);
  vertex(0, 0, 22.5);
  vertex(0, 10, 22.5);
  vertex(3, 70, 22.5);
  vertex(3, 70, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb side
  rotateX(radians(ror));
  translate(5, 45, -15);
  beginShape();
  vertex(0, 10, 7.5);
  vertex(0, 0, 7.5);
  vertex(0, 0, 22.5);
  vertex(0, 10, 22.5);
  vertex(3, 70, 22.5);
  vertex(3, 70, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb side
  rotateX(radians(ror));
  translate(25, 45, -15);
  beginShape();
  vertex(0, 10, 7.5);
  vertex(0, 0, 7.5);
  vertex(0, 0, 22.5);
  vertex(0, 10, 22.5);
  vertex(-3, 70, 22.5);
  vertex(-3, 70, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb side
  rotateX(radians(-ror));
  translate(0, 45, -15);
  beginShape();
  vertex(0, 10, 7.5);
  vertex(0, 0, 7.5);
  vertex(0, 0, 22.5);
  vertex(0, 10, 22.5);
  vertex(-3, 70, 22.5);
  vertex(-3, 70, 7.5);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb down
  rotateX(radians(ror));
  translate(5, 45, 7.5);
  beginShape();
  vertex(3, 70, 0);
  vertex(17, 70, 0);
  vertex(17, 70, -15);
  vertex(3, 70, -15);
  endShape(CLOSE);
  popMatrix();

  pushMatrix();   //limb down
  rotateX(radians(-ror));
  translate(-20, 45, 7.5);
  beginShape();
  vertex(3, 70, 0);
  vertex(17, 70, 0);
  vertex(17, 70, -15);
  vertex(3, 70, -15);
  endShape(CLOSE);
  popMatrix();
}


