
// program that uses external functions
// like the clock time of the computer
// code used from class sketches and modified


int hours;
int minutes;
int seconds;
int days;
int years;
int months;

void setup() {
  size(210, 280);
  PFont Serif;
  Serif = loadFont("ACaslonPro-Semibold-48.vlw"); 
  // is not the font i wanted, but is type no less.
  textFont(Serif,13); // textFont is command for proc 2.0
}

void draw() {
  background(110,0,110); // if in the draw will refresh screen 
  // this will allow second hand to LOOK like secondhand.
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  int f = second(); // Values from 0 - 59
  hours = hour(); 
  seconds = second();
  minutes = minute();
  
  // code below from brians class test
  // fix for 24 hour clock
  if (hours > 12) {
    hours -= 12;
  }

  String u = "<--Today's Date";
  String s = String.valueOf(d);
  text(s, 10, 28);
  s = String.valueOf(m);
  text(s, 25, 28); 
  s = String.valueOf(y);
  text(s, 50, 28);
  text(u, 90, 28);
 // below is text of application 
  String o = String.valueOf(minutes);
  String l = "Minutes";
  text(o,65,45);
  text(l,85,45);
  
  String p = String.valueOf(hours);
  String k = "Hours";
  text(k,22,45);
  text(p,10,45);
  
  String j = "<--Time";
  text(j,140,45);
  // end of text application
  
  // lines for clock "hand markers"
  {
  stroke(252,56,86);
  line(98,70,102,70); // 12 hand
  line(190,158,190,162); // 3 hand
  line(10,158,10,162); // 9 hand
  line(98,250,102,250); // 6 hand
  stroke(252,56,86);
  }
  // start of drawing a shape for clock
 {{
   translate(100,160);
   rotate(radians(90));}
   // hour hand
  strokeWeight(8);
  stroke(255, 229, 98);
  pushMatrix();
  rotate(radians(30 * hours));  // 30 * 12 = 360 degrees
  ellipse(0, 0, -40, 15);
  popMatrix();

  // below is small circle that rotates around
  pushMatrix();
  stroke(255,0,100);
  rotate(radians(20 * seconds));
  ellipse(5,5,5,5);
  popMatrix();
  // another circle
  
  pushMatrix();
  stroke(10,0,90);
  rotate(radians(1 * seconds));
  ellipse(1,80,1,15);
  popMatrix();
  
  pushMatrix();
  stroke(9,45,110);
  rotate(radians(50*seconds));
  ellipse(15,25,90,100);
  popMatrix();
  
  
  // minute hand
  strokeWeight(6);
  stroke(144, 255, 85);
  pushMatrix();
  rotate(radians(6 * minutes)); // 6 * 60 = 360 degrees
  ellipse(0, 0, -70, 20);
  popMatrix();

  // second hand
  strokeWeight(4);
  stroke(85, 217, 255);
  pushMatrix();
  rotate(radians(6 * seconds)); // 6 * 60 = 360 degrees
  ellipse(0, 0, -100, 25);
  noFill();
  popMatrix();
 }
  }
