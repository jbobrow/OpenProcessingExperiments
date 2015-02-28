
/* @pjs preload="PainterMan.gif"; */

  void setup() { 
    size(600, 600); 
     background (255);
  }
  
  void draw() {

    float x;
 x = (random (0, 20)); 
    strokeWeight(x); 
    smooth(); 
    stroke(#FAACF2, 190); 
  
  PImage img;
  img = loadImage("PainterMan.gif");
tint(50, 200, 204, 10);
image(img, mouseX, mouseY);  

   float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
   strokeWeight(weight);
    line(mouseX, mouseY, pmouseX, pmouseY); 

float ellipse1x;
ellipse1x = random (-100, 700);
float ellipse1y;
ellipse1y = random(-100, 700);

fill (#7EF1FF, 100);
stroke(#F7C6FF, 50);
ellipse(ellipse1x, ellipse1y, 50, 50);

fill (#FF9655, 100);

rect(ellipse1x/4, ellipse1y/4, 25, 25);
rect(ellipse1x*4, ellipse1y*4, 25, 25);

int ellipse = round( map(mouseY, 0,height, 200,600));
int ellipse2 = round( map(mouseX, 0, width, 0, 160));
stroke(#C4FFD9, 50);
fill (#D5ADFF, 50);
  ellipse ( ellipse2, ellipse, 50,50 );

 int b = round( map(mouseX, 0,width, 0,100) );
  fill(0,0,b, 10);
  noStroke();
  rect(ellipse, ellipse2, 50, 50);
    }


