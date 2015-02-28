
Parachute[] theParachuters = new Parachute[10];
int count = 5;
int points = 0;

PFont f = createFont ("CrappyDan", 96, true);

water theWater;
water2 theWater2;
boat theBoat;


int r = 145;
int e = 490;

void setup() {
  size(480, 640);
  smooth();
  theWater = new water();
  theWater2 = new water2();
  theBoat = new boat();
  // Parameters go inside the parentheses when the object is constructed. 
  for (int i=0; i<theParachuters.length; i++) {
    theParachuters[i] = new Parachute(color(255), random(10, width-10), random(-1000, -50), 2);
  }
}

void draw() {
  background(206, 235, 236);
  textFont (f);
  fill(249, 193, 146);
  if (points >=0 && points < 101) {
      text(points , 40, 80);
  }    
  theWater.display();
  theWater2.display();
  theBoat.display();

  if (keyPressed) {
    if (keyCode == LEFT) {
      theBoat.x -=2;
    }
    if (keyCode == RIGHT) {
      theBoat.x +=2;
    }
  }



  for (int i=0; i<count; i++) {
    theParachuters[i].drive();
    theParachuters[i].display();
  }
}

void mousePressed() {
  points = 0;
}

// Even though there are multiple objects, we still only need one class. 
// No matter how many cookies we make, only one cookie cutter is needed.
class Parachute { 
  color c;
  float xpos;
  float ypos;
  float xspeed;

  // The Constructor is defined with arguments.
  Parachute(color tempC, float tempXpos, float tempYpos, float tempXspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;

    theWater.display();
    theWater2.display();
    theBoat.display();
  }
  

  void display() {

    pushMatrix();
    translate(xpos-105, ypos-150);
    fill (0,167,157);
    strokeWeight (1.5);
    stroke (0,167,157);
    arc(105, 35, 30, 30, -PI, 0); // upper half of circle
    line (119.5,36,105, 65); 
    line (91,36,105, 65);
    line (105, 34, 105, 65);
    //person
    fill (206, 235, 236); 
    strokeWeight (1.5);
    stroke (0);
    ellipse (105, 55+7, 10, 10);
    line (105, 55+11, 105, 85+7);
    line (105, 71+7, 112, 68+7);
    line (105, 71+7, 96, 68+7);
    line (105, 91, 100, 97);
    line (105, 91, 110, 97);
    popMatrix();
  }

  void drive() {
    ypos = ypos + xspeed;

    // boat
    if (ypos > 468+70 && xpos > theBoat.x && xpos < theBoat.x + 124) {
      points +=5;
      xpos = random(10, width-10);
      ypos = random(-1000, -50);
    }


    // hit the water
    if (ypos > height) {
      xpos = random(10, width-10);
      ypos = random(-1000, -50);
      points -=3;
    }
    
    fill(0);
    if (points >= 100) {
      textSize(35);
      text ("You Win!" , 160, 200);
      text ("Click to play again", 90, 240);
    }
    if (points < 0 ) {
      textSize(35);
      text ("You Lose!" , 157, 200);
      text ("Click to play again", 90, 240);
    }
    //println(ypos);
  }
}





//water______________________________
class water {
  void display () {
    noStroke();
    fill(44,42,112);
    rect(0,490, 480, 151);

    fill(206,235,236);
    ellipse(94, e, r, r);
    ellipse(239, e, r, r);
    ellipse(385, e, r, r);
    ellipse(-53, e, r, r);
    ellipse(531, e, r, r);
  }
}
//water2__________________________
class water2 {
  void display () {
    noStroke();
    fill(44,42,112);
    rect(0,490, 480, 151);

    fill(206,235,236);
    ellipse(94, e, r, r);
    ellipse(239, e, r, r);
    ellipse(385, e, r, r);
    ellipse(-53, e, r, r);
    ellipse(531, e, r, r);
  }
}
//boat_______________________
class boat {

  float x;

  void display() {



    pushMatrix();

    translate(x, 0);

    strokeWeight (3);
    fill(255);
    stroke (255,0,0);
    quad (20, 468+35, 58, 514+35, 144, 514+35, 175, 468+35);
    triangle (66, 345+35, 30, 462+35, 66, 462+35);
    quad (74, 320+35, 74, 462+35, 81, 462+35, 81, 320+35);
    triangle (87, 344+35, 87, 463+35, 169, 463+35);
    triangle (81, 320+35, 105, 328+35, 81, 336+35);

    popMatrix();
  }
}


