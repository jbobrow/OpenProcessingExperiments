



/*
 Konkuk University
 SOS iDesign

Name: CHOE Goeun
 ID: Goeun

*/





void setup(){
size (600, 600);
smooth();
 }
 
 
 

void draw(){
  println(mouseX + " : " + mouseY);
  ellipseMode(CENTER);
  background(140,255,255);
  fill(0,128,64);
  noStroke();
  quad(0,416,600,416,600,600,0,600);
  
  
  
  
    //sun
  float sunleft = constrain (mouseX,0,600);
  float sunup = constrain (mouseY,0,200);
  fill(255,255,0);
  ellipse(sunleft,sunup,70,70);
  
  
  //basic
  stroke(0);
  strokeWeight(2);
  line(243,356,177,475);
  line(351,351,401,472);
  fill(215,179,217);
  rect(242,338,115,190);
  fill(235,233,189);
  ellipse(288,231,290,270);
  rect(120,227,25,56);
  rect(433,226,20,50);
  fill(255,128,0);
  triangle(292,217,267,286,315,287);
  line(269,318,321,315);
  fill(235,233,189);
  ellipse(171,486,20,20);
  ellipse(409,485,20,20);
  

  
 
 
  
  // original
  
  noStroke();
  fill(180);
  quad(142,209,124,151,163,91,191,146);
  quad(163,91,191,146,260,114,251,69);
  quad(260,114,251,69,328,121,328,73);
  quad(328,121,328,73,390,153,408,110);
  quad(390,153,408,110,444,164,425,205);
  
  fill(255);
  ellipse(215,215,50,50);
  ellipse(375,215,55,55);
  stroke(0);
  strokeWeight(10);
  float mx = constrain(mouseX,198,228);
  float my = constrain(mouseY,203,227);
  point(mx,my);
  point(mx+(165),my);
  strokeWeight(2);
  line(268,317,320,313);
  line(274,527,254,600);
  line(327,529,332,600);
  

  if (mousePressed == true) {

  background(255,0,255);
  
  //basic
  float a = random(255);
  
      //sun

  fill(255,255,0);
  noStroke();
  ellipse(sunleft,sunup,70,70);
  
  //basic
  
  stroke(0);
  strokeWeight(2);
  fill(a,a,a);
  rect(242,338,115,190);
  fill(235,233,189);
  ellipse(288,231,290,270);
  rect(120,227,25,56);
  rect(433,226,20,50);
  fill(255,128,0);
  triangle(292,217,267,286,315,287);
  fill(235,233,189);
  
  //angry
  fill(255);
  stroke(0);
  strokeWeight(3);
  ellipse(189,217,70,70);
  ellipse(420,224,70,70);
  stroke(255,0,0);
  strokeWeight(35);
  point(439,224);
  point(167,213);
  stroke(255,0,0);
  strokeWeight(2);
  
  line(250,337,268,319);
  line(268,319,294,343);
  line(294,343,321,315);
  line(321,315,343,341);
  stroke(0);
  
  line(241,397, 100+(random(-5,5)), 301+(random(-5,5)));
  line(348,408, 485+ (random(-5,5)), 255 + (random(-5,5)));
  fill(235,233,189);
  ellipse(83+(random(-5,5)),296+(random(-5,5)),30,30);
  ellipse(500+(random(-5,5)),247+(random(-5,5)),30,30);
  line(266,525,252,586);
  line(252,586,134,515);
  line(316,525,346,580);
  line(346,580,471,486);
  fill(0,128,0);
  rect(111,506,32,25);
  rect(458,474,40,25);
  stroke(255,0,0);
  strokeWeight(5);
  fill(255,0,0);
  triangle(158,179,56,92,167,145);
  triangle(167,145,174,25,246,120);
  triangle(246,120,264,9,315,119);
  triangle(315,119,361,18,375,141);
  triangle(375,141,469,55,419,184);
  
  }

 }
  
/*  
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
volume = 0.8*volume + 0.8*volumeF; 
}

//-------------------------------------
void stop(){
in.close();
minim.stop();
super.stop();
}
 
*/

