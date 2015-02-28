
//homework #3  //ICM Rozin Rozin Tue 9:30-12
// Alex Samoilescu
// Melissa A. dela Merced  mdm532@nyu.edu

float core = 249;
float coreD = 250;
float a = mouseX;
float b = mouseY;
int w = 20;
int soup = 0;

void setup() {
  size(720, 480);
  background (0);
  smooth();

  //placemat
  fill(111, 19, 9);
  rect(50, 50, 620, 400);

  //chopsticks top
  fill(0);
  noStroke();
  triangle(150, 500, 350, 500, 350, 520);

  //bowl
  stroke(0);
  noFill();
  fill(54, 37, 14);
  strokeWeight(10);
  ellipse(core, core, coreD, coreD);

  noFill();
  //fill(80, 55, 23);
  ellipse(core, core, 225, 225);
}

void draw() {
  if (mouseX < (core+75) && mouseX > 175 && mouseY <(core + 75) && mouseY > 175) {
    if (keyPressed) {
      if (key == 'e' || key =='E') {   //eggs
        noStroke();
        fill(255);
        ellipse(mouseX, mouseY, 45, 65);
        fill(255, 194, 70);
        ellipse(mouseX, mouseY+5, 35, 35);
      }
    }
    else {

      noStroke();               //soup 
      fill(240, random(204, 232), random(149, 39), 2);
      ellipse(249, 249, 200, 200);
    }
  }
  if (mouseX < (core+75) && mouseX > 175 && mouseY <(core + 75) && mouseY > 175) {
    if (keyPressed) {
      if (key =='o' || key =='O') {
        fill(46, 180, 16);        //spring onions
        stroke(46, 180, 16);
        strokeWeight(1);
        noFill();
        //  core = core + 1;
        //   b = b - 2;
        ellipse(mouseX, mouseY, w, w);
      }
    }
    else {
      int soup = 0;
      while (soup < 50) {
        noStroke();       
        float distance = abs(mouseX - soup);  
        //soup 
        fill(240, distance, random(100, 111), 2);
        ellipse(249, 249, 200, 200);
        soup += 10;
      }
    }
    //soup 
    noStroke();
    fill(240, random(204, 232), random(149, 39), 2);
    ellipse(249, 249, 200, 200);
  }

  /*  if (mouseX < (core+75) && mouseX > 175 && mouseY <(core + 75) && mouseY > 175) {
   if (keyPressed) {
   if (key =='c' || key =='C') {
   fill(random(152,255), random(26, 33), 10);        //chili pepper
   stroke(
   point(mouseX, mouseY);
   //  core = core + 1;
   //   b = b - 2;
   //  ellipse(mouseX, mouseY, w, w);
   }
   }
   else {
   
   int soup = 0;
   while (soup < 50) {
   noStroke();       
   float distance = abs(mouseX - soup);  
   //soup 
   fill(240, distance, random(100, 111), 5);
   ellipse(249, 249, 200, 200);
   soup += 10;
   }*/

  //soup

  if (mouseX < (core+75) && mouseX > 175 && mouseY <(core + 75) && mouseY > 175) {
    if (mousePressed) { 

      //Draw ramen 
      stroke(229, 219, 14);
      strokeWeight(3);
      noFill();
      int x = mouseX;
      int y = mouseY;
      int d = 100;
      ellipse(x, y, d, d);
    }
    else {
      int soup = 0;
      while (soup < 50) {
        noStroke();       
        float distance = abs(mouseX - soup);  
        //soup 
        fill(240, distance, random(100, 111), 2);
        ellipse(249, 249, 200, 200);
        soup += 10;
      }

        //chopstick left

        noStroke();
        fill(0);
        triangle(310, 80, 380, 350, 390, 360);

        //chopstick right
        fill(0);
        triangle(315, 80, 390, 360, 400, 370);
    }
  }
   }



