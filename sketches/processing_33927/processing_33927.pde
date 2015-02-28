
void setup()
{
  size(600, 600);
  smooth();
  noStroke();
  PFont font;
  font = loadFont("Aharoni-Bold-48.vlw");
  textFont(font, 32);
}

void draw() {
  background(0);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
  
  fill(100);
  ellipse(width/2, height/2, 500,500);
  fill(255);
  arc(width/2, height/2, 500,500, PI+PI/2 ,PI+PI/2 + radians(s)/60*360);
  fill(0);
  ellipse(width/2, height/2, 449,449);
  fill(120);
  ellipse(width/2, height/2, 450,450);
  fill(#ffcc33);
  arc(width/2, height/2, 450,450, PI+PI/2 ,PI+PI/2 + radians(m)/60*360);
  fill(0);
  ellipse(width/2, height/2, 339,339);
  fill(140);
  ellipse(width/2, height/2, 400,400);
  fill(255,0,0);
  arc(width/2, height/2, 400,400, PI+PI/2 ,PI+PI/2 + radians(h)/24*360);
  fill(0);
  ellipse(width/2, height/2, 349,349);
  fill(255);
  textAlign(CENTER); 
  text(h + " h  " + m + " m  " + s + " s", width/2, height/2);

}

