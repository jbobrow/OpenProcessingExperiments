

int hours;
int minutes;
int seconds;
int SS = 0;


void setup() {
  size(600, 600);
  colorMode(HSB, 100);
  background(0, 0,90);
  strokeCap(ROUND);
  smooth();
}

void draw() {
 
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
 
background(000);
 
    // center sketch
  translate(300,300);
  rotate(radians(90));
  noFill();

//minutes

S();
//SS();
M();
H();

//??
//fromhours
//stroke(37, random (100), 67, 10); 
//line(0, random(-600), 0, 0);
fill (37, random (100), 67);
ellipse (0, random(-600), 20, 20);
/* Stuff..
//from seconds to minutes
//stroke( 13, random(100), 61, 50);
//line(0, random(600), 0, 0);
fill( 13, random(100), 61);
ellipse(0, random(300), 20, 20);

//from minutes hours

fill( 355, random(100), 99);
ellipse(random(300), 0, 20, 20);
stroke( 355, random(100), 99, 10);
line( 0, 0,  300, 0);
line( 0, 0,  -300, -300);
*/


//center
noStroke();
fill(65, random(100), 99);
ellipse( 0, 0, 30, 30);




  
}

void S(){
  
    // second hand
pushMatrix();
rotate(radians(6 * seconds));
//center minute
noStroke();
 fill(65, 98, 99);
ellipse( -200, 0, 20, 20);
ellipse(random(-200), 0, 20, 20);

//from minutes to plane
  fill( 13, 99, 61);
ellipse(-200, random(-600), 20, 20);


popMatrix();

}

/*
void SS(){
    
  pushMatrix();
rotate(radians(6 * seconds));
noStroke();
fill ( 40, random(50), 50);
ellipse( 0,  random (-600), 20, 20);

popMatrix();
 
}

*/


void M(){
strokeWeight(6);
  noStroke();
  fill( 13, 99, 61);
   
  pushMatrix();
  rotate(radians(6 * minutes));
 
  //center minute
 ellipse( -100, 0, 20, 20);

  ellipse( random(-100), 0, 20, 20);
  
  //go to minutes from plane
  fill( 355, 97, 99);
 ellipse( -100, random(-600), 20, 20); 
 //from plane to hours
 
   fill( 13, 99, 61);
ellipse(-100, random(300), 20, 20);

  popMatrix();
  

  
}

void H(){

  noStroke();
  fill( 355, 97, 99);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  // the center hour (?)
  ellipse( -80, 0, 20, 20);
    ellipse( random(-80), 0, 20, 20);
  //go from hour to plane
    
     fill(37, 68, 67);
    ellipse(-80, random(-600), 20, 20);
    
     //go to hours from plane
  fill( 355, 97, 99);
 ellipse( -80, random(300), 20, 20); 
  popMatrix();
  
 
  
}


