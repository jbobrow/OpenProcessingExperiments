
PImage frame01,frame02;
PFont aktiv;







void setup() {
  size(800, 600);
  frame01 = loadImage("frame01.jpg");
  frame02 = loadImage("frame02.jpg");
  aktiv = loadFont("AktivGrotesk-Medium-48.vlw");
  smooth();
}

void draw() {
 tint(100);
  image(frame01, 0, 0);

  // dataCircle01
  if (mouseX> 0 && mouseX<=width/4) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 120+mouseX, 89, 89);
  }
  else if (mouseX>width/4 && mouseX<=width/2) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height/2, 89, 89);
  }
  else {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 120, 89, 89);
  }


  // dataCircle02 
  noStroke();
  ellipseMode(CENTER);  
  fill(202, 208, 43, 170);
  ellipse(100, height/2, 56, 56);


  // dataCircle03
  if (mouseX> 0 && mouseX<=width/4) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height-120-mouseX, 29, 29);
  }
  else if (mouseX>width/4 && mouseX<=width/2) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height/2, 29, 29);
  }
  else {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 480, 29, 29);
  }


  // dataCircle04
  if (mouseX>=width/2 && mouseX<=3*(width/4)) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(700, mouseX+120, 5, 5);
  }
  else if (mouseX>= 3*(width/4) && mouseX<width) {

    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(700, height/2, 5, 5);
  }
  else if (mouseX>0 && mouseX< width/2) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(700, 120, 5, 5);
  }

  // dataCircle05 
  noStroke();
  ellipseMode(CENTER);  
  fill(202, 208, 43, 170);
  ellipse(700, height/2, 67, 67);


  ////EASTBANK//////
  fill(255);
  textMode(CENTER);
  textFont(aktiv);
  textSize(12);
  text("WESTBANK", 550, height/2);
  fill(145, 162, 61, 170);
  text("Population Density", width/2-50, 120);
  text("Household Income", width/2-50, height/2);
  text("Average Commute", width/2-50, 480);



  fill(255);
  textMode(CENTER);
  textFont(aktiv);
  textSize(12);
  text("EASTBANK", 200, height/2);


  
}


