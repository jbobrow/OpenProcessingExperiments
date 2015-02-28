
//created by Eric Morrison

Cloud cloud1, cloud2, cloud3, cloud4, cloud5, cloud6;

int ref;


void setup() {
  size(600, 600);
  frameRate(30);
  cloud1=new Cloud(-50, 1.5);
  cloud2=new Cloud(-150, 1.4);
  cloud3=new Cloud(-250, 1.3);
  cloud4=new Cloud(-350, 1.2);
  cloud5=new Cloud(-450, 1.1);
  cloud6=new Cloud(-550, 1);
}

void draw() {

  printMouse();
  //sky
  background(159, 183, 255);
  fill(0, 0, 0, transparency);
  rect(0, 0, width, 300);

  sun();

  //mountains
  noStroke();
  fill(#D7D9FA);
  triangle(200, 300, 390, 280, 500, 300);
  fill(#C5C9FA);
  triangle(400, 300, 500, 270, 650, 300);
  triangle(-40, 300, 50, 270, 150, 300);



  //clouds
  cloud1.display();
  cloud1.move();
  cloud2.display();
  cloud2.move();
  cloud3.display();
  cloud3.move();
  cloud4.display();
  cloud4.move();
  cloud5.display();
  cloud5.move();
  cloud6.display();
  cloud6.move();


  //ground
  stroke(1);
  fill(#24990C);
  rect(0, 300, width, height);

  //frame of house
  fill(#F7EDA8);

  //front face
  rect(100, 200, 200, 200);

  //right side face
  quad(300, 200, 300, 400, 350, 350, 350, 250);

  //left add on
  rect(65, 320, 35, 70);

  //roof side
  fill(#858585);
  quad(250, 135, 300, 200, 350, 250, 313, 200);

  //roof front
  quad(95, 205, 305, 205, 250, 135, 150, 135);

  //side roof left
  triangle(100, 290, 100, 320, 60, 320);

  //front step
  fill(#A8A8A8);
  rect(120, 393, 40, 10);

  //side of front step
  quad(160, 403, 165, 400, 165, 391, 160, 393);

  //top of front step
  quad(120, 393, 160, 393, 165, 391, 124, 391);

  //door
  fill(#A1774A);
  rect(124+2, 391-75, 40-4, 75);

  //door knob
  fill(#A8A8A8);
  ellipse(156, 370, 5, 5);

  //driveway
  fill(#525252);
  quad(200, height, 600, height, 450, 400, 350, 400);

  //windowLeftFirstFloor- fill will change with time
  fill(#ADD6FF);
  rect(180, 320, 35, 55);
  line(180, 320+(55/2), 180+35, 320+(55/2));

  //windowRightFirstFloor
  rect(240, 320, 35, 55);
  line(240, 320+(55/2), 240+35, 320+(55/2));

  //windowRightSecondFloor
  rect(240, 230, 35, 55);
  line(240, 230+(55/2), 240+35, 230+(55/2));

  //windowMiddleSecondFloor
  rect(180, 230, 35, 55);
  line(180, 230+(55/2), 180+35, 230+(55/2));

  //windowLeftSecondFloor
  rect(120, 230, 35, 55);
  line(120, 230+(55/2), 120+35, 230+(55/2));

  //windowAddOn
  rect(70, 330, 15, 50);
  rect(90, 330, 10, 50);

  //shrubbery
  stroke(0);
  fill(#13AB05);
  ellipse(200, 400, 40, 30);
  ellipse(260, 400, 40, 30);
  ellipse(90, 400, 40, 30);
  triangle(315, 390, 335, 200, 365, 390);

  //night time darkness
  fill(0, 0, 0, transparency*.75);
  rect(0, 0, width, height);

  if (transparency>100) {

    //windowLeftFirstFloor- fill will change with time
    fill(#FFFED9);
    rect(180, 320, 35, 55);
    line(180, 320+(55/2), 180+35, 320+(55/2));
    //windowRightFirstFloor
    rect(240, 320, 35, 55);
    line(240, 320+(55/2), 240+35, 320+(55/2));
    //windowRightSecondFloor
    rect(240, 230, 35, 55);
    line(240, 230+(55/2), 240+35, 230+(55/2));
    //windowMiddleSecondFloor
    rect(180, 230, 35, 55);
    line(180, 230+(55/2), 180+35, 230+(55/2));
    //windowLeftSecondFloor
    rect(120, 230, 35, 55);
    line(120, 230+(55/2), 120+35, 230+(55/2));
    //windowAddOn
    rect(70, 330, 15, 50);
    rect(90, 330, 10, 50);
    
    if (transparency>150) {

      //windowLeftFirstFloor- fill will change with time
      fill(#0A243D);
      rect(180, 320, 35, 55);
      line(180, 320+(55/2), 180+35, 320+(55/2));
      //windowRightFirstFloor
      rect(240, 320, 35, 55);
      line(240, 320+(55/2), 240+35, 320+(55/2));
      //windowRightSecondFloor
      rect(240, 230, 35, 55);
      line(240, 230+(55/2), 240+35, 230+(55/2));
      //windowMiddleSecondFloor
      rect(180, 230, 35, 55);
      line(180, 230+(55/2), 180+35, 230+(55/2));
      //windowLeftSecondFloor
      rect(120, 230, 35, 55);
      line(120, 230+(55/2), 120+35, 230+(55/2));
      //windowAddOn
      rect(70, 330, 15, 50);
      rect(90, 330, 10, 50);
    }
  }
}






class Cloud {

  float cloudX, cloudY, r;

  Cloud(float moveCloud, float rate) {
    println(r);
    cloudY=150;
    r=rate;
    cloudX=moveCloud;
  }

  void display() {
    noStroke();
    fill(255, 255, 255, 200);
    ellipse(cloudX, cloudY, 200, 60);
  }

  void move() {
    cloudX+=r;
    if (cloudX>width+100) {
      cloudX=-100;
      cloudY=random(20, 200);
    }
    if (cloudX<0-100)
      cloudY=random(20, 200);
  }
}





void printMouse() {
  //just to help me draw

  println (mouseX +"," + mouseY +","+ ySun);
}

// Sun Variables
int sunRadius = 40;      // size of the sun
int xStart = -sunRadius; // The initial x position
int yStart = 20;         // The initial y position
float xSun = xStart;     // the x position of the sun
float ySun = yStart;     // the y position of the sun

// Arc variables
float t = 0;   // Start time
float duration = 60 * 1000; // Complete a full circle every 60 seconds
float conversionFactor = 2 * 3.14 / duration; // A full circle (2*pi) occurs every duration milliseconds
float transparency;

void sun()
{

  // Draw the sun
  noStroke();
  fill( 247+50, 199+50, 114+50);
  ellipse(xSun, ySun, sunRadius, sunRadius);

  // Update position
  // this method traces a curve using a parametric equation. See http://en.wikipedia.org/wiki/Parametric_equation and Khan Academy
  // To change the speed, adjust the value added to t
  t += 0.01;

  // Convert t to radians
  t = millis() * conversionFactor;

  // Use the parametric form for an ellipse. This method uses constant angular velocity
  float Rx = width/2 + sunRadius/2;
  float Ry = height/2 - sunRadius/2;
  float centerX = width/2;
  float centerY = height/2;
  xSun = cos(t) * Rx + centerX;
  ySun = sin(t) * Ry + centerY;



  transparency=map(ySun, 200, height, 0, 255);

  for (int starX=0; starX > width; starX += random(10)) {
    for (int starY=0; starY > height; starY += random(10)) {
      stroke(255, 255, 255, -1*transparency);
      fill(255, 255, 255, -1*transparency);
      noSmooth();
      point(starX, starY);
    }
  }
}



