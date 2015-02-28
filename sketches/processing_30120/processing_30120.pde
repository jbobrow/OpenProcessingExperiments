
PFont myFont;

void setup() {
  size(450, 450);
  smooth();
  myFont = createFont("Helvetica", 12);
  textFont(myFont);
}
 
void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  
  int sec = second();
  int mi = minute();
  int ho = hour();



 
 
  if(h > 12) {
     h -= 12;
  }
  

  translate(225,225);
  rotate(radians(90));
  noFill();
   


   
     // stunden kreis farbig
  noStroke();
  fill(0);
  ellipse(0, 0, -800, 800);
   
    // stunden zeiger
  strokeWeight(25);
  stroke(255);
  pushMatrix();
  rotate(radians(30 * h));
  line(0, 0, -400, 0);
  popMatrix();
   
     // minuten kreis außen weiß
  noStroke();
  fill(255);
  ellipse(0, 0, -350, 350);
   
     // minuten kreis farbig
  noStroke();
  fill(0);
  ellipse(0, 0, -300, 300);
  
       // minuten kreis innen weiß
  noStroke();
  fill(255);
  ellipse(0, 0, -250, 250);
 
    // minuten zeiger
  strokeWeight(12);
  stroke(255);
  pushMatrix();
  rotate(radians(6 * m));  
  line(0, 0, -165, 0);
  popMatrix();
  
        // kreis sekunden
  fill(255, 30, 50, s*5);
  ellipse(0, 0, s*3, s*3);

  
       // digitaluhr
  rotate(radians(-90));
  translate(-225,-225);
  fill(255);
  String t = ho + ":" + nf(mi, 2) + ":" + nf(sec, 2);
  text (t, 10, 440);
}

