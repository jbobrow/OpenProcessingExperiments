
//Shubhank sahay
//*Inspired by Jae Won Lee*
void setup()
{
  size(900, 900);
  smooth();
  noStroke();
  PFont font;
  font = loadFont("AdobeHebrew-Italic-48.vlw");
  textFont(font, 18);
}

void draw() {
  background(0);
  int millsec = second();
  int sec = second(); 
  int min = minute();  
  int hour = hour();   
  

  stroke(20);
  fill(0,250,195);
  ellipse(width/2, height/2, 850, 700);
  arc(width*2, height*2, 849, 849, PI/4, PI/2);
  fill(random(255));
  stroke(125, 45);
  ellipse(width/2, height/2, 600, 600);
  fill(#4D0705);
  ellipse(600, 600, PI/6, PI/6 + radians(sec)*1000*360);
  fill(0);
  ellipse(width/2, height/2, 599, 450);
  fill(0);
  ellipse(width/2, height/2, 500, 500);
  fill(#930E09);
  arc(width/2, height/2, 499, 500, PI/4, PI/4 + radians(sec)/60*360);
  fill(0);
  stroke(20);
  ellipse(width/2, height/2, 449, 449);
  stroke(10);
  fill(25);
  ellipse(width/2, height/2, 450, 450);
  fill(255, 0, 0);
  arc(width/2, height/2, 450, 450, PI/6, PI/6 + radians(min)/60*360);
  ellipse(width/2, height/2, 350, 350);
  fill(#FA571C);
  ellipse(width/2, height/2, 400, 400);
  fill(#000203);
  arc(width/2, height/2, 400, 400, PI/2, PI/2 + radians(hour)/24*360);
  fill (random(#74DCF5));
  stroke(5);
  ellipse(width/2, height/2, 269, 269);
  fill(255);
  textAlign(CENTER);
  fill(255);
  text("Flash= Milliseconds", width/2, height/2.25);
  text("White = Seconds", width/2, height/2);
  text("Red = Minutes", width/2, height/1.8);
  text("Orange = Hours", width/2, height/1.65);
}



