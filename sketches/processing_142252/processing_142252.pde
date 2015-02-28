
/*
 Konkuk University
 SOS iDesign

Name: Hyeri Jeong
 ID: 201420107 Hyeri Jeong

*/

float dia=100;

void setup(){
size (600, 600);
 // noLoop();
smooth();
background(200);

 }

void draw(){

  colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
 //large face
     
 stroke(0);
 fill (255,237,178);
 strokeWeight(12);
 ellipse(300,300,500,500);
 
 
 //eye

float eyeLeftX = constrain (mouseX,369,431);
float eyeLeftY = constrain (mouseY,151,249);

float eyeRightX = map(mouseX,0,width,369,431);
float eyeRightY = map(mouseY,0,width,151,249);

stroke(0);
fill(255);
strokeWeight(5);
ellipse(400,200+(random(-10,10)),100,150);
ellipse(200,200+(random(-10,10)),100,150);
fill(mouseX,mouseY,100);
ellipse(eyeLeftX,eyeLeftY+(random(-10,10)),50,50);
ellipse(eyeLeftX-200,eyeLeftY+(random(-10,10)),50,50);

 //mouth

stroke(0);
fill(255,137,126);
strokeWeight(2);
bezier(158,361,157,500,446,500,446,361);
strokeWeight(2);
line(158,361,446,361);
fill(255);
strokeWeight(2);
bezier(234,363,233,421,371,421,369,363);
strokeWeight(2);
line(302,364,302,405);
strokeWeight(2);
noFill();
bezier(233,472,248,498,355,496,365,472);

//cheek

noStroke();
fill(255,123,111);
ellipse(143,313,100,50);
ellipse(461,313,100,50);

//hair

fill(0);
bezier(137,112,137,25,461,25,461,112);
triangle(279,10,347,10,299,61);

//nose

stroke(0);
fill(0);
ellipse(273,288,5,5);
ellipse(336,288,5,5);


  //background ellipse
  
  if(mousePressed){
  stroke(255);
  strokeWeight(10);
  fill(mouseX,mouseY,0);
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(width-mouseX,height-mouseY,dia,dia);
  ellipse(mouseX,height-mouseY,dia,dia);
  ellipse(width-mouseX,mouseY,dia,dia);
    }
}
 
/*
// Don't worry about understanding the code below!
 // You only need to know that you will use the Volume
 import ddf.minim.*;

 Minim minim;
 AudioInput in;
 float volume = 0;
 float volumeF = 0;

 //-------------------------------------
 void setupAudio(){
 minim = new Minim(this);
 in = minim.getLineIn(Minim.MONO, 512);
 }
 
//-------------------------------------
 void getVolume(){
 volumeF = in.right.level()*1000;
 volume = 0.8*volume + 0.8*volumeF; // Sensitivity = standard is 0.2*volumeF
 }
 
//-------------------------------------
 void stop(){
 in.close();
 minim.stop();
 super.stop();
 }
 */
