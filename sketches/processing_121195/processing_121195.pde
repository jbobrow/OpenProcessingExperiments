
//Spring
//Fireflies in the forest
/*Some Fireflies will follow the mouse,
and the other will flicker in the background.*/
//Reference : 3D noise in class; http://processingjs.org/
//Chiming Lu

PImage img1;

float x, y, z, a, b;
float easing = 0.01;
float easing2 = 0.1;
float diameter = 12;
float noiseFactor;

void setup() {
  size(800, 600, P3D);
  background(0);
  frameRate(3);
  img1 = loadImage("springuse.jpg");
}


void draw() {
 //background image
  translate(width/2, height/2);
  beginShape();
  tint(255, 150);
  texture(img1);
  vertex(-700, -500, -300, 0, 0);
  vertex(800, -500, -300, img1.width, 0);
  vertex(800, 600, -300, img1.width, img1.height);
  vertex(-700, 600, -300, 0, img1.height );
  endShape(CLOSE);

  fill(0, 10);
  rect(width-100, height-100, width+100, height+100);

  translate(-500, -500, 100);
  for (int fx=0; fx <=width;fx+=100) {
    for (int fy=0;fy<=height;fy+=200) {
      fireflybackground(fx, fy*0.5);
      fireflybackground(fx*0.2, fx*0.2);
    }
  }

  fireflybackground(200, 200);
  
  firefly(5, 5, 5);
  firefly(10, 10, 10);

  stroke(168, 255, 70, noiseFactor*a);
  line(mouseX, mouseY, pmouseX-10, pmouseY-10);
  
}


//Fireflies follow the mouse
void firefly(float a, float b, float ballsize) {

  float targetX=mouseX;
  float targetY=mouseY;
  float xnoise =random(200)-100;
  float ynoise =random(10)-10;
  float znoise =random(100)-50;

  noiseFactor=xnoise*ynoise;
  x+=(targetX-x)*easing;
  y+=(targetY-y)*easing;
  z=(noiseFactor-100)*easing2;

  translate(x+random(a), y+random(b), z);

  rotateY(frameCount * 0.1);
  fill(88, 245, 22, noiseFactor);
  //fill(212, 255, 120, noiseFactor);
  noStroke();
  sphere(ballsize);
}

//Fireflies in the forest 

void fireflybackground(float a, float b) {

  float xsize =noiseFactor*0.02;
  float ysize =noiseFactor*0.02;
  float bx =random(a)*2+200;
  float by =random(b)*2+100;
  float pfc=noiseFactor*a;

  stroke(168, 255, 70, pfc);
  strokeWeight(xsize);
  strokeJoin(ROUND);
  point(bx, by); // work in js,but not round
  
  //ellipseMode(CENTER);
  //fill(168, 255, 70, pfc);
  //ellipse(pbx, pby, xsize, ysize); //not work in js
}



