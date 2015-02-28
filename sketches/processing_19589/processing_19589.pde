

PFont fontA;
String rawr = "M1L 2Y9";
String blob = "M1L";

void setup() {
  size(250, 250);
  background(0);
  smooth();
  fontA= loadFont("AppleCasual-36.vlw");
}

void draw() {


  frameRate(8);
  fill(random(3),random(242),random(30));
  textFont(fontA);
  text(rawr, 110,125);



    if(keyPressed && key=='x') {
      frameRate(5);
      fill(random(255),random(255),random(255));
      textFont(fontA);
      text(blob+rawr, 125,random(width));
       text(blob+rawr,random(height), 125);
    }
  
 
}


