
boolean mode = true;
void setup()
{
 size (400,500);
 noLoop();
}

void draw()
{
  background(185,185,186);
  if(mode == true)
  {
  smooth();
  fill(0);
  //black
  ellipse(200,200,375,375);
  fill(255);
  //white
  ellipse(200,200,250,250);
  stroke(0);
  textSize(150);
  fill(0);
  textAlign(CENTER);
  text( "8", 200,250);
  textSize(15);
  textAlign(CENTER);
  fill(126,27,27);
  text( "Think of a yes/no question. \nThen click on the Magical 8 Ball to see the answer.", 200,450);
  }
  else
  {
  String []num={"doesn't look good", 
"don't count on it ",
"i think it's a no",
"without a doubt",
" I'm a bit dizzy, try again",
"Certainly",
"That would be a no",
"Perhaps yes",
"cannot predict now",  
"better not tell you now", 
"No way, Jose",
" If the weather looks good ",   
"you should ask a monkey"}; 
  int jump = int(random(13));
  smooth();
  fill(0);
  //black
  ellipse(200,200,375,375);
  fill(255);
  //white
  ellipse(200,200,250,250);
  stroke(0);
  textSize(20);
  fill(255,0,0);
  textAlign(CENTER);
  text( num[jump], 200,225);
  }
}
void mouseClicked()
{
  mode = !mode;
  redraw();
}
