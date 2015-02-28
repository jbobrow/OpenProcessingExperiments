
//Naomi Rauch
//April 15, 2014
//Parametric Drawing

float bodyWidth; //x diameter of body
float bodyHeight; // y diameter of body
float bodyX; // x coordinate of body
float bodyY; //y coordinate of body
float headX; // x coordinate of head dependent on body
float headY; // y coordinate of head dependent on body
float headWidth; // headwidth changes with body width
float headHeight; // headheight changes with body height


void setup(){
  size(400,400);
  background(255);
  smooth();
  noStroke(); 
  
  bodyWidth = 55;
  bodyHeight = 100; 
  bodyX = width/2;
  bodyY = height/2;
  headX = bodyX;
  headY = bodyY-bodyHeight/2;
  headWidth = bodyWidth;
  headHeight = bodyHeight/3;
  
  
}


void draw() {
  noStroke();
//body
  fill (0,0,255);
  ellipse (bodyX, bodyY,bodyWidth, bodyHeight);
//head
  ellipse (headX, headY, headWidth, headHeight); 
//nose
  fill(255);
  triangle ((headX-(headWidth/10)),(headY+headHeight/10),(headX+(headWidth/10)),(headY+headHeight/10),headX, headY+(headHeight/6));
//left eye
  fill(255,255,0);
  ellipse (headX-headWidth/6, headY, headWidth/4, headHeight/6);
//left eye pupil
  fill(0);
  ellipse (headX-headWidth/6, headY-headHeight/20, headWidth/6, headHeight/8);
//left eye pupil white
  fill(255);
  ellipse (headX-headWidth/6, headY-headHeight/15, headWidth/12, headHeight/12);

//right eye
  fill(255,255,0);
  ellipse (headX+headWidth/6, headY, headWidth/4, headHeight/6);
//left eye pupil
  fill(0);
  ellipse (headX+headWidth/6, headY-headHeight/20, headWidth/6, headHeight/8);
//left eye pupil white
  fill(255);
  ellipse (headX+headWidth/6, headY-headHeight/15, headWidth/12, headHeight/12);

//left ear
  fill(0,0,255);
  triangle(headX-headWidth/2.3,headY-headHeight/4, headX - headWidth/3, headY-headHeight*2/3,headX-headWidth/4, headY-headHeight/4);
//right ear
  fill(0,0,255);
  triangle(headX+headWidth/2.3,headY-headHeight/4, headX+headWidth/3, headY-headHeight*2/3, headX+headWidth/4, headY-headHeight/4);

//left arm: used function with a joint but it doesnt work to move yet
  stroke(0,0,255);
  strokeWeight(headWidth/10);  
  arms(bodyX,bodyY-bodyHeight/10,180);
//right arm
  arms(bodyX,bodyY-bodyHeight/10,90);
//left leg: used arm function for leg as they are about the same
  arms(bodyX,bodyY+bodyHeight/5,51);
//right leg
  arms(bodyX,bodyY+bodyHeight/5,-45);
  
//tail: has two joints but haven't figured out how to get them to stay at the joints but move elsewhere.
  tail(bodyX,bodyY+bodyHeight/5,15);
  


}


void arms(float armX, float armY, float a){
  //drawing arms and legs. Made of two lines with a joint that doesn't work :)
   
  pushMatrix();
  translate(armX,armY);
  fill(0,0,255);
  rotate(a);
  line(0,0,0,headWidth/2);
  line(0,headWidth/2,0,headWidth);
  popMatrix();
  
}


void tail(float tailX, float tailY, float b){
  //drawing arms
   
  pushMatrix();
  translate(tailX,tailY);
  fill(0,0,255);
  rotate(b);
  line(0,0,0,headWidth/2);
  line(0,headWidth/2,headWidth,headWidth/2);
  line(headWidth,headWidth/2,headWidth+headWidth/4, headWidth+headWidth/4);
  
  popMatrix();
  
}


