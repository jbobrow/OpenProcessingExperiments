
void setup() {
  size(677, 381);
  PImage img;
  img = loadImage("lucygood.png");
  image(img, 0, 0);
  

    img = loadImage("pigpengood3.png");
  image(img, 450, 120);


  
 fill(0); 
  PFont font;
font = loadFont("AmericanTypewriter-Condensed-24.vlw");
textFont(font);
String s = "Pig-Pen is too clean! Make him dirty.";
text(s, 0, 0, 500, 100);

}

int timer=0;

float i;

void draw() {
  
  timer = timer+1;
  
  if (timer>300) {
    fill(0);
    rect(0, 0, 1000, 1000);

  }
  
}
  
  float j = 20;   
  float k = 0;  

 void mouseClicked() {
   
  
   
 if (mouseX < 400 ) {
  if (mouseY > 0) {
    if(mouseX > 100) {
      if(mouseY < 381) {
         j = j + 20;
stroke(0);
strokeWeight(3);
line(217, 227, 211, 232);
line(228, 227, 231, 232);
line(200, 170, 210, 177);
line(240, 170, 230, 177);

noStroke();
fill(255, 0, 0, j);
ellipse(200, 210, 17, 17);
ellipse(240, 208, 17, 17);
      }
    }
  }
 }

 if (mouseButton == LEFT) {
 translate(-20, -20);
 PImage img;
  img = loadImage("dirtgood.png");
 image(img, mouseX, mouseY);
 }

 if (mouseButton == RIGHT) {
   translate(-20, -20);
   PImage img;
   img = loadImage("dirtgood2.png");
   image(img, mouseX, mouseY);
  }
  
  if (j > 120){
    fill(0);
    rect(0, 0, 700, 400);
    
    
    fill(255, 0, 0);
    PFont font;
font = loadFont("AmericanTypewriter-Condensed-24.vlw");
textFont(font);
String s = "Game Over. Lucy does not like dirt.";
text(s, 150, 200, 500, 100);
    
  }
  
  if (mouseX < 630 ) {
  if (mouseY > 50) {
    if(mouseX > 400) {
      if(mouseY < 450) {
        k = k + 20;
      }
    }
  }
  }
  
  if (k > 140) {
    fill(0);
    translate(20, 20);
    stroke(0);
strokeWeight(3);
line(522, 230, 520, 225);
line(545, 230, 547, 225);
line(522, 225, 545, 225);
line(217, 227, 213, 223);
line(229, 225, 233, 220);
line(420, 127, 460, 190);

PFont font;
font = loadFont("AmericanTypewriter-Condensed-24.vlw");
textFont(font);
String t = "Thanks!";
text(t, 380, 100, 200, 100);

font = loadFont("AmericanTypewriter-Condensed-40.vlw");
textFont(font);
String u = "YU WN";
text(u, 30, 40, 40, 381);

font = loadFont("AmericanTypewriter-Condensed-40.vlw");
textFont(font);
String v = "O";
text(v, 32, 70, 40, 381);

font = loadFont("AmericanTypewriter-Condensed-40.vlw");
textFont(font);
String w = "I";
text(w, 40, 190, 40, 381);

font = loadFont("AmericanTypewriter-Condensed-40.vlw");
textFont(font);
String x = "!";
text(x, 37, 250, 40, 381);
  }
    
  
  
  
  
  
  }

