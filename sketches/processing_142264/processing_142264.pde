
/*
Konkuk University
SOS iDesign

Name: Kim Hyun Gi
ID: hyungi216

*/

PImage img;

void setup(){
size (600, 600);
background(255,255,255);
// noLoop();
smooth();
colorMode (RGB);
img= loadImage("ho.jpg");
// put the image in the same folder as the processing file
}



void draw(){
println(mouseX + " : " + mouseY);

// here you add your code with all shapes and colors.

colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);



// cloth
fill(209,39,30);
stroke(5);
ellipse(278,582,70,70);

 //sholder
 fill(212,38,27);
quad(0,547,0,600,88,600,88,507);
quad(514,530,600,544,600,600,514,600);


// mangto
fill(82,38,29);
stroke(5);
ellipse(150,566,230,200);
ellipse(410,566,230,200);
 
 //face
 stroke(0);
 fill(230,167,119);
 ellipse(286,301, 530,530);
 
 //ribon
fill(197,188,85);
rect(239,575,80,17,20);
 fill(219,107,79);
 
 noStroke();
 ellipse(427,318,123,148);//right face
 ellipse(152,343,118,148);//left face


fill(212,81,69) ;
 stroke(0);
  ellipse(286,325,152,152);//nose
 
 noFill();
 stroke(0);
 strokeWeight(5);
 
float s = random(-7,7);
  s=random(-7,7);

 bezier(286+s,160+s,292,78,380,80,404+s,176+s);//right eye brow
 bezier(132+s,213+s,138,110,229,80,252+s,164+s);//left eye brow
 
 
 bezier(126,265,236,262,233,423,138,421); //left face line
 bezier(432,238,350,240,325,410,456,393); //right face line
 bezier(178,411,241,468,361,456,404,389);
 
 float eyeLeftX = constrain (mouseX,307,382);
 float eyeLeftY = constrain (mouseY,153,213);
 float eyeRightX = map(mouseX,0,width,358,465);
float eyeRightY = map(mouseY,0,width,140,245);

 
 fill(0,0,0);
 ellipse(eyeLeftX,eyeLeftY,45,80); //left eye
 ellipse(eyeLeftX-150,eyeLeftY,45,80);//right eye

fill(255,255,255);
noStroke();
rect(154,309,23,23,10);
rect(270,283,25,30,10);
rect(404,280,23,23,10);
 
//bonus

 if(mousePressed){
  fill(mouseX,width-mouseX,0);
  ellipse(286,325,152,152);
  
   noStroke();
  fill(255,255,255);
rect(270,283,25,30,10);

 translate(mouseX, mouseY);
  fill(width-mouseX,mouseX,mouseY,127);
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
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
