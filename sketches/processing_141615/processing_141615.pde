
float sw = 0;
float speed = 0;
float accel = 0;
float inkhue = 0;
int brght = 99;
int brght2 = 0;
int sat = 25;
int clearing = 0;
float clearspeed = 0.75;
boolean button1 = true;
boolean button2 = false;

void setup(){
  size(500, 650);
  background(255);
  smooth();
}

void draw() {
  colorMode(HSB, 359, 99, 99, 99);


//DRAWING WITH MOUSE----- 

  //create transparent rect for fade effect
  noStroke();
  fill(0, 0, 99, clearspeed);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
  //x-axis speed determines thickness of line
//  speed = abs(mouseX-pmouseX);
//  speed = constrain(speed, 0, 25);
//  sw = abs(speed-25);
//  sw = constrain(sw, 1, 25);
  speed = 
  sw = brushStroke();
  
  //color and width of inkhue
  stroke(inkhue, 100, brght);
  strokeWeight(sw);
  
  //draw line when mouse is pressed
  if (mousePressed && mouseY<height-40) {
    line(pmouseX,pmouseY,mouseX,mouseY);
  }

  //change ink color if mouse is pressed, moving, and colored mode
  if (mousePressed && speed>0 && button1==true) {
    inkhue = inkhue + 0.75;
  }
  
  //ink color loop
  if (inkhue >= 359) {
    inkhue = 0;
  }
  



//BUTTONS AND GRAPHICS------

  //panel graphic
  noStroke();
  fill(40, sat, brght2, 15);
  rect(width/2, height-20, width, 40);
  
  //circle button graphic
  noStroke();
  fill(inkhue, 100, brght);
  ellipse(20,height-20,20,20);
 
  //square button graphic
  colorMode(HSB);
  fill(0, 0, 60);
  rectMode(CENTER);
  rect(50, height-20, 20, 20);
    
  //hover to highlight buttons
  if (mouseX>10 && mouseX<30 &&
      mouseY>height-30 && mouseY<height-10) {
    fill(0, 0, 100, 50);
    ellipse(20,height-20,20,20);
      }
      
  if (mouseX>30 && mouseX<70 &&
      mouseY>height-30 && mouseY<height-10) {
    fill(0, 0, 100, 50);
    rect(50,height-20,20,20);
      }
      
  //change brightness and saturation when circle button is pressed
  if (button1==true) {
    brght = 100;
    brght2 = 100;
    sat = 25;
  } else {
    brght = 0;
    brght2 = 70;
    sat = 0;
  }

  //clear screen when square button is pressed
  if (button2) {
    clearspeed = 25;
    clearing = clearing+1;
    if (clearing==20) {
      button2 = !button2;
      clearspeed = 0.75;
      clearing = 0;
    }
  }
  



//DEBUGGING-----

//  println("brght = " + brght);
//  println("inkhue = " + inkhue);
  //println("sw = " + sw + " speed = " + speed);
//  println("clearspeed = " + clearspeed);

}
//--end of draw()

//function definitions

float brushStroke(){
  float speed = (abs(mouseX-pmouseX) + abs(mouseY-pmouseY))/5; 
  speed = constrain(speed, 1, 100);
  speed *= -1;
  sw += speed + 3;
  sw = constrain(sw, 2, 25);
  //println("instSpeed = " + speed + "   sw = " + sw);
  return sw;
}

void mousePressed() {
  //toggle circle button
  if (mouseX>10 && mouseX<30 &&
      mouseY>height-30 && mouseY<height-10) {
    button1 = !button1;
    }

  //toggle square button
  if (mouseX>30 && mouseX<70 &&
      mouseY>height-30 && mouseY<height-10) {
    button2 = !button2;
    }
}

void keyPressed(){
  if (keyCode==32) button2 = !button2;
}
