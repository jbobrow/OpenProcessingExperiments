
/*
Hi guys. I need help. I do not realy understand why  my skech do not work propertly...

how to "join? lines with rectangle  angles ?

ok  debuged myself ;] . everything working !
*/



int x=3; // Width  ratio (like TV)
int y=2;  // Height Ratio (likeTV)
void setup()
{
  size(displayWidth/x, displayHeight/y);
  frameRate(30);
}
void draw()
{
  background(100); 
  stroke(255);
  fill(frameCount/2);
  rectMode(CENTER);
  
  rect(width/2, height/2, displayWidth/x-x*10, displayHeight/y-y*10);  // big rectangle  ++++++  if rect  10
  
  line(width/x-width/x+x*5, height-height+y*5, width/2, height/2); // up left line
  line(displayWidth/x-x*5, displayHeight/y-displayHeight/y+y*5, width/2, height/2); // up right line
  line(displayWidth/x-displayWidth/x+x*5, displayHeight/y-y*5, width/2, height/2); // down left line
  line(displayWidth/x-x*5, displayHeight/y-y*5, width/2, height/2); // down right line  +++++++ then line need be 5 
  // because cet have 2 corners for 5  so = 10 and line have only one corner for 5 so 10/2 =5 rect 5 line 5 all good
  
  fill(frameCount/2, frameCount/3, frameCount/4);
  ellipse(width/2, height/2, width/x/2, height/y/4); // center ellipse
  // x  ,  y  , w  , h 
  rect(width/5, height/2, width/x/5, height/y/10);  // left rectangle
  rect(width-width/5, height/2, width/x/5, height/y/10);  // right rectangle
  }
void keyPressed()
{
  println(key);
  println(frameCount/2); // shows value when key is pressed
  // now i can see what value is (max 255,
  // after 255 all time will be white (but not. sometging resets) ???
  println(frameCount/3); 
  println(frameCount/4);
}
