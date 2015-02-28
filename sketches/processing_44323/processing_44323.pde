
class Nubbles {
  
float v1 = 255;
float v2 = 255;
float v3 = 255;
color charColor = color(v1,v2,v3);  

  float rotFoot = 0;
  float rotFoot2 = 0;

  float charRot = 0;
  
  Nubbles() {
  }

  void Happy() {

    translate(moveX,moveY + 100);
    rotate(radians(charRot));
    translate(-80, -100);
    scale(direction,2);

    // the stroke
    pushMatrix();
    fill(0);
    stroke(0);
    //right foot
    pushMatrix();
    translate(Xpos + animateFeet1,Ypos + FeetUp1);
    rotate(rotFoot);
    arc(0, 0, 13.5, 13.5, 9.4, 12.55);
    line(-6, 0.5, 6, 0.5);
    popMatrix();
    //right arm
    ellipse(Xpos + animateArm1, Ypos + raiseArm1,8,8);
    //body
    ellipse(Xpos + 20,Ypos + 20,Xsize +1,Ysize +1);
    //left foot
    pushMatrix();
    translate(Xpos + animateFeet2,Ypos + FeetUp2);
    rotate(rotFoot2);
    arc(0,0, 13.5, 13.5, 9.4,12.55);
    line(-6.5, 0.5, 6.5, 0.5);
    popMatrix();
    //left arm
    ellipse(Xpos + animateArm2,Ypos + raiseArm2,8,8);
    popMatrix();

    //the body
    noStroke();
    fill(charColor);
    //right foot
    pushMatrix();
    translate(Xpos + animateFeet1,Ypos + FeetUp1);
    rotate(rotFoot);
    arc(0, 0, 13, 13, 9.4, 12.55);
    line(-6, 0, 6, 0);
    popMatrix();
    //the right arm
    ellipse(Xpos + animateArm1, Ypos + raiseArm1,7,7);
    //the body
    stroke(0);
    fill(0);
    arc(Xpos + 20,Ypos + 20,Xsize + 0.5,Ysize + 0.5, 1,2.9);
    noStroke();
    fill(charColor);
    ellipse(Xpos + 20,Ypos + 20,Xsize,Ysize);
    //left foot
    pushMatrix();
    translate(Xpos + animateFeet2,Ypos + FeetUp2);
    rotate(rotFoot2);
    stroke(0);
    arc(0,0, 14, 13, 9.4,10);
    arc(0,0, 14, 13, 11.4,12.55);
    noStroke();
    arc(0,0, 13, 13, 9.4,12.55);
    stroke(0);
    line(-6.5, 0.5, 6.5, 0.5);
    noStroke();
    popMatrix();
    //the left arm
    fill(0);
    arc(Xpos + animateArm2 + 1,Ypos + raiseArm2 - 0.2,8,8, 1.3, 8);
    fill(charColor);
    ellipse(Xpos + animateArm2,Ypos + raiseArm2,7.7,7.7);
    //the eyes
    fill(0);
    stroke(0);
    if (eyeBall) { 
      ellipse(Xpos + eyeX1,Ypos + eyeY,3,3);
      ellipse(Xpos + eyeX2,Ypos + eyeY,3,3);
    }
    if (brow) line(Xpos + eyeX1 - 2, Ypos + eyeY - 1.6, Xpos + eyeX2 + 2, Ypos + eyeY - 1.6);
  }



