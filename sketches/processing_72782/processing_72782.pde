
/* 
 Spiderman - intro to programming Assignment 2
 by August Sanghyun Park
 Sep. 30. 2012
 
 there is the spiderman sticking on the ceiling, upside down. Using android device's
 accelometer, once it sense acceleration downward larger than certain amount, spiderman falls down
 according to the acceleration. and then he goes up along a spider thread to the ceiling  back.
 */

// setup variables
  // accelometer threshold
// setup() 
  //display setup
// draw()
  // sense accelerometer
  // if acc < threshold && acc < acc_old then y of spiderman == map(acc -> yOfSpiderman) 
  // else yOfSpiderman--
  // if yOfSpiderman <0 then yOfSpiderman = 0
  // if yOfSpiderman == 0 then draw SpidermanOnTheCeiling()
  // if yOfSpiderman >0 then draw SpidermanInTheAir(yOfSpiderman)
  // acc_old == acc 
// SpidermanOnTheCeiling()
  // just draw
// SpidermanInTheAir(yOfSpiderman)
  // draw spiderman, but all the y values are increased by "y of spiderman"

float yOfSpiderman=0;

int thin = 1;    // strokeWeight
int thick  = 5;


void setup(){
  size(600,800);
  smooth();
  
}

void draw(){
  background(0);
 
 //  draw spiderman according to his y position
 if (yOfSpiderman <= 0) {
   if (mousePressed){
   yOfSpiderman = mouseY;
   }
   drawSpidermanOnTheCeiling();
 }
 else if (yOfSpiderman > 0) {
   yOfSpiderman--;
   drawSpidermanInTheAir();
 }
}

void drawSpidermanOnTheCeiling(){
  //ellipse(displayWidth/2, 0,30,30);
  
  fill (0,0,255);  // blue
  stroke (0,0,255);
  strokeWeight(thin);
  ellipse(294,110,237,82);  //trunk
  strokeWeight(thick);
  line(404,95,318,29);    // upper leg
  line(404,95,318,50);
  
  fill(255,0,0);  //red
  stroke(255,0,0);
  strokeWeight(thin);
  ellipse(128,142,124,124); //face
  strokeWeight(thick);
  line(60,0,187,128);      //arms
  line(115,0,187,128);
  line(318,29,373,0);    //lower leg
  line(318,50,428,0);
  
  fill(255);    // white
  stroke(255);
  strokeWeight(thin);
  ellipse(85,162,47,14);    // eyes
  ellipse(148,161,47,14);
}

void drawSpidermanInTheAir(){
  if (yOfSpiderman >= 800) yOfSpiderman= 800;
  //ellipse(displayWidth/2, yOfSpiderman,30,30);
  
  fill(255,0,0);  //red
  stroke(255,0,0);
  strokeWeight(thin);
  strokeWeight(thick);
  noFill();
  //arc(150,103+yOfSpiderman,65,218,4.9,4.5); // arm
  ellipse(150,103+yOfSpiderman,65,218); // arm
  
  fill (0,0,255);  // blue
  stroke (0,0,255);
  strokeWeight(thin);
  ellipse(158,261+yOfSpiderman,48,146);  //trunk
  strokeWeight(thick);
  noFill();
  ellipse(158,413+yOfSpiderman,77,187);    // upper leg
  fill(0);
  stroke(0);
  rect(100,413+yOfSpiderman, 100,100);
  
  
  fill(255,0,0);  //red
  stroke(255,0,0);
  strokeWeight(thin);
  ellipse(128,142+yOfSpiderman,124,124); //face
  noFill();
  strokeWeight(thick);
  line(119,413+yOfSpiderman,128,499+yOfSpiderman);  //lower leg
  line(196,413+yOfSpiderman, 183,499+yOfSpiderman);
  line(128,499+yOfSpiderman,114,522+yOfSpiderman);  //foot
  line(183,499+yOfSpiderman, 203,516+yOfSpiderman);
  
  fill(255);    // white
  stroke(255);
  strokeWeight(thin);
  ellipse(85,162+yOfSpiderman,47,14);    // eyes
  ellipse(148,161+yOfSpiderman,47,14);
  strokeWeight(thick);
  line (150,0,150,yOfSpiderman);
}



