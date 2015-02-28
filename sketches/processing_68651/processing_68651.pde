
//for this sketch I want to re-create El Lissitzky's red wedge poster... 
//wish me luck!

PFont myFont;


void setup(){
  size(700, 500);
  background(255);
  myFont = loadFont("OratorStd-48.vlw");
  textFont(myFont, 36);
  
}

void draw(){
  
  /////////layer 1, black background///////////////////////////////////////////////
  
  pushMatrix();
  
  translate (510, -100);
  rotate(PI/7);
  
  fill(0);
  rect(0, 0, height, width);
  
  popMatrix();
  
  ///////layer 2, the circles.///////////////////////////////////////////////////////
  
  pushMatrix();
  
  fill(255);
  circle(450, 270);
  popMatrix();
  
  pushMatrix();
  
  translate(540, 90);
  
  fill(255);
  scale(0.1); //for some reason the scaling isn't working with me, why?
  circle(500, 30);
  
  popMatrix();
  
  ////////layer 3, the wedges.////////////////////////////////////////////////////////
  
   pushMatrix();
   
   translate(-80, -25);
  
  fill(230, 32, 32);
  triangle(180, 200, 240, 100, 540, 330);
  
  popMatrix();
  
  pushMatrix();
   
   translate(500, 250);
   rotate(3*PI/2);
  
  fill(230, 32, 32);
  scale(0.25);
  triangle(180, 200, 240, 100, 540, 330);
  
  popMatrix();
  
  pushMatrix();
   
   translate(200, 350);
   rotate(1.7*PI);
  
  fill(230, 32, 32);
  scale(0.20);
  triangle(180, 200, 240, 100, 540, 330);
  
  popMatrix();
  
  //layer 4, the text///////////////////////////////////////
  
  pushMatrix();
  
  translate(50, 200);
  rotate(1.7*PI);
  
  fill(0);
  text("HOW MUCH", 0, 0);
  
  popMatrix();
  
  pushMatrix();
  
  translate(50, 400);
  
  fill(0);
  text("CODE?!", 0, 0);
  
  popMatrix();
  
}

void circle(int posX, int posY){
  noStroke();
  ellipse(posX, posY, 300, 300);
}


