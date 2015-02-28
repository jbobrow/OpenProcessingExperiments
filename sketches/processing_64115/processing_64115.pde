
PFont universbold;
PFont univers;
float x;


void setup() {
  size(800, 800);
  smooth();
  noStroke();
  fill(255);

  universbold = loadFont("UniversLTStd-Bold-48.vlw");
  textFont(universbold, 15);
  univers = loadFont("UniversLTStd-48.vlw");
  textFont(univers, 8);

  rectMode(CENTER);
  frameRate(30);
  

}
void draw() {
  background(255);
  x= map(mouseX, 0, width, 20, 200);

  for (int i = 0; i < 100; i++) {
  float r = random(-100, 100);
  
  rotate(PI/2);
  //gray
  fill(200, 200);
  rect(421, -406, 460, 350);


  //color

  
  fill(0, 181, 226);
  rect(width/2, -height/2, 440, 350);

 if ((mouseX<=width) && (mouseY>=x))
  {
    fill(r+0, r+181, r+226);
    rect(width/2, -height/2, 440, 350);
  }
  
  //white
  fill(255);
  rect(580, -height/2, 130, 352);

  fill(0);
  textFont(universbold);
  textSize(40);
  rotate(-PI/2);
  text("PANTONE", 50, 80);

  textSize(13);
  text("®", 250, 61);

//  textFont(univers);
//  textSize(28);
//  text("306 C", 50, 110);
}
}


