
float xx;
float yy;

void setup() {
  size(500,500);
  xx=0;
  yy=0;
}

void draw() {
  background(0);
  landingPlatform(); //green area function
   if (xx<=65 && xx>=22 && yy==497) { //reward message between two x-axis points
    println("Nice job, cadet!");
  }
    else if (xx<=21 && yy==498) {
      println("Your mother and I are disappointed in you."); //and game loss message on left side
    }
    else if (xx>=66 && yy==498) {
      println("Your mother and I are disappointed in you."); //game loss message on right side
    }
     makePlanets(); //background planets and stars
    yy=yy+1; //movement
  makeSpaceship(); //spaceship function
  keyPressed(); //arrow keys function

  
}

void makeSpaceship() { //makes a spaceship
  noStroke();
  fill(255);
  rect(209+xx,8+yy,2,10); //legs
  rect(219+xx,8+yy,1,9);
  rect(229+xx,8+yy,2,10);
    fill(228,235,253);
  ellipse(220+xx,7+yy,7,12); //ship parts
  fill(231,15,15);
  ellipse(220+xx,10+yy,25,9);
}

void keyPressed() { //if left arrow pressed move ship left, and right if right arrow pressed
  if (key == CODED) {
    if (keyCode == LEFT)
    {
      xx=xx-1;
    }
  }
    if (keyCode == RIGHT)
    {
      xx=xx+1;
    }
    }

void landingPlatform() { //green "safe" landing area
  noStroke();
  fill(39,122,55);
  rect(254,495,75,22);
}

void makePlanets() { //a bunch of stars and planets
  noStroke();
  fill(255);
  ellipse(264,136,3,3);
  ellipse(473,193,3,3);
  ellipse(274,45,3,3);
  ellipse(426,58,3,3);
  ellipse(218,275,3,3);
  ellipse(253,12,3,3);
  ellipse(56,22,3,3);
  ellipse(375,382,3,3);
  ellipse(134,456,3,3);
  ellipse(57,480,3,3);
  ellipse(35,374,3,3);
  fill(88,39,122);
  ellipse(367,289,78,78);
  fill(240,162,25);
  ellipse(78,146,230,230);
}
