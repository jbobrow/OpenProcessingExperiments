
float lineX = 450;
float lineY = 450;
int radius = 400;
int angle = 0;
int red = 0;
int blue = 0;
int i = 0;
int s = 0;
int a = 100;
int opacity= 40;
PFont f;

void setup(){
  background(220);
  size (800, 1000);
  frameRate(100);
  fill(50);
  rectMode(CENTER);
  rect(400, 950, 800, 100);
  f = createFont("Arial",14,true); // A font to write text on the screen
}

void draw(){
//getting the lines to draw in random lengths and angles away from the mouse
 if ((mousePressed) && mouseX>50 && mouseX<750 && mouseY>50 && mouseY<800){
   mousePressed = true;
   i = random(-60, 60);
   s = random(-60, 60);
   a = random(100, 255);
   strokeWeight(random(.5, 3));
   stroke(red, 0, blue, a);
 line(mouseX, mouseY, mouseX+i, mouseY+s);
 red= floor(random(250));
 blue= floor(random(250));
 }
 
 fill(0);
 noStroke();
 rect(125, 950, 150, 80);
 textFont(f, 14);
 fill(220);
 text("Save Drawing", 80, 955);
 if ((mousePressed) && mouseX>50 && mouseX<200 && mouseY>925 && mouseY<975){
   saveFrame("images/circles-###.png"); //when running on the web it will put the PNG in a new browser tab
 }
 
 fill(0);
 rect(375, 950, 150, 80);
 textFont(f, 14);
 fill(220);
 text("New Layer", 340, 955);
 if ((mousePressed) && mouseX>300 && mouseX<450 && mouseY>925 && mouseY<975){
   noStroke();
   fill(220, opacity);
   rect(400, 400, 800, 950);
 }
}




