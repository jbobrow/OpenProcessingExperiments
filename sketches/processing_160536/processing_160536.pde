
PImage myImage;
PImage myImage2;
PFont myFont;
void setup() {
   size(980,551);
   myImage=loadImage("b_2.jpg");
   myImage2=loadImage("b_3.jpg");
   myFont=loadFont("ACaslonPro-Regular-48.vlw");
}
void draw() {
  image(myImage,0,0);
  image(myImage2,width/2,height/2);
  textFont(myFont);
  fill(255);
  textSize(64);
  text("Center Four Exhibit", 20,450);
  textFont(myFont);
  fill(255);
  textSize(24);
  text("23:59 Berlin. All night.", 220,400);
}


