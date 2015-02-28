
void setup(){
  size(924,450);
  background(57,57,57);
  textAlign(CENTER);
  textSize(12);
  text("Press G to start V to stop.",462, 105);
  text("G to reset and R to reset with a random background.",462, 125);
  text("Move the mouse to draw.",462, 145);
  text("Clicking and holding will make the colors change.",462,165);
  text("D= quit L= add lines R= random background P= quad shape W= no stroke, E= white stroke.",462, 185);
  text("S= save your current screen (saves as a PNG wherever the circles_draw_2.jar is).",462, 205);
  text("Email your saved images to generativexperiments@gmail.com.", 462,225);
  text("If you get confused, press I for instructions.", 462,245);
if (h<12){  
stroke(0);}
  noLoop();
}

int h = hour();
color c = color(123,123,123);

void draw(){
  
  ellipse(mouseX,mouseY,mouseX/2,mouseY/2);
  fill(random(0,255),mouseY/4,mouseX/4);
  
  if (mousePressed) {
    fill(mouseX,150,mouseY-100);}
  strokeWeight(0.5);
  if (keyPressed); {
    if (key == 'd' || key == 'D'){
      exit();}
    if (key == 'l' || key == 'L'){
      rect(mouseX,mouseY+75,2,2400);}
    if (key == 'w' || key == 'W'){
       noStroke();}
    if (key == 'e' || key == 'E'){
       stroke(255);}
    if (key == 'p' || key == 'p'){
      quad(200,2200, mouseY, mouseX,-400,-400,mouseX,mouseY);
      ellipse(0,0,0,0);
    }
  } 
}
  
void keyPressed() {
   if (key == 's' || key == 'S') {
      saveFrame("filename-####.png");
    }
   if (key == 'i' || key == 'i') {
      background(random(0));
      textAlign(CENTER);
      textSize(12);
      text("Press G to start V to stop.",462, 105);
  text("G to reset and R to reset with a random background.",462, 125);
  text("Move the mouse to draw.",462, 145);
  text("Clicking and holding will make the colors change.",462,165);
  text("D= quit L= add lines R= random background P= quad shape W= no stroke, E= white stroke.",462, 185);
  text("S= save your current screen (saves as a PNG wherever the circles_draw_2.jar is).",462, 205);
  text("Email your saved images to generativexperiments@gmail.com.", 462,225);
  text("If you get confused, press I for instructions.", 462,245);
      noLoop();
   }
   if (key == 'r' || key == 'R'){
      background(random(1,255),random(1,255),random(1,255));
      loop();}
   if (key == 'v' || key == 'V'){   
     noLoop();}   
   if (key == 'g' || key == 'G'){  
      background(57,57,57);
     loop();}   
 }
 


