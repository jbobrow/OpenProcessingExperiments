
//critter

void setup(){
  size(640,480);
  frameRate(30);
  smooth();
}

void draw(){
  background(0);
  noCursor();
  //walter's body
  rectMode(CENTER);
  noStroke();
  fill(mouseX,mouseY,mouseY);
  rect(mouseX,mouseY,50,60,5,5,5,5);

  //legs
  rectMode(CORNER);
  rect(mouseX-20,mouseY+30,15,20,0,0,5,5);
  rect(mouseX+5,mouseY+30,15,20,0,0,5,5);
  //hooves
  fill(150);
  rect(mouseX-20,mouseY+45,15,5,0,0,5,5);
  rect(mouseX+5,mouseY+45,15,5,0,0,5,5);
  
  //horns
  fill(150);
  rect(mouseX-15,mouseY-35,7,5,3,3,0,0);
  rect(mouseX+8,mouseY-35,7,5,3,3,0,0);
  
  //eyes
  fill(0);
  ellipse(mouseX-10,mouseY-5,7,7);
  ellipse(mouseX+10,mouseY-5,7,7);
  //pupils
  fill(255);
  ellipse(mouseX-10,mouseY-5,2,2);
  ellipse(mouseX+10,mouseY-5,2,2);

  //mouth
  fill(113,49,46);
  arc(mouseX,mouseY+17,20,17,PI,PI*2);
  //tooth
  fill(255);
  rect(mouseX+3,mouseY+15,3,2);
  
  //ears
  stroke(mouseX,mouseY,mouseY);
  strokeWeight(4);
  strokeJoin(ROUND);
  fill(mouseX,mouseY,mouseY);
  quad(mouseX-25,mouseY-25,pmouseX-40,pmouseY-35,pmouseX-40,pmouseY,mouseX-25,mouseY-10);
  quad(mouseX+25,mouseY-25,pmouseX+40,pmouseY-35,pmouseX+40,pmouseY,mouseX+25,mouseY-10);
  //inside of ear
  fill(247,228,227);
  noStroke();
  triangle(mouseX-25,mouseY-17,pmouseX-36,pmouseY-25,pmouseX-36,pmouseY-8);
  triangle(mouseX+25,mouseY-17,pmouseX+36,pmouseY-25,pmouseX+36,pmouseY-8);
  

}


