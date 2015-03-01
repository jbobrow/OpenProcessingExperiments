
// a dual, digital+analogue clock for moto-360
//use of radial pattern of arc and ellipse to code
//author: krishna_sistla

PImage bg; 
PFont myFont; 
 void setup()
{
  size(600, 450); // acc. to size of image
  bg = loadImage("clock.jpg"); // 
  
}
 
void draw() {
  background(bg);
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // values from 0-24
  fill(100);
  noStroke();
  ellipse(303.5, 212.5, 200,200);//largest ellipse first-seconds
  fill(#006064);
  arc(303.5, 212.5, 200,200, PI+PI/2 ,PI+PI/2 + radians(s)/60*360);
  fill(120);
  noStroke();
  ellipse(303.5, 212.5, 175,175);//middle ellipse next-minutes
  fill(#00acc1);
  arc(303.5, 212.5, 175,175, PI+PI/2 ,PI+PI/2 + radians(m)/60*360);
  fill(160);
  noStroke();
  ellipse(303.5, 212.5, 125,125); //middle ellipse next-hours
  fill(#26c6da);
  //changing hours into the radial 12hour pattern for easy user understanding
  
  if(h<12){
  arc(303.5, 212.5, 125,125, PI+PI/2 ,PI+PI/2 + radians(h)/12*360);
  } // hours 1-12
  else
  {arc(303.5,212.5, 125,125, PI+PI/2 ,PI+PI/2 + radians(h-12)/12*360);
}  // hours 12-24
  fill(60);
  myFont = createFont("Roboto", 28); // to look more like moto360
  textFont(myFont);
  textAlign(CENTER);
  textSize(28);
  text(h + ":" + m, 290, 222);
  textSize(16); // varied size of seconds text.
  text(":" + s, 337, 222);
 
}
//end


