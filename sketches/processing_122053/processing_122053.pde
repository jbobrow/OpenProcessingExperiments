
import netscape.javascript.*;

//images for shoe sketch
PImage planetmercury, planetvenus, planetearth, planetmars, planetjupiter, planetsaturn, planeturanus, planetneptune;
PImage sun, hitop, analicia;
float x, y;

//floats for trig
float ynoise = 4;
float xnoise = 10;
float angle = 137.5;
float k = 10;
float i;
float Y;
float X;

//floats for ball
float xradius, yradius, xPos, yPos;

//floats for midterm mode
float z, speedX, speedY, XPos, YPos;

//floats for xPos
float xPos2, yPos2, speedX2, speedY2;

//float golden angle
float angle2 = 0;
float xradius2 = 0;
float yradius2 = 0;
float xpos, ypos;


//calls for collision
Boom[] boom;//
int id;

//class for shoe sketch
Ball mercury;
Ball venus;
Ball earth;
Ball mars;
Ball jupiter;
Ball saturn;
Ball uranus;
Ball neptune;

//font loads
PFont dialog;
PFont BPdots;
PFont abolition;




void setup() {
  size(800, 800);
  background(255);
  noStroke();


  BPdots = loadFont("BPdots-Bold-48.vlw");
  abolition = loadFont("Abolition-Sharp-48.vlw");


  //load for space
  sun = loadImage("sun.png");
  planetvenus = loadImage("planetvenus.png");
  planetneptune = loadImage("planetneptune.png");
  planetsaturn = loadImage("planetsaturn.png");
  planeturanus = loadImage("planeturanus.png");
  planetvenus = loadImage("planetvenus.png");
  planetjupiter = loadImage("planetjupiter.png");
  planetearth = loadImage("planetearth.png");
  planetmars = loadImage("planetmars.png");
  planetmercury = loadImage("planetmercury.png");


  //class for space
  //order  xrad, yrad, speed, x diameter, y diamter, picture
  jupiter = new Ball(150, 50, 9, 100, 100, "planetjupiter.png");
  mercury = new Ball(30, 30, 200, 20, 20, "planetmercury.png");
  venus = new Ball(50, 50, 50, 30, 30, "planetvenus.png");
  earth = new Ball(70, 70, 100, 40, 40, "planetearth.png");
  mars = new Ball(100, 100, 50, 20, 20, "planetmars.png");
  saturn = new Ball(200, 200, 12, 180, 90, "planetsaturn.png");
  uranus = new Ball(230, 230, 8, 100, 80, "planeturanus.png");
  neptune = new Ball(250, 250, 10, 80, 80, "planetneptune.png");

  //image for bullshit
  analicia = loadImage("analicia.jpg");

  //collision theory info
  boom = new Boom[150];
  for (int i=0; i < boom.length; i++) {
    boom[i] = new Boom(random(1000), random(1000), i);


    //midterm info
    XPos = 1;
    YPos = 3;
    speedX = 10;
    speedY = 5;

    //xPos setup
    xPos2 = 1;
    yPos2 = 3;
    speedX2 = 5;
    speedY2 = 10;


    //hitop image needed for all sketches
    hitop = loadImage("hitop.png");
  }

  fill(0);
  rect(120, 200, 600, 400);
}


void draw () {



  //mode for collision and space
  if (mousePressed == true && mouseX>50 && mouseX<150 && mouseY>50 && mouseY<100) {
    MyMode1();
  }
  if (mousePressed == true && mouseX>250 && mouseX<350 && mouseY>50 && mouseY<100)
  {
    MyMode2();
  }

  if (mousePressed == true && mouseX>550 && mouseX<650 && mouseY>130 && mouseY<230)
  {
    MyMode4();
  }
  if (mousePressed == true && mouseX>350 && mouseX<450 && mouseY>130 && mouseY<230)
  {
    MyMode5();
  }
  if (mousePressed == true && mouseX>150 && mouseX<250 && mouseY>130 && mouseY<230)
  {
    MyMode6();
  }

  if (mousePressed == true && mouseX>200 && mouseX<300 && mouseY>700 && mouseY<750)
  {
    MyMode7();
  }
  if (mousePressed == true && mouseX>650 && mouseX<750 && mouseY>50 && mouseY<100)
  {
    MyMode8();
  }
 


  textFont(abolition);
  textSize(19);

  //WHITE BOXES HIDING EXCESS
  fill(255);
  rect(0, 0, 120, 800);
  rect(680, 0, 200, 800);
  rect(0, 600, 800, 200);
  rect(0, 0, 830, 200);


  //BUTTONS
  fill(0);
  rect(50, 50, 100, 50);
  rect(250, 50, 100, 50);
  rect(450, 50, 100, 50);
  rect(650, 50, 100, 50);
  rect(550, 130, 100, 50);
  rect(350, 130, 100, 50);
  rect(150, 130, 100, 50);
  rect(200, 700, 100, 50);
  rect(500, 700, 100, 50);

  //text for buttons
  fill(255);
  text("Collision Theory", 55, 82);
  text("Space", 283, 82);
  text("Trig", 485, 82);
  text("BULLSHIT", 675, 82);
  text("Conditionals", 563, 164);
  text("xPos", 385, 164);
  text("Golden Ratio", 160, 164);
  textSize(27);
  text("RESET", 227, 735);
  text("SAVE", 527, 735);




  //calling hitop
  imageMode(CENTER);
  image(hitop, 400, 400);

  //mode for trig
  if (mousePressed == true && mouseX>450 && mouseX<650 && mouseY>50 && mouseY<100)
  {
    MyMode3();
  }




  //instruction text
  textSize(35);
  fill(0);
  text("Hold down an option to personalize your $hoez", 170, 650);
  
    if (mousePressed == true && mouseX>500 && mouseX<600 && mouseY>700 && mouseY<750) {
    MyMode9();
  }

}



class Ball {
  PImage myImg;
  float xPos, yPos, xradius, yradius, angle, speedX, speedY, x, y;
  Ball(int _xradius, int _yradius, int _speedX, int _X, int _Y, String imgName) {
    xPos =1;
    yPos = 2;
    xradius = _xradius;
    yradius = _yradius;
    angle = _speedX;
    speedX = _speedX;
    speedY = 10;
    x = _X;
    y = _Y;
    myImg = loadImage(imgName);
  }

  void display1() {

    float xPos = xradius * cos(radians(angle/10))+400;
    float yPos = yradius * sin(radians(angle/10))+400;
    image(myImg, xPos, yPos, x, y);
    angle+=speedX;
  }
}

//collison theory shoe class
class Boom {
  float  x, y, targetX, targetY, easing;
  float id;
  Boom (float _x, float _y, int _id) {
    x = _x;
    y = _y;
    id = _id;
    targetX= width/2;
    targetY= height/2;
    easing = .01;
  }


  void display() {
    float diffX = targetX - x;
    float diffY = targetY - y;
    x +=diffX*easing;
    y += diffY*easing;

    fill (255);
    ellipse(x, y, 5, 5);

    if (y>350 && y<4520 && x>350 && x<450) {
      easing*=-1;
    }
    else if (y>760 && y<750 || y>50 && y<100 || x>700 && x<750 ||x>50 && x<100) {
      easing = .01;
      x +=diffX*easing;
      y += diffY*easing;
      ellipse(x, y, 5, 5);
    }
  }

  void collision() {
    stroke(255);
    for (int i=0;i < boom.length; i++) {
      if (id !=i) {
        if (dist(x, y, boom[i].x, boom[i].y)<50) {
          line(boom[i].x, boom[i].y, x, y); //intersecting code
        }
      }
    }
  }
}

void MyMode8() {
  image(analicia, 300, 400);
  
  textFont(BPdots);
  fill(255);
  textSize(35);
  text("UM NO", 525, 482);
}

void MyMode9() {

  fill(255);
  rect(0, 0, 800, 200);
  rect(0, 600, 800, 200);

 textSize(30);
  fill(0);
  text("Rachel Ro$en$on Production$", 20, 50);
    text("#URWELCOME", 20, 100);

  textSize(50);
  fill(0);
  text("DA$ DOPE", 335, 650);

  if (mousePressed == true && mouseX>500 && mouseX<600 && mouseY>700 && mouseY<750)
    save("$HOEZ.jpg");
}

void MyMode6() {


  
  float xpos = (xradius2 * cos(radians(angle2))+200);
  float ypos = (yradius2 * sin(radians(angle2))+200);

  fill(0,0,0,20);
  stroke(2);
  fill(xpos/2, 0, ypos,10);
  ellipse(xpos, ypos, xpos/2, ypos/2);
  angle2+=137.5;//golden angle
  xradius2+= .75;
  yradius2 +=.75;
  
    //WHITE BOXES HIDING EXCESS
 strokeWeight(0);
  fill(255);
  rect(680, 0, 200, 800);
  rect(0, 600, 800, 200);
  rect(0, 0, 830, 200);

}

void MyMode4() {

/*
  //background mouse  conditional
  if (mouseX>300) {
    fill(0, 0, 255, 20);
  } 
  else {
    fill(255, 0, 0, 20);
  }
  rect(0, 0, 600, 600);

  //background mouse  conditional
  if (mouseY>300) {
    fill(0, 0, 255, 20);
  } 
  else {
    fill(255, 0, 0, 20);
  }
  rect(130, 10, 700, 600);
  */



  strokeWeight(1);
  stroke(255);
  line(mouseX/3, mouseY/3, 600, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 600, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 600, 600);

  stroke(255);
  line(mouseX/3, mouseY/3, 0, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 0, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 0, 600);

  //triangle starting from top 2 corners
  strokeWeight(100);
  stroke(255);
  line(mouseX/3, mouseY/3, 600, 0);
  stroke(255);
  line(mouseX/9, mouseY/9, 600, 0);
  stroke(255);
  line(mouseX/18, mouseY/18, 600, 0);

  stroke(255);
  line(mouseX/3, mouseY/3, 0, 600);
  stroke(255);
  line(mouseX/9, mouseY/9, 0, 600);
  stroke(255);
  line(mouseX/18, mouseY/18, 0, 600);






  //coordinate shapes and colors:
  y = mouseX;
  z = mouseY;
  noStroke();
  fill(0, mouseY, 0, 80);  
  triangle(100, 500, 500, 100, y, z);
  fill(mouseY, 0, 0, 80);
  triangle(600, 30, 30, 600, z, z);
  fill(0, 0, mouseX, 80);
  triangle(0, 125, 125, 0, z, y);
  fill(0, mouseX, 0, 80);
  triangle(450, 150, 150, 450, z, z);
  fill(mouseX, 0, 0, 80);
  triangle(150, 150, 200, 200, y, y);

  //variables and loops
  for (int i = 0; i < width; i += 10) {
    for (int j = 0; j < height; j+=10) {

      if (mouseX > i && mouseX < i+10 && 
        mouseY > j && mouseY < j+10) {
        fill(255);
      } 
      else {
        noFill();
      }
      rect(i, j, 10, 10);
    }
  }
      //WHITE BOXES HIDING EXCESS
 strokeWeight(0);
  fill(255);
  rect(680, 0, 200, 800);
  rect(0, 600, 800, 200);
  rect(0, 0, 830, 200);
}

void MyMode1() {

  fill(0);
  rect(120,200,560,400);
  for (int i=0;i < boom.length; i++) {
    boom[i].display();
    boom[i].collision();
  }
}



void MyMode7() {

  imageMode(CENTER);
  image(hitop, 400, 400);
  fill(0);
  rect(120, 200, 600, 400);
}


void MyMode2() {
fill(0);
  rect(120,200,560,400);
  image(sun, 400, 400);
  smooth();
  fill(0);
  rect(120, 200, 550, 400);
  //rotating planets
  mercury.display1();
  venus.display1();
  earth.display1();
  mars.display1();
  jupiter.display1();
  saturn.display1();
  uranus.display1();
  neptune.display1();

}

void MyMode3() {


  //instruction text
  textSize(35);
  fill(0);
  text("Hold down an option to personalize your $hoez", 170, 650);

  translate(350, 450);
  for (float i = 0; i<6; i++) {
    k+=i;

    X = k*i*1/10*(cos(noise(ynoise)*angle));
    Y = k*i*1/10*(sin(noise(xnoise)*angle));


    strokeWeight(.3);
    stroke(255);
    fill(245, 171, 240); 
    ellipse(X/150, Y/150, 10*i, 10*i);
    angle+=0.01;
  }
}

void MyMode5() {


  fill(xPos2/3, yPos2, 255);
  strokeWeight(20);
  stroke(xPos2/3, yPos2/3, 255);


  xPos2 += speedX;//movement
  if (xPos2 > width) {
    speedX2 *= -1;
  }

  if (xPos2 < 0) {
    speedX2 *= -1;
  }

  yPos2 += speedY2;
  if (yPos2 > height) {
    speedY2 *= -1;
  }

  if (yPos2 < 0) {
    speedY2 *= -1;
  }

  ellipse(xPos2/2, yPos2, 60, 20);
  ellipse(xPos2/6, yPos2/5, 70, 20);
  ellipse(xPos2/3, yPos2/2, 40, 20);
  ellipse(xPos2, yPos2, 50, 50);
  ellipse(xPos2/5, yPos2/3, 40, 20);
  ellipse(xPos2/7, yPos2, 50, 60);
  ellipse(xPos2, yPos2/2, 40, 30);


  //WHITE BOXES HIDING EXCESS
  strokeWeight(0);
  fill(255);
  rect(0, 0, 120, 800);
  rect(680, 0, 200, 800);
  rect(0, 600, 800, 200);
  rect(0, 0, 830, 200);
}



