
meteo meteoArray[]; //set the meteo as a Array
earth e1;//set the e1 as earth class
jupiter j1;//set the j1 as jupiter class

PFont font;
//Planets Animation Setup
float angle =0; //rotation degree
float velocity = 0; //variable for planetVelocity in void draw

//orbit idle animation
float idle = 0; 
float idleDir = 1;
float idleCount = 0;

//Planets CSS
float planetDis1 = 400; //planet distance
float planetDis2 = 300;
float planetDis3 = 230;
float planetDis4 = 150;
float planetDis5 = 100;
float planetDis6 = 60;

float planetSize1 = 30; //planet size
float planetSize2 = 40;
float planetSize3 = 25;
float planetSize4 = 15;
float planetSize5 = 20;
float planetSize6 = 10;

color planetColor1 = color(214, 58, 58); //planet color
color planetColor2 = color(58, 199, 214);
color planetColor3 = color(221, 224, 72);
// color planetColor4 = color(72, 149, 229); //-> go to earth class
color planetColor5 = color(240, 165, 53);
color planetColor6 = color(196, 124, 232); 

color planetLine = (255); //Orbit line color

//Background Stars Setup
float[] starAX = new float[200]; // starA Xposition
float[] starAY = new float[200]; // starA Yposition
float[] starAS = new float[200]; //starA size
float[] starBX = new float[200]; // starB Xposition
float[] starBY = new float[200]; // starB Yposition
float[] starBS = new float[200]; //starB size

int count = 0; // count draw loop
int starABlink = 0; // blink variable 0,1
int starBBlink = 1; // blink variable 1,0

float sunRotate = 0; 

void setup() {
  size(650, 500, P3D); //P3D for rotate X,Y,Z and sphere
  //to get random positionX,Y and scale values
  for (int i = 0; i < 200; i++) {
    starAX[i] = random(0, width);
    starAY[i] = random(0, height);
    starAS[i] = random(0, 5);
    starBX[i] = random(0, width);
    starBY[i] = random(0, height);
    starBS[i] = random(0, 3);
  }
  //declare Array for meteo
  meteoArray = new meteo[5];
  //set the value into Array
  for (int i = 0; i<5; i++) {
    meteoArray[i] = new meteo(-50, -50, 0, random(-90, 90), random(2, 15), random(0, 2), random(0, 2), random(-2, 2));
    ;
  }
  //declare class fot earth
  e1 = new earth(10, 0, 0, 12, 5, 0);
  j1 = new jupiter(45, 50);
}

void draw() {  
  float planetVelocity1 = velocity/2;
  float planetVelocity2 = velocity/2 * 1.05;
  float planetVelocity3 = velocity/2 * 1.04;
  float planetVelocity4 = velocity/2 * 1.02;
  float planetVelocity5 = velocity/2 * 1.06;
  float planetVelocity6 = velocity/2 * 1.03;

  velocity++;

  float solarSystemX = width/2;
  float solarSystemY = height/2;

  background(20);

  //background star draw
  count++; 
  if (0 <= count && count < 40) {
    starABlink = 1;
    starBBlink = 0;
  } else if (40 <= count && count < 80) {
    starABlink = 0;
    starBBlink = 1;
  } else {
    count = 0;
  }

  //get the idle framerate for sin animation
  idleCount++;
  if (idleCount > 300) {
    idleDir = -1 * idleDir;
    idleCount = 0;
  }
  idle = idle + idleDir;
  // println("idle"+idle);
  // println("idleDir"+ idleDir);


  fill(random(0, 255)*starABlink, random(0, 255)*starABlink, random(0, 255)*starABlink); 
  for (int i = 0; i < 200; i++) {
    ellipse(starAX[i], starAY[i], starAS[i], starAS[i]);
  }
  fill(random(0, 255)*starBBlink, random(0, 255)*starBBlink, random(0, 255)*starBBlink);
  for (int i = 0; i < 200; i++) {
    ellipse(starBX[i], starBY[i], starBS[i], starBS[i]);
  }

  //meteo draw
  sphereDetail(1/4);
  stroke(0);
  strokeWeight(1);
  for (int i = 0; i<5; i++) {
    meteoArray[i].update();
  }
  noStroke();
  sphereDetail(10);

  pushMatrix();//ROTATE CANVAS;
  translate(width/2, height/2+50);
  scale(0.5);
  rotateX(PI/2.5);
  translate(-1*width/2+60, -1*height/2);

  //Lights
  //     pointLight(255, 255, 255, 0, 0, 0);
  //     pointLight(50, 50, 50, width, height, 0);


  //sun
  sunRotate++;
  pushMatrix();
  translate(width/2 + 50, height/2);
  rotateX((PI/17)+idle*0.0001);
  rotateY(-1*PI/60 + sunRotate/100);
  rotateZ(PI/5 + sunRotate/200);
  noStroke();
  fill(255);
  box(35);
  popMatrix();


  //Planet 1 - 2D line
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/17)+idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/5);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos1 = planetDis1*cos(radians(planetVelocity1)) + solarSystemX;
  // float planetYpos1 = planetDis1*sin(radians(planetVelocity1))*1.1 + solarSystemY;
  // ellipse(planetXpos1, planetYpos1, planetSize1, planetSize1);
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX, solarSystemY, planetDis1*2, planetDis1*2*1.3);
  popMatrix();
  //Planet 1 - 3D Sphere
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/17)+idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/5);
  translate(-1*width/2, -1*height/2);
  fill(planetColor1);
  noStroke();
  float planetXpos1 = planetDis1*cos(radians(planetVelocity1)) + solarSystemX;
  float planetYpos1 = planetDis1*sin(radians(planetVelocity1))*1.3 + solarSystemY;
  translate(planetXpos1, planetYpos1, 0);
  sphere(planetSize1);
  popMatrix();

  //Planet 2
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/25)-idle*0.0003);
  rotateY(-1*PI/40);
  rotateZ(PI/15);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos2 = planetDis2*cos(radians(planetVelocity2))*1.2 + solarSystemX;
  // float planetYpos2 = planetDis2*sin(radians(planetVelocity2)) + solarSystemY;
  // ellipse(planetXpos2, planetYpos2, planetSize2, planetSize2);
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX, solarSystemY, planetDis2*2, planetDis2*2*1.3); //1.3 for spiral
  popMatrix();
  //Planet 2 - 3D Sphere
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/25)-idle*0.0003);
  rotateY(-1*PI/40);
  rotateZ(PI/15);
  translate(-1*width/2, -1*height/2);
  fill(planetColor2);
  noStroke();
  float planetXpos2 = planetDis2*cos(radians(planetVelocity2)) + solarSystemX;
  float planetYpos2 = planetDis2*sin(radians(planetVelocity2))*1.3 + solarSystemY; //1.3 for spiral
  translate(planetXpos2, planetYpos2, 0);
  sphere(planetSize2);
  j1.update();
  popMatrix();

  //Planet 3
  strokeWeight(2);  
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/65)+idle*0.0003);
  rotateY(-1*PI/60);
  rotateZ(PI/25);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos3 = planetDis3*cos(radians(planetVelocity3)) + solarSystemX;
  // float planetYpos3 = planetDis3*sin(radians(planetVelocity3)) + solarSystemY;
  // ellipse(planetXpos3, planetYpos3, planetSize3, planetSize3);
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX + 5, solarSystemY, planetDis3*2, planetDis3*2*1.3);
  popMatrix();
  //Planet 3 - 3D Sphere
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/65)+idle*0.0003);
  rotateY(-1*PI/60);
  rotateZ(PI/25);
  translate(-1*width/2, -1*height/2);
  fill(0);
  float planetXpos3 = planetDis3*cos(radians(planetVelocity3)) + solarSystemX + 5;
  float planetYpos3 = planetDis3*sin(radians(planetVelocity3))*1.3 + solarSystemY;
  translate(planetXpos3, planetYpos3, 0);
  fill(planetColor3);
  noStroke();
  sphere(planetSize3);
  popMatrix();

  //Planet 4
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(-(PI/70)-idle*0.0003);
  rotateY(-1*PI/60);
  rotateZ(PI/50);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos4 = planetDis4*cos(radians(planetVelocity4)) + solarSystemX;
  // float planetYpos4 = planetDis4*sin(radians(planetVelocity4)) + solarSystemY;
  // ellipse(planetXpos4, planetYpos4, planetSize4, planetSize4);
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX + 15, solarSystemY, planetDis4*2, planetDis4*2*1.3);
  popMatrix();
  //Planet 4 - 3D Sphere
  pushMatrix();
  // fill(0);
  translate(width/2, height/2);
  rotateX(-(PI/70)-idle*0.0003);
  rotateY(-1*PI/60);
  rotateZ(PI/50);
  translate(-1*width/2, -1*height/2);
  // float planetXpos4 = planetDis4*cos(radians(planetVelocity4)) + solarSystemX + 15;
  // float planetYpos4 = planetDis4*sin(radians(planetVelocity4))*1.3 + solarSystemY;
  float planetXpos4 = planetDis4*cos(radians(planetVelocity4))+ 15;
  float planetYpos4 = planetDis4*sin(radians(planetVelocity4))*1.3;
  translate(planetXpos4, planetYpos4, 0);
  // fill(planetColor4);
  noStroke();
  // sphere(planetSize4); //original earth
  e1.update();
  popMatrix();

  //Planet 5
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/75)+idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/50);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos5 = planetDis5*cos(radians(planetVelocity5)) + solarSystemX;
  // float planetYpos5 = planetDis5*sin(radians(planetVelocity5)) + solarSystemY;
  // ellipse(planetXpos5, planetYpos5, planetSize5, planetSize5);  
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX + 30, solarSystemY, planetDis5*2, planetDis5*2*1.3);
  popMatrix();
  //Planet 5 - 3D Sphere
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/75)+idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/50);
  translate(-1*width/2, -1*height/2);
  fill(0);
  float planetXpos5 = planetDis5*cos(radians(planetVelocity5)) + solarSystemX + 30;
  float planetYpos5 = planetDis5*sin(radians(planetVelocity5))*1.3 + solarSystemY;
  translate(planetXpos5, planetYpos5, 0);
  fill(planetColor5);
  noStroke();
  sphere(planetSize5);
  popMatrix();

  //Planet 6
  strokeWeight(2);
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/40)-idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/70);
  translate(-1*width/2, -1*height/2);
  // fill(0);
  // float planetXpos6 = planetDis6*cos(radians(planetVelocity6)) + solarSystemX;
  // float planetYpos6 = planetDis6*sin(radians(planetVelocity6)) + solarSystemY;
  // ellipse(planetXpos6, planetYpos6, planetSize6, planetSize6);
  noFill();
  stroke(planetLine);
  ellipse(solarSystemX + 50, solarSystemY, planetDis6*2, planetDis6*2*1.3);
  popMatrix();
  //Planet 6 - 3D Sphere
  pushMatrix();
  translate(width/2, height/2);
  rotateX((PI/40)-idle*0.0001);
  rotateY(-1*PI/60);
  rotateZ(PI/70);
  translate(-1*width/2, -1*height/2);
  fill(0);
  float planetXpos6 = planetDis6*cos(radians(planetVelocity6)) + solarSystemX + 50;
  float planetYpos6 = planetDis6*sin(radians(planetVelocity6))*1.3 + solarSystemY;
  translate(planetXpos6, planetYpos6, 0);
  fill(planetColor6);
  noStroke();
  sphere(planetSize6);
  popMatrix();

  popMatrix();//ROTATE CANVAS;

  pushMatrix();
  translate(width/2, height/2);
  rotate(-PI/10);
  translate(-width/2, -height/2);
  textSize(950);
  fill(random(0, 255), random(0, 255), random(0, 255));
  text("DRAG!", -690, -100, -500);
  popMatrix();
}


void mouseDragged() {
  // font = loadFont("Verdana-10.vlw");
  // textFont(font, 10);
  textSize(10);
  for (int i =0; i < 87; i++) {
    fill(random(0, 255), random(0, 255), random(0, 255));
    text("SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM SOLAR SYSTEM ", 0, i*10);
  }
  planetColor1 = color(random(0, 255), random(0, 255), random(0, 255)); //planet color
  planetColor2 = color(random(0, 255), random(0, 255), random(0, 255));
  planetColor3 = color(random(0, 255), random(0, 255), random(0, 255));
  // planetColor4 = color(random(0, 255), random(0, 255), random(0, 255));
  planetColor5 = color(random(0, 255), random(0, 255), random(0, 255));
  planetColor6 = color(random(0, 255), random(0, 255), random(0, 255));
  planetLine = color(random(0, 255), random(0, 255), random(0, 255)); //Orbit line color
}

void mouseReleased() {
  planetColor1 = color(214, 58, 58); //planet color
  planetColor2 = color(58, 199, 214);
  planetColor3 = color(221, 224, 72);
  // planetColor4 = color(72, 149, 229);
  planetColor5 = color(240, 165, 53);
  planetColor6 = color(196, 124, 232); 
  planetLine = (255); //Orbit line color
  background(20);
}

//meteo class
class meteo {
  float xpos, ypos, zpos, rotation, meteoSize, meteoSpeedX, meteoSpeedY, meteoSpeedZ;
  meteo (float x, float y, float z, float r, float sizeM, float speedX, float speedY, float speedZ) {
    xpos = x;
    ypos = y;
    zpos = z;
    rotation = r;
    meteoSize = sizeM;
    meteoSpeedX = speedX;
    meteoSpeedY = speedY;
    meteoSpeedZ = speedZ;
  }
  void update() {
    xpos = xpos + meteoSpeedX;
    ypos = ypos + meteoSpeedY;
    zpos = zpos + meteoSpeedZ;
    rotation = rotation + 0.1;
    //set the limit
    if (xpos > width + meteoSize || ypos > height + meteoSize) {
      xpos = -50;
      ypos = -50;
      rotation = random(-90, 90);
      meteoSize = random(10, 20);
      meteoSpeedX = random(0, 2);
      meteoSpeedY = random(0, 2);
      meteoSpeedZ = random(-2, 2);
    }
    pushMatrix();
    translate(xpos, ypos);
    rotateZ(rotation);
    fill(random(0, 255), random(0, 255), random(0, 255));
    sphere(meteoSize);
    popMatrix();
  }
}

//earth&moon class
class earth {
  float earthSize, moonXpos, moonYpos, moonDist, moonSize, velocity;
  earth (float sizeE, float x, float y, float d, float sizeM, float v) {
    earthSize = sizeE;
    moonXpos = x;
    moonYpos = y;
    moonDist = d;
    moonSize = sizeM;
    velocity = v;
  }

  void update() {
    velocity++;
    moonXpos = moonDist*cos(radians(velocity))*1.3;
    moonYpos = moonDist*sin(radians(velocity)); 

    pushMatrix();
    translate(width/2, height/2);
    rotateX(velocity/100);
    rotateY(velocity/100);
    rotateZ(velocity/100);
    noStroke();
    fill(72, 149, 229);
    sphere(earthSize);
    noFill();
    stroke(255);
    strokeWeight(2);
    ellipse(0, 0, moonDist*2*1.3, moonDist*2);
    translate(moonXpos, moonYpos);
    fill(251, 252, 232);
    noStroke();
    sphere(moonSize);
    translate(-width/2, -height/2);
    popMatrix();
  }
}



//jupiter class
class jupiter {
  float jupiterDist, velocity;
  jupiter (float d, float v) {
    jupiterDist = d;
    velocity = v;
  }

  void update() {
    velocity++;
    rotateX(velocity/100);
    rotateY(velocity/100);
    rotateZ(velocity/100);
    noFill();
    stroke(255);
    strokeWeight(7);
    ellipse(0, 0, jupiterDist*2, jupiterDist*2);
  }
}
