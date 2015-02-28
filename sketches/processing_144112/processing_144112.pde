
import processing.pdf.*;
 
void setup(){
  size(3520,6030);
  background(255,255,255);
  translate(150,150);
  noStroke();
  beginRecord(PDF, "sketch_140403b.pdf");
  repeatShape();
  endRecord();
}
 
void repeatShape(){
  int x = 0;
  for (int i=0; i < 100; i++){
    println("MEH" + i);
    makeShape();
    translate(300,0);
    x++;
    if (x == 10){
      x = 0;
      translate(-3000,300);
    }
 
  }

}
 
void makeShape(){
  //hair size and color
  float hairColor[] = {random(0,255), random(0,255), random(0,255)};
  //hair 2 - fringe
 float fringeColor[] = {random(0,255), random(0,255), random(0,255)};
  //face size and color & face is in the right spot, just behind the hair rather than in front of it  
  float faceColor[] = {random(0,255), random(0,255), random(0,255)};
  //left eye color and size
  float lefteyeSize = random(15,40);
  float lefteyeColor[] = {random(0,255), random(0,255), random(0,255)};
  //left pupil
  float leftpupilSize = random(5,15);
  float leftpupilColor[] = {random(0,255), random(0,255), random(0,255)};
  //right eye color and size
  float righteyeSize = random(15,40);
  float righteyeColor[] = {random(0,255), random(0,255), random(0,255)};
  //right pupil
  float rightpupilSize = random(5,15);
  float rightpupilColor[] = {random(0,255), random(0,255), random(0,255)};
  //nose
  float noseLength = random(7,10);
  float noseWidth = random(-10,5);
  float noseColor[] = {random(0,255), random(0,255), random(0,255)};
 //mouth size
  float mouthSize = random(15,50);
  float mouthColor[] = {random(0,255), random(0,255), random(0,255)};
 
  
  //hair 1
    fill(hairColor[0],hairColor[1],hairColor[2]);
    rect(0,0,126,50);
    //hair 2
    fill(fringeColor[0],fringeColor[1],fringeColor[2]);
    rect(0,0,125,150);
  //face
    fill(faceColor[0],faceColor[1],faceColor[2]);
    ellipse(60,80,100,150);
 pushMatrix();
    translate(0,100);
  //left eye
    fill(lefteyeColor[01],lefteyeColor[1],lefteyeColor[2]);
    ellipse(80,-25,lefteyeSize,lefteyeSize);
  //left pupil
    fill(leftpupilColor[0],leftpupilColor[1],leftpupilColor[2]);
    ellipse(50,-25,leftpupilSize,leftpupilSize);
  //right eye
    fill(righteyeColor[0],righteyeColor[1],righteyeColor[2]);
    ellipse(50,-25,righteyeSize,righteyeSize);
  //right pupil
    fill(rightpupilColor[0],rightpupilColor[1],rightpupilColor[2]);
    ellipse(50,-25,rightpupilSize,rightpupilSize);
  //nose
    fill(noseColor[0],noseColor[1],noseColor[2]);
    triangle(0,-15,-5,noseLength, noseLength, noseLength);
    triangle(0,-15,-5,noseWidth, noseWidth, noseWidth);
 //mouth
  fill(mouthColor[0], mouthColor[1], mouthColor[2]);
  arc(50,10,mouthSize,mouthSize,0,PI+QUARTER_PI,OPEN);
  popMatrix();
 
  
  
    
  
}





