
PImage drawing;



void setup() {
  size(777, 596);
  drawing =loadImage ("drawing.jpg");
}



void draw() {
  background(drawing);
  image(drawing, 0, 0);


  PFont myfont;
  myfont=loadFont("GloucesterMT-ExtraCondensed-48.vlw");
  textFont(myfont, 40);

fill(0);
  text("Art Student Debt", 30, 50);
  text("vs.", 60, 70);
   fill(250,5,5);
  text("Post-Graduation Earnings", 30, 100);
 

  textFont(myfont, 20);
  fill(0);
  text("$7,000", 70, 470);
  text("$18,000", 180, 250);
  text("$10,000", 280, 430);
  text("$40,000", 450, 15);
  text("$12,000", 650, 410);
  text("$25,000", 720, 180);
  
  textFont(myfont, 17);
  fill(250,5,5);
  text("$10,000", 110,430);
  text("$14,000",210, 360);
  text("$3,000", 320, 550);
  text("$30,000",500,60);
  text("$2,000", 640,560);
  text("$1,000",740,550);
  
}








