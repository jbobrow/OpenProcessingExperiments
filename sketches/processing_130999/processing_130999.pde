
/*

Tiffany Vedua - CAT DEVIL 

*/


boolean change = false;
String keyz = "press any key";
int eyeHeight = -45;
int eyeSize;
int irisSize;
int pupilSize;
int rCol,gCol,bCol;
int rColFace,gColFace,bColFace;
int rColNose,gColNose,bColNose;
int brow1, brow2, brow3;

void setup(){
size(300,300);
background(149,143,143);
}

void draw(){
translate(150,150);

  
  if (change == true){
    background(0);
    eyeSize = 75;
    irisSize = 50;
    pupilSize = 30;
    rCol=255;
    gCol=0;
    bCol=0; 
    rColFace=255;
    gColFace=0;
    bColFace=0; 
    rColNose=0;
    gColNose=0;
    bColNose=0;
    brow1=0;
    brow2=0;
    brow3=0;
    fill(255,255,255);
    text("#KittySwag",28,140);
  } 
  if (change == false){
    background(149,143,143);
    eyeSize = 60;
    irisSize = 40;
    pupilSize = 15;
    rCol=135;
    gCol=252;
    bCol=251;  
    rColFace=211;
    gColFace=171;
    bColFace=122; 
    rColNose=245;
    gColNose=173;
    bColNose=220;
    brow1=211;
    brow2=171;
    brow3=122;
    textSize(22);
    fill(85,255,77);
    text("#KittySwag",-140,140);

  }
  cat();
  smooth();
  text(keyz,-145,-135);
}
 
void keyPressed(){
  change =! change;
  keyz = ("");
}
  
  
  
void cat(){
  
//FACE
noStroke();
fill(rColFace,gColFace,bColFace);
ellipse(0,0,250,250);

//EARS
triangle(-130,-130,-10,-90,-90,-10);
triangle(10,-90,90,-10,130,-130);


//EYES
fill(255,255,255);
ellipse(-40,eyeHeight,eyeSize,eyeSize);
ellipse(40,eyeHeight,eyeSize,eyeSize);
fill(rCol,gCol,bCol);
ellipse(-40,eyeHeight,irisSize,irisSize);
ellipse(40,eyeHeight,irisSize,irisSize);
fill(0);
ellipse(-40,eyeHeight,pupilSize,pupilSize);
ellipse(40,eyeHeight,pupilSize,pupilSize);

//BROWS
strokeWeight(8);
stroke(brow1,brow2,brow3); 
line(-100,-100,0,-70);
line(100,-100,0,-70);


//MOUTH
strokeWeight(3);
stroke(0); 
line(-1,0,0,65);
noFill();
arc(-25,65,50,50,0,PI);
arc(25,65,50,50,0,PI);

//NOSE
strokeWeight(3);
stroke(0); 
line(-75,0,75,0);      //    WHISKERS
line(-75,15,75,15);
noStroke();
fill(rColNose,gColNose,bColNose);
triangle(0,25,-25,-5,25,-5);

//DOTS
fill(0);
//LEFT
ellipse(-100,-5,5,5);
ellipse(-90,-5,5,5);
ellipse(-95,5,5,5);
//RIGHT
ellipse(100,-5,5,5);
ellipse(90,-5,5,5);
ellipse(95,5,5,5);

}


