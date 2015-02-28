
//Recreate an image.
//by Jason Fitzgerald
//Week 1
//Notes: I chose the logo for the band Bauhaus.
 
//trying a random color command!
 float faceG;
 float grainX;
 float grainY;
 
void setup(){
  
  background(faceG);
  
  size(400,400);
  smooth();
  //trying to adjust framerate?!?
  frameRate(30);
  
  
}
 
void draw(){
  //circle
  faceG = random(35);
  fill(faceG);
    stroke(255);
     ellipse(200, 200, 385, 385);
     
 //lines
 fill(255);
rect(150, 80, 60, 60);

  line(115, 80, 147, 80);
  line(210, 175, 210, 135);
 
 //face profile
  line(275, 250, 275, 25);
  line(275,250, 225, 250);
  line(275,250, 225, 250);
  rect(245, 250, 15, 95);
  rect(175, 344, 85, 1);
   rect(225, 295, 30, 1);
   rect(199, 344, 40, 43);
 strokeWeight(5); 
 
 
//tring to put in a film grain. Got this idea from working on a tutorial in "Learning Processing" by daniel shiffman.
//oops, it didnt work quite right...never mind.

}


