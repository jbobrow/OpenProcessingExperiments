
/*   Homework Two - Random Composition
     Sabrina Pardus 
     09/10/13
*/

void setup() {
  //Composition size (400 pixels)
  size(400, 400);
  //Black background
  background(0);
}

void draw() {
  background(0);
  createPentagon();
  smooth();
  frameRate(3);
}

//Random colors
color randColors() {
  float r = random(0,250);
  float g = random(0,250);
  float b = random(0,250);
  return color(r,g,b);
}
   
//Random locations
int randLoc() {
  int rand = (int)random(-20,20);
  return rand;
}
   
//Random size
int randWidth() {
  int rand = (int)random(1,6);
  return rand;
}
  
//Create Pentagon
void createPentagon() {
  strokeWeight(randWidth());    
  stroke(randColors());
  //Draw top section of pentagon
  line(200,0,(80+randLoc()),50);
  line(200,0,(60+randLoc()),150);
  line(200,0,(170+randLoc()),45);  
  line(200,0,(98+randLoc()),345);
  line(200,0,(190+randLoc()),90);
  line(200,0,(220+randLoc()),195);
  line(200,0,(320+randLoc()),170);
  line(200,0,(330+randLoc()),140);
  line(200,0,(255+randLoc()),48);
  line(200,0,(300+randLoc()),30);
  
  stroke(randColors());
  strokeWeight(randWidth());
  //Draw right section of pentagon
  line(400,160,(330+randLoc()),45);
  line(400,160,(253+randLoc()),35);
  line(400,160,(390+randLoc()),125);
  line(400,160,(340+randLoc()),150);
  line(400,160,(340+randLoc()),250);
  line(400,160,(161+randLoc()),253);
  line(400,160,(160+randLoc()),170);
  line(400,160,(162+randLoc()),325);
  line(400,160,(300+randLoc()),245);
  line(400,160,(310+randLoc()),330);
  
  stroke(randColors());
  strokeWeight(randWidth());
  //Draw left section of pentagon
  line(0,160,(18+randLoc()),25);
  line(0,160,(50+randLoc()),75);
  line(0,160,(135+randLoc()),40);
  line(0,160,(130+randLoc()),101);
  line(0,160,(220+randLoc()),130);
  line(0,160,(60+randLoc()),160);
  line(0,160,(260+randLoc()),230);
  line(0,160,(80+randLoc()),205);
  line(0,160,(150+randLoc()),350);
  line(0,160,(80+randLoc()),310);
  
  stroke(randColors());
  strokeWeight(randWidth());
  //Draw bottom-left section of pentagon
  line(80,400,(15+randLoc()),325);
  line(80,400,(8+randLoc()),215);
  line(80,400,(60+randLoc()),225);
  line(80,400,(95+randLoc()),170);
  line(80,400,(180+randLoc()),240);
  line(80,400,(130+randLoc()),345);
  line(80,400,(245+randLoc()),310);
  line(80,400,(180+randLoc()),390);

  stroke(randColors());  
  strokeWeight(randWidth());
  //Draw bottom-right section of pentagon
  line(320,400,(220+randLoc()),360);
  line(320,400,(100+randLoc()),225);
  line(320,400,(260+randLoc()),340);
  line(320,400,(160+randLoc()),160);
  line(320,400,(230+randLoc()),120);
  line(320,400,(320+randLoc()),210);
  line(320,400,(375+randLoc()),230);
  line(320,400,(365+randLoc()),315);


}





