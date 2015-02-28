
//Goofy Game
//robb godshaw
/// rsgodsha
//

float
goalX, goalY, 
coordX, coordY, 
goalcoordX, goalcoordY, 
easeX, easeY, 
inc = .03, //this determins how fast an eased object catches up with the mouse
breadth = 4, //number of wraps allowed?
gutter, //size of letterbox gutter
arenaHeigth, arenaWidth, 
begin, 
xpos, ypos, // Starting position of shape    
xspeed = 2.8, // Speed of the shape
yspeed = 2.2;  // Speed of the shape

boolean edge, scored;

PImage cookie;

color good, bad, bg;

int rad = 33;        // Width of the cookie
int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom
int score = 0, gameLegnth = 6;

void setup() {
  size(600, 600);
  smooth();
  background(0);
  noStroke();
  ellipseMode(RADIUS);
  bg = color(#222222);
  good = color(#00FF00);
  bad = color(#FF0000);
  //noCursor();//change so it shows up at the edge
  begin = 1;
  gutter = height*.15;
  arenaHeigth = height-2*gutter;
  arenaWidth = width-2*gutter;
  button();
  cursor(1);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
  cookie = loadImage("http://i.imgur.com/pChAW.gif");
}

void draw() {
  looop();
  easeCat();
  checkhit();
  maske();
  target();
  edgeWarn();
  gameOver();
}

void looop() {
  translate(gutter, gutter);//orgin should be of game area.
  fill(bg);
  rect(0, 0, width-2*gutter, height-2*gutter);
 
}

void edgeWarn() {
  edge = (gutter/8 > mouseX || gutter/8 > mouseY || width-gutter/8 < mouseX || height-gutter/8 < mouseY);
  if (edge) {
    bg=255;
    textSize(33);
    fill(0);
    text("MOUSE LOST.", 33, height/3);
  }
}


void gameOver() {
   text("score: " + score, 33, 33);
  if (score>gameLegnth) {
    colorMode(HSB);
    fill(frameCount%5, 255, 255,255);
    rect(-gutter, -gutter, width, height);
    fill(frameCount%5+127, 255, 255,255);
text("GAME OVER.", 0 , 100);
text("you got "+ (gameLegnth +1)+ " points", 0 , 150);
  }
}

void checkhit() {
  float d = dist(coordX, coordY, xpos, ypos);
  if (d<24+rad) {
    bg=good;

    if (!scored) {
      score++;
      println(score);
      scored = true;
    }
  }
  else {
    bg=bad;
    scored = false;
    // Draw the shape
    image(cookie, xpos-rad, ypos-rad, rad*2, rad*2);
  }
}



void button() {
  fill(#00FF00);
  rect(width/2, height/2, width/8, width/8);
}



void easeCat() {
  goalX = breadth*mouseX;   //goal is the goal of the ease function
  goalY = breadth*mouseY;  //breadth is how many times it can wrap
  easeX += (goalX - easeX)*inc;  //ease is the cat location after easeing
  easeY += (goalY - easeY)*inc;
  coordX = easeX % (width-2*gutter);   //coord is where it is actually rendered
  coordY = easeY %(height-2*gutter);
  goalcoordX = goalX % (width-2*gutter);   //coord is where it is actually rendered
  goalcoordY = goalY %(height-2*gutter);
  cats(coordX, coordY, .2); //renders 9 cats in 3x 3 grid
  c(goalcoordX, goalcoordY); //displays ease target, scaled
}

void maske() {//hide extra cats
  fill(#222222);
  rect(-gutter, -gutter, width, gutter);
  rect(-gutter, -gutter, gutter, height);
  rect(width-2*gutter, -gutter, width, height);
  rect(-gutter, height-2*gutter, width, height);
}

void c(float cX, float cY) {//this is a simlified rect function
  int dia = 8;
  rect(cX, cY, dia, dia);
}

void cats(float coordX, float coordY, float size) {//9 lives    /// 9 cats
  initialCat(coordX, coordY, size);
  initialCat(coordX+arenaWidth, coordY, size);
  initialCat(coordX-arenaWidth, coordY, size);
  initialCat(coordX, coordY+arenaHeigth, size);
  initialCat(coordX, coordY-arenaHeigth, size);
  initialCat(coordX+arenaWidth, coordY-arenaHeigth, size);
  initialCat(coordX-arenaWidth, coordY+arenaHeigth, size);
  initialCat(coordX-arenaWidth, coordY-arenaHeigth, size);
  initialCat(coordX+arenaWidth, coordY+arenaHeigth, size);
}




void target() {


  // Update the position of the shape
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );

  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-2*gutter-rad || xpos < rad) {
    xdirection *= -1;
  }
  if (ypos > height-2*gutter-rad || ypos < rad) {
    ydirection *= -1;
  }
}

/////////



void initialCat(float locX, float locY, float size) {
  pushMatrix();
  translate(locX, locY);
  scale(size);
  translate(-250, -258);
  //the following code was generated with the print functions above, then copy/pasted here and lightly edited.

  fill(0, 127);
  ellipse(260, 270, 150, 150);

  fill(247, 192, 127);//poptart beige
  rect(188, 196, 332-188, 316-196);

  fill(241, 124, 255);//poptart ground pink
  rect(204, 212, 308-204, 292-212);

  c(212, 204);
  c(220, 204);
  c(220, 204);
  c(228, 204);
  c(236, 204);
  c(244, 204);
  c(244, 204);
  c(252, 204);
  c(260, 204);
  c(268, 204);
  c(276, 204);
  c(284, 204);
  c(292, 204);
  c(292, 204);
  c(300, 204);
  c(308, 212);
  c(308, 220);
  c(316, 212);
  c(316, 220);
  c(308, 220);
  c(308, 228);
  c(308, 236);
  c(316, 236);
  c(316, 228);
  c(196, 220);
  c(196, 228);
  c(196, 236);
  c(196, 244);
  c(196, 252);
  c(196, 260);
  c(196, 268);
  c(196, 276);
  c(196, 284);
  c(204, 292);
  c(212, 292);
  c(212, 300);
  c(220, 292);
  c(220, 300);
  c(228, 300);
  c(228, 292);
  c(244, 292);
  c(244, 300);
  c(236, 300);
  c(236, 292);
  c(252, 300);

  fill(135);//Grey
  c(324, 268);
  c(324, 260);
  c(364, 284);
  c(132, 252);
  c(140, 252);
  c(140, 260);
  c(148, 252);
  c(148, 260);
  c(156, 260);
  c(164, 260);
  c(164, 268);
  c(172, 268);
  c(164, 316);
  c(172, 316);
  c(204, 324);
  c(212, 324);
  c(276, 316);
  c(284, 316);
  c(316, 316);
  c(268, 228);
  c(276, 228);
  c(268, 236);
  c(276, 236);
  c(284, 236);
  c(268, 244);
  c(276, 244);
  c(284, 244);
  c(292, 244);
  c(268, 252);
  c(276, 252);
  c(284, 244);
  c(284, 244);
  c(284, 252);
  c(292, 252);
  c(276, 260);
  c(300, 252);
  c(308, 252);
  c(316, 252);
  c(324, 252);
  c(332, 252);
  c(332, 244);
  c(340, 236);
  c(348, 236);
  c(340, 244);
  c(340, 244);
  c(340, 244);
  c(340, 252);
  c(348, 228);
  c(356, 228);
  c(356, 236);
  c(356, 244);
  c(356, 252);
  c(348, 244);
  c(348, 252);
  c(348, 252);
  c(348, 260);
  c(356, 260);
  c(364, 260);
  c(356, 268);
  c(348, 268);
  c(364, 268);
  c(364, 276);
  c(356, 276);
  c(348, 276);
  c(340, 276);
  c(332, 276);
  c(324, 276);
  c(324, 284);
  c(332, 284);
  c(348, 300);
  c(340, 300);
  c(332, 300);
  c(324, 300);
  c(316, 300);
  c(308, 300);
  c(300, 300);
  c(292, 300);
  c(284, 300);
  c(276, 300);
  c(268, 300);
  c(284, 292);
  c(284, 284);
  c(260, 292);
  c(260, 276);
  c(260, 284);
  c(260, 260);
  c(268, 260);
  c(260, 268);
  c(268, 268);
  c(268, 276);
  c(268, 276);
  c(276, 276);
  c(276, 268);
  c(284, 276);
  c(292, 276);
  c(300, 284);
  c(308, 284);
  c(308, 276);
  c(300, 276);
  c(316, 276);
  c(308, 268);
  c(300, 268);
  c(300, 260);
  c(308, 260);
  c(316, 260);

  fill(241, 132, 132);//facepink
  c(268, 284);
  c(276, 284);
  c(276, 292);
  c(268, 292);
  c(348, 284);
  c(356, 284);
  c(356, 292);
  c(348, 292);

  fill(255);//eye white
  c(332, 260);
  c(284, 260);

  fill(237, 6, 127);//poptart figure pink
  c(212, 220);
  c(244, 212);
  c(268, 212);
  c(300, 220);
  c(236, 236);
  c(220, 252);
  c(236, 260);
  c(204, 268);
  c(212, 284);
  c(228, 284);

  fill(1);
  c(188, 196);
  c(196, 188);
  c(196, 188);
  c(204, 188);
  c(204, 188);
  c(212, 188);
  c(220, 188);
  c(228, 188);
  c(236, 188);
  c(244, 188);
  c(252, 188);
  c(260, 188);
  c(268, 188);
  c(276, 188);
  c(284, 188);
  c(292, 188);
  c(292, 188);
  c(292, 188);
  c(300, 188);
  c(308, 188);
  c(316, 188);
  c(324, 196);
  c(332, 204);
  c(332, 212);
  c(332, 220);
  c(332, 228);
  c(332, 236);
  c(340, 228);
  c(348, 220);
  c(356, 220);
  c(364, 228);
  c(364, 236);
  c(364, 244);
  c(364, 252);
  c(372, 260);
  c(372, 268);
  c(372, 276);
  c(372, 284);
  c(364, 292);
  c(356, 300);
  c(348, 308);
  c(340, 308);
  c(332, 308);
  c(324, 308);
  c(316, 308);
  c(308, 308);
  c(300, 308);
  c(292, 308);
  c(292, 292);
  c(292, 284);
  c(292, 292);
  c(300, 292);
  c(300, 292);
  c(308, 292);
  c(316, 292);
  c(316, 284);
  c(324, 292);
  c(332, 292);
  c(340, 284);
  c(340, 292);
  c(340, 260);
  c(340, 268);
  c(332, 268);
  c(316, 268);
  c(284, 268);
  c(292, 268);
  c(292, 260);
  c(300, 244);
  c(308, 244);
  c(316, 244);
  c(324, 244);
  c(292, 236);
  c(284, 228);
  c(276, 220);
  c(268, 220);
  c(260, 228);
  c(260, 236);
  c(260, 244);
  c(260, 252);
  c(252, 260);
  c(252, 268);
  c(252, 276);
  c(252, 284);
  c(252, 292);
  c(260, 300);
  c(268, 308);
  c(276, 308);
  c(276, 308);
  c(284, 308);
  c(180, 204);
  c(180, 212);
  c(180, 228);
  c(180, 220);
  c(180, 236);
  c(180, 244);
  c(180, 252);
  c(180, 260);
  c(180, 268);
  c(180, 276);
  c(180, 276);
  c(180, 284);
  c(180, 292);
  c(180, 292);
  c(172, 260);
  c(172, 252);
  c(164, 252);
  c(156, 252);
  c(156, 244);
  c(132, 244);
  c(140, 244);
  c(148, 244);
  c(124, 252);
  c(124, 260);
  c(132, 260);
  c(140, 268);
  c(148, 268);
  c(156, 268);
  c(164, 276);
  c(172, 276);
  c(180, 300);
  c(180, 308);
  c(172, 300);
  c(172, 308);
  c(164, 308);
  c(156, 316);
  c(156, 324);
  c(164, 324);
  c(172, 324);
  c(180, 316);
  c(188, 316);
  c(188, 308);
  c(196, 316);
  c(204, 316);
  c(212, 316);
  c(220, 316);
  c(228, 316);
  c(236, 316);
  c(244, 316);
  c(252, 316);
  c(260, 316);
  c(196, 324);
  c(204, 332);
  c(212, 332);
  c(220, 332);
  c(220, 324);
  c(268, 316);
  c(276, 324);
  c(284, 324);
  c(292, 324);
  c(292, 316);
  c(308, 316);
  c(316, 324);
  c(324, 324);
  c(324, 316);
  popMatrix();

}

