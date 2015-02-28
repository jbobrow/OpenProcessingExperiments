
//svgs
PShape ground;
PShape tongue;
PShape cloud;
PShape cloud2;
PShape cloud3;
PShape cloud4;
PShape tree;
PShape sun;
PShape fly1;
PShape happy;
PShape sick;
PShape pupil;

float eyeY=0;
float eyeX=0;
float tPos=700;
float c1xPos=650;
float c2xPos=640;
float c3xPos=740;
float c4xPos=680;
float a=0;
float a2=255;
float flyX=100;
float flyRanX=100;
float flyRanY=181;
float hY=-10;
float sY=-200;

float xPos=0;
float speed=0;



int numFrames = 2;  // The number of frames in the animation
int frame = 0;
PShape[] images = new PShape[numFrames];

boolean button = false;
boolean sunOn = false;

//ball variables
PShape ball;
float bounce=0;
float gravity =0.1;
float h=40;
float x =750;
float y=60;
boolean ballDrop=false;


void setup () {
  size(900, 600);
  frameRate(30);
  smooth();
  fly1=loadShape("fly1.svg");
  ground=loadShape("ground.svg");
  tongue=loadShape("tongue.svg");
  tree=loadShape("tree.svg");
  cloud=loadShape("cloud.svg");
  cloud2=loadShape("cloud2.svg");
  cloud3=loadShape("cloud3.svg");
  cloud4=loadShape("cloud4.svg");
  sun=loadShape("sun.svg");
  happy=loadShape("happy.svg");
  sick=loadShape("sick.svg");
  pupil=loadShape("pupil.svg");
  ball=loadShape("ball.svg");
  images[0]  = loadShape("fly1.svg");
  images[1]  = loadShape("fly2.svg");
}
void draw() {
  println ("mouseY"+mouseY);
  tPos=constrain(tPos, 425, 650);
  a=constrain(a, 0, 255);
  a2=constrain(a2, 0, 255);
  c1xPos=constrain(c1xPos, 425, 650);
  c2xPos=constrain(c2xPos, 550, 640);
  c3xPos=constrain(c3xPos, 740, 900);
  c4xPos=constrain(c4xPos, 680, 800);
  xPos=constrain(xPos, -150, 100);
  eyeX=constrain(mouseX, xPos+width/2+220, xPos+width/2+248 );
  eyeY=constrain(mouseY, 500, 520);
  flyRanY=constrain(flyRanY, 10, 500);



  noStroke();
  //sky color change
  background(147, 15, 66);
  fill(51, 17, 37, a2);
  rect (0, 0, 1200, 600);


  shapeMode(CENTER);

  // override of sun color
  sun.disableStyle();
  fill(221, 115, 44, a);
  shape(sun, xPos+width/2+325, 20, 3000, 3000);


  //shape position
  shape(tongue, xPos+width/2-5, tPos, 100, 240);
  shape(ground, xPos+ width/2, 500, 1200, 200);
  shapeMode(CORNER);
  shape(tree, xPos+width/2-550, 230, 290, 380);
  shape(happy, xPos+width/2+270, hY, 100, 150);
  shape(sick, xPos+width/2+270, sY, 100, 150);

  //ball
  shape(ball, x+xPos, y, 40, h);
  ball.setVisible(false);

  //clouds
  shape(cloud4, xPos+c4xPos, -30, 180, 80);
  shape(cloud2, xPos+c2xPos, 10, 180, 80);
  shape(cloud3, xPos+c3xPos, 10, 180, 80);
  shape(cloud, xPos+c1xPos, 40, 245, 105);
  shape(pupil, eyeX, eyeY, 15, 15);









  //tongue hot spot 
  if (mouseX>xPos+width/2-75&&mouseX<xPos+width/2+75&&mouseY>280&&mouseY<530) {
    tPos-=6;
  }
  else {
    tPos+=3;
  }
  //cloud1 hot spot
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    c1xPos-=5;
  }
  else {
    c1xPos+=3;
  }
  //cloud2 hot spot
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    c2xPos-=3;
  }
  else {
    c2xPos+=3;
  }
  //cloud3 hot spot
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    c3xPos+=5;
  }
  else {
    c3xPos-=3;
  }
  //cloud4 hot spot
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    c4xPos+=3;
  }
  else {
    c4xPos-=3;
  }
  //sky and sun hotspots, color change
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    a+=5;
  }
  else {
    a-=5;
  }
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    a2-=5;
  }
  else {
    a2+=5;
  }

  //fly animation control/button
  if (button) {
    frame = (frame+1) % numFrames;  // Use % to cycle through frames
    flyRanX=flyRanX-5;
  }

  if (flyRanX<-150) {
    flyRanX=width+100;
  }
  if (flyRanX>width/2-355 && flyRanX<width/2-345&& flyRanY>180&&flyRanY<190) {
    button=false;
  }

  if (button&&keyPressed==true&&keyCode==38) {
    flyRanY-=5;
  }
  if (button&&keyPressed==true&&keyCode==40) {
    flyRanY+=5;
  }
   /* if (button&&keyPressed==true&&keyCode==39) {
    flyRanX+=5;

  }
      if (button&&keyPressed==true&&keyCode==37) {
    flyRanX-=5;
  }*/
if (flyRanX>width/2-75&&flyRanX<width/2+75&&flyRanY>280&&flyRanY<530) {
  tPos-=10;
}


  shape(images[frame], xPos+flyRanX, flyRanY);



  //sun button
  if (sunOn&&c4xPos>780) {
    hY=-200;
    sY=-5;
  }
  else {
    hY=-10;
    sY=-200;
  }
  if (ballDrop) {
    ball.setVisible(true);
    x=x+1;
    y=y+bounce;
    bounce=bounce+gravity;
    if (y>height-90) {
      bounce=bounce*-.85;
    }
    if (x>width+150) {
      x =750;
      y=60;
      ball.setVisible(false);
      ballDrop=false;
    }  
    if (x<width+150&&ballDrop) {
      ball.setVisible(true);
      ballDrop=true;
    }
  }
  //pan control
  if (mouseX < width/3) {
    speed=+3;
  }
  else if (mouseX<2*width/3) {
    speed=0;
  }
  else {
    speed=-3;
  }
  xPos=xPos+speed;
}


void mousePressed() {
  //fly button
 if (mouseX>xPos+100&&mouseX<xPos+150&&mouseY>200&&mouseY<250) {
button=!button;
  }
  //sun button
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    sunOn=!sunOn;
  }  
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    ballDrop=true;
  }
}

//sun button release
void mouseReleased() {
  if (mouseX>xPos+640&&mouseX<xPos+910&&mouseY>0&&mouseY<140) {
    sunOn=!sunOn;
  }
}


