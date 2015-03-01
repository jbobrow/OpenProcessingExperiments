
/*
 * Creative Coding
 * Week 6 - Postcard
 * by Janeen Cohen
 *
 * This sketch shows how to use text in Processing
 * It prints several inspirational phrases in increasing sizes
 * at somewhat random locations, draws a pattern of lines in one
 * corner, prints my name, and uses recursion
 * to draw a spinning circle.
 *
 */

PFont myFont;      
float xSize = 10;
String[] lines ;
String [] fonts;
PFont myfont;
int flag = 0;
float finc;
int inc;
float r = random(200,255); //for name in shades of purple
float g = random(5,20);
float b = random(200, 255);

int startlevel = 3;    //for spinning circle

float ratio = 2;  // size ratio of circles
int division = 6; // number of circles inside each circle

void setup() {
  size(800, 600);
  background(0);
  String [] fonts = PFont.list();
  fonts[0] = ("Ariel");
  fonts[1] = ("Impact");
  fonts[2] = ("Helvetica");
  fonts[3] = ("Times Italic");
  fonts[4] = ("Trebuchet");
  fonts[5] = ("Garmond Italic");
  fonts[6] = ("Times New Roman");
  
  String[] lines = loadStrings("janeen.txt");                     // print the inspirational sayings
    for(int i = 0; i<lines.length-1; i++){
      finc = random(40);
      inc = int(finc);
    myfont = createFont(fonts[i], 30+2*i, true);
    textFont(myfont);
    fill(random(200,255), random(200, 255), random(10, 50));
    textSize(32+2*i);
    text(lines[i], random(120), 40+i*680/lines.length);
  }
textSize(36);  // prints my name
fill(r, g, b);
text("Janeen", 690, 240);  



}
  

void draw() {
if (flag == 0){                                                    //prints the colored dots
  for (int i = 1; i <1000; i++){
    stroke(random(255), random(255), random(255));
    ellipse(random(800), random(600), 2, 2);
    if (i <300){
      stroke(255,255,255);
      strokeWeight(.3);
      line(400+i*2, 598, 798, 598-i*2);
      line(i*2, 2, 300-i*2, i*2); 
    }
  }
  flag = 1;
}


translate(4*width/5, height/5);                                   //draw spinning recursive circle
  if (mousePressed && startlevel < 6){                            // mouseclick for variation
 startlevel++;
  }
  if  (startlevel == 6){
    startlevel = 2;
  }
drawCircle(height/6, startlevel);

}
void drawCircle(float radius, int level) {
  float tt = random(125, 325) * level/4.0;
  noFill();
  strokeWeight(1);
  stroke(tt);

  // draw the circle
  ellipse(0, 0, radius*2, radius*2);      
  if (level > 1) {
    level = level - 1;

    // draw the inner circles
    for (int i = 0; i < division; ++i) {  
      pushMatrix();
      float mult = (level % 2 == 1) ? -1 : 1;
      rotate(mult * frameCount / (10.0 * level) + TWO_PI/division * i);
      translate(radius - radius/ratio, 0);
      drawCircle(radius/ratio, level);
      popMatrix();
    }
  }
}
