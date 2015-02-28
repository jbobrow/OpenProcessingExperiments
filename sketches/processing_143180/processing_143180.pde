
/*
 Konkuk University
 SOS iDesign

Name: YOU chahee
 ID: 201420092

*/

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
 
PImage img;
void setup(){
  setupAudio();
size (600, 600);
 // noLoop();
smooth();
img = loadImage ("0000.png"); 
}

void draw(){
println(mouseX + " : " + mouseY);
 

//arms
noStroke();
fill(255);
quad(219,538,193,599,210,599,244,548);
quad(364,555,386,599,412,599,387,548);
stroke(0,0,0);
line(239,548,212,599);

//quad
fill(255,229,242);
noStroke();
quad(250,541,222,599,367,599,360,544);
quad(211,530,243,549,258,521,239,513);
quad(254,519,247,545,355,544,353,517);
quad(349,518,362,515,394,543,362,554);

//line
strokeWeight(5);
stroke(0,0,0);
line(309,41,267,175);
line(309,41,353,173);
strokeWeight(3);

line(241,409,327,400);
line(299,404,313,421);
line(319,401,313,421);

fill(600,600,600);
ellipse(300,335,378,375);
line(225,337,211,319);
line(234,330,228,309);
line(243,327,243,308);
line(301,322,295,301);
line(312,299,313,319);
line(321,325,332,304);

//bezier
stroke(0,0,0);
noFill();
bezier(243,406,276,524,331,524,325,393);
bezier(243,406,276,524,331,524,325,393);
line(242,404,325,393);
line(297,398,311,418);
line(311,418,320,396);
stroke(255,108,174);
line(236,403,328,390);
noFill();
bezier(239,404,276,530,331,530,328,390);
stroke(0,0,0);
line(359,544,365,599);
line(249,542,220,599);
line(236,512,208,531);
line(208,531,242,549);
line(362,511,396,544);
line(396,544,362,555);
line(220,536,192,599);
line(386,546,409,599);
line(363,558,386,599);


//triangle
fill(600,600,600);
noStroke();
triangle(310,48,268,176,356,178);
stroke(0,0,0);
fill(255,220,220);

//ellipse
noStroke();
ellipse(224,386,62,21);
ellipse(340,374,62,21);


float mx1 = constrain(mouseX,230,250);
float mx2 = constrain(mouseX,300,320);

getVolume(); 
float Y = map(volume, 0, 200, 2, 100); 
float X = map(volume, 0, 200, 2,100);

//eye
fill(0,0,0);
ellipse(mx1,356,X-30,Y);
ellipse(mx2,352,X-30,Y);

stroke(0,0,0);

//rebon
fill(600,600,600);
triangle(309,523,332,545,345,520);
triangle(272,520,283,544,309,523);
line(309,523,289,562);
line(309,523,328,562);

if(mousePressed){
  fill(random(600),random(600),random(255));
  ellipse (mouseX,mouseY, 50,50);
}
 }

void keyPressed(){
background(random(255));

 }

