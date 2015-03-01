
int armAngle = 0;
int angleChange = 5;
final int ANGLE_LIMIT = 135;

void setup(){
  size (500,500);
  smooth();
  frameRate(30);//change this number to make arms move
  //faster or slower
}

 void snowman()
 {
   fill (255);
ellipse(100,214,100,100);//MIDDLE
ellipse(100,305,120,120);//bottom
ellipse(100,140,78,80);//HEAD
fill (255);
arc(100,150,25,30,0,radians(180),CHORD);//smile
fill (0,0,0);
rect(60,100,80,20);//bottom of the hat
fill (0,0,0);
rect(76,60,48,40);//bottom of the hat
fill (0,0,0);
ellipse(90,136,10,10);//eye left
fill (0,0,0);
ellipse(110,136,10,10);//eye right
fill (0,0,0);
ellipse(100,214,10,10);//middle button
ellipse(100,234,10,10);//last button
ellipse(100, 194,10,10);//top button
leftarm ();
rightarm();
 }

void leftarm() {
  pushMatrix();
   translate(52,214);//this is the pivot point for the left arm)
   rotate(radians(armAngle));
beginShape();
 vertex(0,0); //this is the top point of the left arm
  vertex(-45,100);//leftarm; the bottom point of the left arm, calculated from the //(0,0) pivot point
endShape();
popMatrix();
}

void rightarm(){
  pushMatrix();
translate(150,214); //the pivot point for the right arm is 
//50 pixels further to the right from the pivot point 
//for the left arm above
rotate(radians(-armAngle));
beginShape();
   vertex(0,0); //this is the top point of the right arm
   vertex(45,100);//rightarm; the bottom point of the left arm, calculated from the //(0,0) pivot point

  endShape();
  popMatrix();
}
void draw()  //this following section tells the computer to draw the background, ths snowman, as defined above, including the arms and what to do with the arms
{
background(77,214,237);
  pushMatrix();
  snowman();
  armAngle += angleChange;
  if (armAngle > ANGLE_LIMIT || armAngle < 0)
  {
    angleChange = -angleChange;
    armAngle += angleChange;
  }
  popMatrix();
}


  












