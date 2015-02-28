
PFont theFont;
String stuff;
color colG = color(28, 70, 6);
color colR = color(255, 0, 0);
int A = 600;

void setup () {
  size (600, 600);
  smooth();
  theFont = loadFont ("Andalus48.vlw");
  stuff = "Push the Green Button!";
}

void draw () {
  background (180);
  fill (colR); ellipse (300, 500, 100, 100);
  if (dist(mouseX, mouseY, 300, 100) < 50 && mousePressed) {
    colG = color(237, 252, 28);
    background(14, 155, 229);
    stuff = "Yay! Good User!";
    fill (41, 229, 14); rect (0, 400, 600, 200);
    fill (#003300); stroke (0); triangle (65, 550, 150, 450, 235, 550); triangle (85, 490, 150, 390, 215, 490); triangle (100, 415, 150, 340, 200, 415);
    fill (#003300); stroke (0); triangle (350, 450, 450, 300, 550, 450); triangle (370, 375, 450, 225, 530, 375); triangle (390, 310, 450, 190, 510, 310);
   } 
  fill (colG); ellipse (300, 100, 100, 100);
  textFont (theFont, 25);
  fill (0); text (stuff, 180, 300);
  
  if (dist(mouseX, mouseY, 300, 100) < 50){
    colG = color (0, 255, 0);
  } else {
      colG = color (28, 70, 6);
    }
    
   if (mouseY > 150 && mouseY <= 250) {
     stuff = "Go on. Push the Green Button.";
   } else if (mouseY > 250 && mouseY <= 350) {
       stuff = "No, really! Push the Green Button!";
   } else if (mouseY > 350 && mouseY <= 450){
       stuff = "Don't you dare push the Red Button!";
   } else if (mouseY > 450){
       stuff = "Really! Don't Push the Red Button!";
   } else {
     stuff = "Push the Green Button!";
   }
   
   if (dist(mouseX, mouseY, 300, 500) < 50){
     colR = color(95, 0, 13);
     stuff = "You'll regret it...";
   } else {
     colR = color(255, 0, 0);
   }
   
   if (dist(mouseX, mouseY, 300, 500) < 50 && mousePressed){
     //A = A-1;
     background (95, 0, 13); 
     fill (255, 0, 0); ellipse (300, 300, 150, 150);
     fill (0); triangle (250, 225, 225, 275, 150, 150); 
     triangle (350, 225, 375, 275, 440, 150);
     ellipse (270, 270, 20, 20); 
     line (270, 250, 290, 270);
     ellipse (330, 270, 20, 20);
     line (330, 250, 310, 270);
     textFont (theFont, 48);
     fill (0); text ("Bad User!", 215, 450);
   }
}

