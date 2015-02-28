
boolean line1 = false;
boolean rectangle = false;
boolean ellipse1 = false;
boolean red1 = false;
boolean green1 = false;
boolean purple = false;
//boolean number = false;
int xPos[]=new int [100];
int yPos[]=new int [100];
int clicks = 0;
PFont bootFont;


void setup() {
  size(800, 800);
  background(0);
  smooth();
} 

void draw() {

  bootFont = createFont("Helvetica", 60, true);
  textFont(bootFont);
  text("BOOTCAMP", 350, 400);
  fill(0, 3);
  noStroke();
  rect(0, 0, height, width);


  //------------------------------------------------plane number
  //  if (key=='t') {
  //    if (number == false) {
  //      number = true;
  //    }
  //    else {
  //      number = false;
  //    } 
  //    println(number);
  //  }
  //
  //  if (number==true) {
  //    if (key=='2') {
  //      PImage plane2;
  //      plane2 = loadImage("plane2.png");
  //      image(plane2, mouseX, mouseY-50);
  //    }
  //  }


  //line control------------------------------------change color

  if (line1==true) {
    if (key=='q') {
      for (int i=0;i<100 && i<clicks; i++) {
        if (i>0) { 
          stroke(254, 0, random(255));
          strokeWeight(5);
          line(xPos[i-1], yPos[i-1], mouseX, mouseY);
          line(mouseX, mouseY, pmouseX, pmouseY);
        }
      }

      //
      //      if (key=='3') {
      //        stroke(254, 0, random(255));
      //        line(pmouseX-10, pmouseY-10, mouseX, mouseY);
      //        line(pmouseX, pmouseY, mouseX, mouseY);
      //        line(pmouseX-20, pmouseY-20, mouseX, mouseY);
      //      }
    }
    if (key=='a') {
      stroke(255, 255, random(255));
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    if (key=='z') {
      stroke(0, 255, random(255));
      strokeWeight(5);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    //if(key == 'w'){
    //  strokeWeight(5);
    // }
    // if(key== 's'){
    //  strokeWeight(10);
    // }
  }


  //rectangle control------------------------------------change color

  if (rectangle==true) {
    if (key=='q') {
      fill(254, 0, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
    if (key=='a') {
      fill(255, 255, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
    if (key=='z') {
      fill(0, 255, random(255));
      noStroke();
      rect(mouseX, mouseY, 15, 15);
    }
  }


  //circle control------------------------------------change color  

  if (ellipse1==true) {
    if (key=='q') {
      fill(254, 0, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (key=='a') {
      fill(255, 255, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
    if (key=='z') {
      fill(0, 255, random(255));
      noStroke();
      ellipse(mouseX, mouseY, 20, 20);
    }
  }

  //-----------------------------------------------  load image

  //    noStroke();
  //    fill(0,100);
  //    rect(0, 0, height, width);

  println("line = " + line1 + " | rect = " + rectangle + " | ellipse = " + ellipse1 + " | red = " + red1);

  tint(255, 30);
  PImage plane;
  plane = loadImage("plane.png");
  image(plane, mouseX, mouseY-50);
}

void keyPressed() {
  if (key=='e') {
    if (line1 == false) {
      line1 = true;
    }
    else {
      line1 = false;
    }
  }
  if (key=='c') {
    if (ellipse1 == false) {
      ellipse1 = true;
    }
    else {
      ellipse1 = false;
    }
  }
  if (key=='d') {
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


