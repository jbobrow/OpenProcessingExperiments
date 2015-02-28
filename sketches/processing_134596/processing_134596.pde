
//Check the distance between two vectors
float checkDist(PVector a, PVector b) {
  float tempX, tempY, distOut;

  tempX = a.x - b.x;
  tempY = a.y - b.y;

  tempX = pow(tempX, 2);
  tempY = pow(tempY, 2);

  distOut = tempX + tempY;
  return sqrt(distOut);
}

//Get slope as normalized vector
PVector slope(PVector a, PVector b) {
  //a is CircCenter
  //b is MousePos

  PVector tempVec = PVector.sub(b, a);
  tempVec.normalize();

  return tempVec;
}

public class Eye {
  //max Distance for pupil
  float circumfrence;
  //Vectors to store pos of eye and pupil
  PVector pupil, eyeVec;
  //Constructor for eye
  Eye(float circIn, float xIn, float yIn) {

    //Save circumfrence
    circumfrence = circIn;

    //Save eye pos
    eyeVec = new PVector(xIn, yIn);
    pupil = new PVector(xIn, yIn);
  }

  void updatePupil() {
    PVector mouseVec = new PVector(mouseX, mouseY);
    if (checkDist(eyeVec, mouseVec)< circumfrence/2) {
      pupil.x = mouseX;
      pupil.y = mouseY;
    }



    else {
     
      PVector tempVec = slope(eyeVec,mouseVec);
      tempVec.mult(circumfrence/2);
      tempVec = PVector.add(eyeVec,tempVec);
      pupil = new PVector(tempVec.x, tempVec.y);
    }

    fill(255);
    ellipse(eyeVec.x, eyeVec.y, circumfrence+45, circumfrence+45);
    fill(0);
    ellipse(pupil.x, pupil.y, circumfrence/2, circumfrence/2);
  }
}


Eye leftEye,rightEye;
void setup() {
  size(700, 350);
  noFill();
  //Circ,x,y
  leftEye  = new Eye(100, 200, 175);
  rightEye = new Eye(100, 700 - 200,350 - 175);
}


void draw() {
  background(30, 30, 190);
  leftEye.updatePupil();
  rightEye.updatePupil();
  arc(width/2, height/2, 50, 50, 0, PI);
}
