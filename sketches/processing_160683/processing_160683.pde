
//declare variables
PImage newYork;
PFont didotFont;


void setup() {
   size(600,800);
   newYork=loadImage("IMG_3654small.jpg");
   didotFont=loadFont("Didot-Bold-30.vlw");
   
}

void draw() {
  image(newYork,0,0);
 //line1
  textFont(didotFont);
  fill(255);
  text("COME SAIL AWAY",130,260);
  //line2
  textFont(didotFont);
  fill(255);
  text("AT THE ANNUAL SAILBOAT RACES",55,310);
  
  //footer
  textFont(didotFont);
  fill (255);
  textSize(20);
  text("CENTRAL PARK // 10 A.M. // 09.27.14",120,750);
  


}



