
/* @pjs font="SF Hollywood Hills.ttf"; */
PFont ourFont; // enables a variable to hold our font for text
float fps = 24;
PImage hand;
PImage star;
float x;
float y;
float px;
float py;
float easing = 0.05;
//javascript
color grey = color(#292823);
color white = color(#fffcfc);
color black = color(#000000);
color earth = color(0, 65, 201);//blue
color yellow = color(255, 255, 0);
color darkYellow = color(255, 155, 5);//this is actually organge
color land = color(10, 147, 0);//green
color night = color(1,13,54);
void setup() {
  size(900, 650);
  ourFont = textFont(createFont("SF Hollywood Hills", 30));
  hand = loadImage("hand.png");
  star = loadImage("star2.png");
  noCursor();
}
void draw() {
  background(night);
 
 //Load Mission Map
  missionMap();
  crazyLines();
  easyThere();

  imageMode(CENTER);
  image(hand, mouseX, mouseY);
  //print location of mouse
  println("X = " + mouseX + " , " + "Y = " + mouseY);
}
void missionMap() {
  fill(white);
  forLoopStar();
  textSize(40);
  textAlign(CORNER);
  //title for instructions level
  text("Mission Map", 420, 50);
    textSize(20);
  String n = "wave your cursor around to move the red dart around, also scroll over yellow circles and click to see what different missions there are.";
  text(n,40,530,350,350);
  //Earth
  fill(earth);
  ellipse(500, 325, 425, 425);
  fill(land);
  //land # 1
  beginShape();
  vertex(439, 154);
  vertex(519, 163);
  vertex(561, 244);
  vertex(501, 264);
  vertex(465, 291);
  vertex(471, 340);
  vertex(393, 241);
  vertex(422, 181);
  endShape(CLOSE);
  //land # 2
  beginShape();
  vertex(579, 370);
  vertex(674, 419);
  vertex(613, 497);
  vertex(487, 499);
  vertex(508, 403);
  endShape(CLOSE);
  //land # 3
  beginShape();
  vertex(323, 375);
  vertex(377, 375);
  vertex(358, 430);
  vertex(322, 431);
  vertex(306, 390);
  vertex(301, 329);
  endShape(CLOSE);
  //missions
  fill(yellow);
  ellipse(475, 220, 30, 30);
  //change fill of circle
  if (mouseX >=(460) && mouseX <=(485) && mouseY >=(205)&& mouseY <=(230)) {
    fill(darkYellow);
    ellipse(475, 220, 30, 30);
  }
  fill(yellow);
  if (mouseX >=(460) && mouseX <=(485) && mouseY >=(205)&& mouseY <=(230)&& mousePressed) {
    noStroke();
    fill(white);
    rect(200, 150, 200, 100);
    fill(black);
    textSize(20);
    text("Mission # 1", 230, 170);
    textSize(15);
    text("Let's go fishing", 230, 190);
    textSize(35);
  }
  stroke(black);
  fill(yellow);
  ellipse(575, 420, 30, 30);
  //chnage fill of circle
  if (mouseX >=(561) && mouseX <=(582) && mouseY >=(406)&& mouseY <=(430)) {
    fill(darkYellow);
    ellipse(575, 420, 30, 30);
  }
  if (mouseX >=(561) && mouseX <=(582) && mouseY >=(406)&& mouseY <=(430)&& mousePressed) {
    noStroke();
    fill(white);
    rect(641, 415, 200, 100);
    fill(black);
    textSize(20);
    text("Mission # 2", 663, 435);
    textSize(15);
    String s = "Change the way of the people!";
    text(s, 663, 450, 100, 100);
    textSize(35);
  }
  stroke(black);
}
void crazyLines() {
  strokeWeight(3);
  stroke(white);
 // line(0, 493, mouseX-600, mouseY);
  float mx = map(mouseX-300, 0, 100, 60, 180);
  stroke(yellow);
  triangle(50, 50,100,200,mx, mouseY-300);
  strokeWeight(1);
  stroke(black);
}
void easyThere() {
  smooth();
  float targetX = pmouseX;
  x += (targetX - x) * easing;
  float targetY = pmouseY;
  y += (targetY - y) * easing;
  float weight = dist(x, y, px, py);
  strokeWeight(weight);
  stroke(255, 0, 0);
  line(x, y, px, py);
  py = y;
  px = x;
  stroke(black);
  strokeWeight(1);
}
void forLoopStar() {
  for (int k = -10; k <900; k += 100) {
    for (int j = -10; j <650; j += 100) {
      image(star,k,j);
    }
  }
}




