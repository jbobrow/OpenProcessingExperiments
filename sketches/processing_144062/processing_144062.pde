
import processing.pdf.*;

void setup(){
  size(2550,3300);
  background(100,100,100);
  translate(150,150);
  beginRecord(PDF, "Final_Squid.pdf");
  noStroke();
  repeatShape();
  endRecord();
  
}  

void repeatShape(){
    int x = 0;
    for(int i=0; i < 100; i++){
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
float headSize = random(110,150);  
float skinColor[] = {random(0,255), random(0,255), random(0,255)};
float chinSize = random(55,70);
float eyeSize = random(30,50);
float eyeColor[] = {random(0,255), random(0,255), random(0,255)};
float pupilSize = random(20,25);
float pupilColor[] = {random(0,255), random(0,255), random(0,255)};
float lidHeight = random(-20,0);
float openMouth = random(1,25);
float brows = random(-20,20);
float noseColor[] = {random(0,255), random(0,255), random(0,255)};
  //Head
  fill(skinColor[0], skinColor[1], skinColor[2]);
  ellipse(0,0,headSize,headSize); 
  //Chin
  fill(skinColor[0], skinColor[1], skinColor[2]);
  rect(-35,30,chinSize,chinSize);
  //Right Eye
  fill(eyeColor[0], eyeColor[1], eyeColor[2]);
  ellipse(18,30,eyeSize,eyeSize);
  //Left Eye
  ellipse(-18,30,eyeSize,eyeSize);
  //Right Pupil
  fill(pupilColor[0], pupilColor[1], pupilColor[2]);
  ellipse(18,30,pupilSize,pupilSize);
  //left pupil
  ellipse(-18,30,pupilSize,pupilSize);
  //eyelids
  fill(skinColor[0], skinColor[1], skinColor[2]);
  rect(-40,lidHeight,85,30);
  //Brows
  fill(0,0,0);
  rect(-40,brows,35,5);
  rect(5,brows,35,5);
  //Mouth
  fill(skinColor[0], skinColor[1], skinColor[2]);
  ellipse(-3,90,110,30);
  fill(0);
  rect(-47,90,90,1);
  //nose
  fill(noseColor[0], noseColor[1], noseColor[2]);
  ellipse(0,80,30,80);
  

}  





