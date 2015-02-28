
PFont myFont;
float xx;
float yy;

void setup() {
  size(500,500);
  myFont=loadFont("Krungthep-25.vlw");
  xx=0;
  yy=0;
  textSize(20);
}

void draw() {
  background(0);
  landingPlatform();
     makePlanets();
    yy=yy+1;
  if (xx<=90 && xx>=22 && yy==476) {
    yy=475;
  }
    else if (xx<=21 && yy>=490) {
      background(0);
       fill(255);
      text("Your mother and I are disappointed in you.",40,height/2); 
    }
    else if (xx>=91 && yy>=490) {
      background(0);
       fill(255);
      text("Your mother and I are disappointed in you.",40,height/2);
    }
    makeSpaceship();
  keyPressed();

  
}

void makeSpaceship() {
  noStroke();
  fill(255);
  rect(209+xx,8+yy,2,10);
  rect(219+xx,8+yy,1,9);
  rect(229+xx,8+yy,2,10);
    fill(228,235,253);
  ellipse(220+xx,7+yy,7,12);
  fill(231,15,15);
  ellipse(220+xx,10+yy,25,9);
}

void keyPressed() {
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

void landingPlatform() {
  noStroke();
  fill(39,122,55);
  rect(254,490,75,20);
}

void makePlanets() {
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
