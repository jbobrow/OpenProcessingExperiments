
/*
T.J. Callahan
 ARTS-4010 IAP Homework 1
 due 2/14/2013
 
 "Snow" effect created using Soracco's 3d snow sketch as reference
 http://www.openprocessing.org/sketch/42364
 
 Reaper is a character from Buttercup Festival by David Troupes
 http://www.buttercupfestival.com
 
 */

float x=random(100);
float y=random(100);
float z=random(100);

class flake {
  float diam;
  float xpos;
  float ypos;
  float yspd;
  float xspd;
  float level;
  
  void update() {
    ypos=ypos+yspd;
    if (ypos>height) ypos=0;
    if (xpos>width+10) xpos=0;
    
    xpos=xpos+xspd+mouseX*.005;
    
    fill(255, level);
    ellipse(xpos, ypos, diam+mouseY*.007, diam+mouseY*.007);
  }
}

flake[] snowflakes= new flake[200];

void setup()
{
  size(900, 544);
  smooth();

  for (int i=0; i<200; i++) {
    snowflakes[i] = new flake();
    snowflakes[i].diam=random(5, 10);
    snowflakes[i].xpos=random(-50, width+50);
    snowflakes[i].ypos=random(0, height);
    snowflakes[i].yspd=random(1, 3);
    snowflakes[i].xspd=random(1, 1.5);
    snowflakes[i].level=random(100, 255);
  }
}

void draw() {

  float arm1=constrain(mouseX*.4, 190, 300);
  float arm2=constrain(mouseY, 286, 486);


  background(x, y, z);
  noStroke();

  for (int i=0; i<200; i++) {
    snowflakes[i].update();
  }
  fill(#FFFFFF);
  arc (200, 300, 120, 120, PI, 1.7*PI);
  triangle(200, 290, 140, 320, 230, 320);
  triangle(203, 294, 235, 251, 230, 320);
  triangle(185, 310, 150, 440, 195, 440);
  quad(150, 440, 195, 440, 195, 540, 144, 540);
  arc(168, 575, 90, 90, 1.24*PI, 1.76*PI);

  fill(x, y, z);
  ellipse(245, 285, 70, 120);


  for (int i=0; i<200; i++) {
    snowflakes[i].update();
  }

  stroke(255);
  strokeWeight(5);
  line(190, 386, arm1, arm2);
  line(190, 386, 230, 420);

  line(230, 540, 230, 350);

  noFill();
  arc(230, 450, 200, 200, 1.5*PI, 1.84*PI);
  arc(230, 491, 250, 250, 1.5*PI, 1.74*PI);

  line(arm1, arm2, arm1+15, arm2+15);
  line(arm1, arm2, arm1+20, arm2);
  line(arm1, arm2, arm1+15, arm2-15);

  //background(random(255));
}


/*
void mousePressed(){
 print(mouseX);
 print(" ");
 print(mouseY);
 print(" ");
 }
 */

