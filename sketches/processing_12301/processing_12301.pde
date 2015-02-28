
// Assignment #2
// Emily Levine
// eslevine@brynmawr.edu
// Date: Date of submission 


float x, y, w, h; // these are the coordinates of the top left corner <x, y>, 
					//and the width (w) and height (h) of the enclosing rectangle
float rRand,gRand,bRand,aRand; // variables for random colors (for iris!)

float eyebrowX, eyebrowY; //variables for eyebrow inner anchor points, for animation!


void setup() { // set the screen size and all other drawing directives
  size(700,500);
  smooth(); // set the x, y, w, h to some specific values
  x = 100;
  y = 200;
  w = 250;
  h = 150;
  
  rRand = random(100,255);
  gRand = random(100,255);
  bRand = random(100,255);
  aRand = random(100,255);
  
  eyebrowX = 300;
  eyebrowY = 175;
  
 }

void draw() {  // draw the object so that its top left corner is at ,x, y> and is of size w x h
  background(252,224,201);
  
  //begin eye on LEFT

  //outer top lid
  noFill();
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x-100,y+500,x,y+50,x+200,y+50,x+200,y+500);
  stroke(0);
  strokeWeight(1);
  curve(x-100,y+500,x,y+50,x+200,y+50,x+200,y+500);
  
  
  //inner top lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x-100,y+400,x,y+50,x+200,y+50,x+200,y+400);
  stroke(0);
  strokeWeight(1);
  curve(x-100,y+400,x,y+50,x+200,y+50,x+200,y+400);
  
  //inner bottom lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x-100,y-375,x,y+50,x+200,y+50,x+300,y-375);
  stroke(0);
  strokeWeight(1);
  curve(x-100,y-375,x,y+50,x+200,y+50,x+300,y-375);
  
  //outer bottom lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x-100,y-450,x,y+50,x+200,y+50,x+300,y-450);
  stroke(0);
  strokeWeight(1);
  curve(x-100,y-450,x,y+50,x+200,y+50,x+300,y-450);
 
  //eyeball!
  
  noStroke();
  ellipseMode(CENTER);
  fill(255);
  ellipse(x+100,y+50,w-75,h-75); //white
  
  stroke(0);
  ellipseMode(CENTER);
  fill(0,gRand,bRand,aRand);
  ellipse(x+100,y+55,w-150,h-50); //iris
  
  fill(0);
  ellipse(x+100,y+55,w-210,h-110); //pupil
  
  noStroke();
  fill(255,255,255,200);
  ellipse(x+125,y+45,w-230,h-130);//light
  
    // left eyebrow
  stroke(0);
  noFill(); 
  curve(x-150,y+200,x-21,y-15,eyebrowX,eyebrowY,x+400,y+300);
  curve(x-150,y+150,x-20,y-15,eyebrowX,eyebrowY,x+400,y+315);
  curve(x-150,y+175,x-22,y-15,eyebrowX,eyebrowY,x+400,y+400);
  curve(x-150,y+175,x-20,y-15,eyebrowX,eyebrowY,x+400,y+350);
  curve(x-150,y+200,x-23,y-15,eyebrowX,eyebrowY,x+400,y+450);
  curve(x-150,y+200,x-20,y-15,eyebrowX,eyebrowY,x+400,y+415);
  curve(x-150,y+200,x-22,y-15,eyebrowX,eyebrowY-2,x+500,y+375);
  curve(x-150,y+200,x-23,y-15,eyebrowX,eyebrowY-2,x+500,y+450);
  
  
  //begin eye on RIGHT
  
  //outer top lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x+200,y+500,x+300,y+50,x+500,y+50,x+600,y+500);
  stroke(0);
  strokeWeight(1);
  curve(x+200,y+500,x+300,y+50,x+500,y+50,x+600,y+500);
  
  //inner top lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x+200,y+400,x+300,y+50,x+500,y+50,x+600,y+400); 
  strokeWeight(1);
  stroke(0);
  curve(x+200,y+400,x+300,y+50,x+500,y+50,x+600,y+400);
  
  //inner bottom lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x+200,y-375,x+300,y+50,x+500,y+50,x+600,y-375); 
  strokeWeight(1);
  stroke(0);
  curve(x+200,y-375,x+300,y+50,x+500,y+50,x+600,y-375);
  
  //outer bottom lid
  stroke(250,206,169,175);
  strokeWeight(13);
  curve(x+200,y-450,x+300,y+50,x+500,y+50,x+600,y-450);
  strokeWeight(1);
  stroke(0);
  curve(x+200,y-450,x+300,y+50,x+500,y+50,x+600,y-450);
  
  //eyeball!
  
  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse(x+400,y+50,w-75,h-75); //white
  
  ellipseMode(CENTER);
  stroke(0);
  fill(0,gRand,bRand,aRand);
  ellipse(x+400,y+55,w-151,h-51); //iris
  
  fill(0);
  ellipse(x+400,y+55,w-210,h-110); //pupil
  
  noStroke();
  fill(255,255,255,200);
  ellipse(x+425,y+45,w-230,h-130);//light
  
  // right eyebrow
  stroke(0);
  noFill(); 
  curve(x-100,y+350,eyebrowX+100,eyebrowY,x+520,y-20,x+450,y+100);
  curve(x-100,y+315,eyebrowX+100,eyebrowY,x+523,y-20,x+450,y+50);
  curve(x-100,y+400,eyebrowX+100,eyebrowY,x+524,y-20,x+450,y+75);
  curve(x-100,y+350,eyebrowX+100,eyebrowY,x+525,y-20,x+450,y+75);
  curve(x-100,y+450,eyebrowX+100,eyebrowY,x+520,y-20,x+450,y+100);
  curve(x-100,y+415,eyebrowX+100,eyebrowY,x+525,y-20,x+452,y+100);
  curve(x-200,y+375,eyebrowX+100,eyebrowY,x+520,y-22,x+452,y+100);
  curve(x-200,y+450,eyebrowX+100,eyebrowY,x+520,y-22,x+452,y+100);

  
  //nose
  strokeWeight(13);
  stroke(250,206,169,230);
  beginShape();
  curveVertex(x-100,y+100);
  curveVertex(x,y);
  curveVertex(x+200,y);
  curveVertex(x+200,y+300);
  curveVertex(x+100,y+300);
  endShape(OPEN);
  strokeWeight(1);
  stroke(0);
  beginShape();
  curveVertex(x-100,y+100);
  curveVertex(x,y);
  curveVertex(x+200,y);
  curveVertex(x+200,y+300);
  curveVertex(x+100,y+300);
  endShape(OPEN); //left line
  
  strokeWeight(13);
  stroke(250,206,169,230);
  beginShape();
  curveVertex(x+205,y+215);
  curveVertex(x+205,y+215);
  curveVertex(x+160,y+298);
  curveVertex(x+190,y+350);
  curveVertex(x+190,y+350);
  endShape(OPEN);
  strokeWeight(1);
  stroke(0);
  beginShape();
  curveVertex(x+210,y+215);
  curveVertex(x+210,y+215);
  curveVertex(x+160,y+298);
  curveVertex(x+190,y+350);
  curveVertex(x+190,y+350);
  endShape(OPEN);//left bit

  strokeWeight(13);
  stroke(250,206,169,230);
  beginShape();
  curveVertex(x+600,y+100);
  curveVertex(x+500,y);
  curveVertex(x+300,y);
  curveVertex(x+300,y+300);
  curveVertex(x+400,y+300);
  endShape(OPEN); 
  strokeWeight(1);
  stroke(0);
  beginShape();
  curveVertex(x+600,y+100);
  curveVertex(x+500,y);
  curveVertex(x+300,y);
  curveVertex(x+300,y+300);
  curveVertex(x+400,y+300);
  endShape(OPEN); //right line
  
  strokeWeight(13);
  stroke(250,206,169,230);
  beginShape();
  curveVertex(x+295,y+215);
  curveVertex(x+295,y+215);
  curveVertex(x+340,y+298);
  curveVertex(x+350,y+350);
  curveVertex(x+350,y+350);
  endShape(OPEN);
  strokeWeight(1);
  stroke(0);
  beginShape();
  curveVertex(x+290,y+215);
  curveVertex(x+290,y+215);
  curveVertex(x+340,y+298);
  curveVertex(x+350,y+350);
  curveVertex(x+350,y+350);
  endShape(OPEN); //right bit
  
  
  //animation (blink!) (left side)
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
  stroke(250,206,169);
  strokeWeight(13);
  fill(250,206,169);
  ellipseMode(CENTER);
  ellipse(x+100,y+50,x+85,y-95);
  ellipse(x+400,y+50,x+85,y-95);
  strokeWeight(2);
  stroke(0);
  

  }
   //right side
  if (mouseX > x+300 && mouseX < x+300+w && mouseY > y && mouseY < y+h){
  stroke(250,206,169);
  strokeWeight(13);
  fill(250,206,169);
  ellipseMode(CENTER);
  ellipse(x+100,y+50,x+85,y-95);
  ellipse(x+400,y+50,x+85,y-95);
  }

}

void mousePressed() { // set x, y, w, h to some new value(s)
  x = 100;
  y = 225;
  w = 275;
  h = 175;
  
  eyebrowY = 125;
  
}
  void keyPressed() { //return to "normal" variables
  x = 100;
  y = 200;
  w = 250;
  h = 150;
  
  eyebrowY = 175;
}

