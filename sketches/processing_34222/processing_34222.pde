
boolean line1 = false;
boolean rectangle = false;
boolean ellipse1 = false;
boolean red1 = false;
boolean green1 = false;
boolean purple = false;
boolean number = false;
int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0;
PFont bootFont;
PImage plane;
PImage plane2;
PImage cloud1;
PImage cloud2;
PImage cloud3;

float vel=1;
//int arraySize = 3;
//int [] Pos = {10,10};
float xx=10;

void setup() {

  size(800, 800);
  background(0);
  smooth();
  plane = loadImage("plane.png");
  plane2 = loadImage("plane2.png");
  cloud1 = loadImage("cloud1.png");
  cloud2 = loadImage("cloud2.png");
  cloud3 = loadImage("cloud3.png");
  ;
} 

void draw() {
  PImage sky;
  sky = loadImage("sky.jpeg");
  image(sky, 0, 0);

  fill(0, 3);
  rect(0, 0, width, height);
  xx+=vel;
  image(cloud1, xx+550, 100);
  image(cloud2, xx, 500);
  image(cloud3, xx-100, 300);
  if (xx <0 || xx>width+50) {
    vel*=-1;
  }
  //-----------------------------------------------hide mouse
  if (mousePressed == false) {
    noCursor();
  }
  else {
    cursor();
  }




  //-------------------------------------------------text
  bootFont = createFont("Helvetica", 10, true);
  textFont(bootFont);
  text("BOOTCAMP", 650, 800);
  //  fill(0, 3);
  //  noStroke();
  //  rect(0, 0, height, width);


  //------------------------------------------------plane number
  //  if(number==true){
  //  if (key=='t') {
  //     if (number == false) {
  //       number = true;
  //     }
  //      else {
  //        number = false;
  //      } 
  //     println(number);
  //    }
  //  
  //    if (number==true) {
  //      if (key=='2') {
  // 
  //       image(plane2, mouseX, mouseY-50);
  //     }
  //  }
  //   if (number==true) {
  //     if (key=='1') {
  //        image(plane, mouseX, mouseY-50);
  //     }
  //      if (key=='2') {
  //        image(plane, mouseX, mouseY-50);
  //        image(plane, mouseX, mouseY);
  //      }
  //   }
  //
  //  }


  //line control------------------------------------change color

  if (line1==true) {
    if (key=='z') {
      for (int i=0;i<100 && i<clicks; i++) {
        if (i>0) { 
          stroke(254, 0, random(255));
          strokeWeight(5);
          line(xPos[i-1], yPos[i-1], mouseX, mouseY);
          line(mouseX, mouseY, pmouseX, pmouseY);
        }
      }
    }
    if (key=='x') {
      stroke(255, 255, random(255));
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (key=='c') {
      stroke(0, 255, random(255));
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (key=='v') {
      stroke(random(255), random(255), random(255));
      strokeWeight(random(0, 25));
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
  }


  //rectangle control------------------------------------change color

  if (rectangle==true) {
    if (key=='z') {
      fill(254, 0, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
    if (key=='x') {
      fill(255, 255, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
    if (key=='c') {
      fill(0, 255, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
    if (key=='v') {
      fill(random(255), random(255), random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
  }


  //circle control------------------------------------change color  

  if (ellipse1==true) {
    if (key=='z') {
      fill(254, 0, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (key=='x') {
      fill(255, 255, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (key=='c') {
      fill(0, 255, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (key=='v') {
      fill(random(255), random(255), random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
  }

  //-----------------------------------------------  load image

  //    noStroke();
  //    fill(0,100);
  //    rect(0, 0, height, width);

  println("line = " + line1 + " | rect = " + rectangle + " | ellipse = " + ellipse1 + " | red = " + red1 + "| number = "+ number);

  tint(255, 30);

  image(plane, mouseX, mouseY-50);
}

void keyPressed() {
  if (key=='a') {
    if (line1 == false) {
      line1 = true;
    }
    else {
      line1 = false;
    }
  }
  if (key=='d') {
    if (ellipse1 == false) {
      ellipse1 = true;
    }
    else {
      ellipse1 = false;
    }
  }
  if (key=='s') {
    if (rectangle == false) {
      rectangle = true;
    }
    else {
      rectangle = false;
    }
  }
}




void mousePressed() {
  xPos[clicks]= mouseX;
  yPos[clicks]= mouseY;
  clicks++;
}


