
void setup(){
  size(700,525);
   PImage img;
  
  img=loadImage("teacup.jpg");
  
  image(img,0,0);
  strokeWeight(10);
  
  //"Su".Upper Most Left Hand Corner.
  
  line(50,85,140,85);
  
  line(140,85,70,200);
  
  line(118,122,170,200);
  
  //"Ki" Upper line second character.
  
  line(250,60,300,200);
  
  line(220,100,300,70);
  
  line(220,170,330,125);
  
  //ro/lo bottom farthest to the left.
  
  line(40,300,60,390);
  
  line(40,300,170,300);
  
  line(170,300,150,390);
  
  line(60,390,150,390);
  
  //Now the sound "heh"
  //bottom middle character.
  
  line(190,350,225,305);
  
  line(225,305,288,385);
  
  //adding a circle to change the sound to "peh."
  
 colorMode(HSB, 100);
 
 fill(0,0,0,10);
 
 strokeWeight(6);
 
  ellipseMode(CORNER);
  
  ellipse(265,295,20,20);
  
 strokeWeight(10);
 
 //"su" to "zu" The Last character. Lower right corner.
 
  line(320,300,400,300);
  
  line(400,302,340,390);
  
  line(385,335,430,400);
  
  colorMode(HSB, 100);
 
 fill(0,0,0,100);
 
 strokeWeight(3);
 
 triangle(430,270,440,290,446,286);
 
 triangle(415,280,425,305,435,300);
 
 //A Japanese styled period...really just a circle.
 colorMode(HSB, 100);
 
 fill(0,0,0,10);
 
 strokeWeight(6);
 
 ellipseMode(CORNER);
 
 ellipse(458,387,18,18);
}
  


