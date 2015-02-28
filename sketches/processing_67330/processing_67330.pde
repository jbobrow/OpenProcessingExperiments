
int second;  
int minute;  
int hour;    

void setup()
{
  size(600, 600);
  smooth();
  noStroke();
}
 
void draw() {
  background(0);
  
  second = second();  
  minute = minute();  
  hour = hour(); 
  
 fill(100);
  ellipse(width/2, height/2, 500,500);
  fill(#027101);
  arc(width/2, height/2, 500,500, PI+PI/2 ,PI+PI/2 + radians(second)/60*360);
  fill(150);
  ellipse(width/2, height/2, 449,449);
  fill(120);
  ellipse(width/2, height/2, 450,450);
  fill(#ffcc33);
  arc(width/2, height/2, 450,450, PI+PI/2 ,PI+PI/2 + radians(minute)/60*360);
  fill(#A74CCB);
  ellipse(width/2, height/2, 339,339);
  fill(140);
  ellipse(width/2, height/2, 400,400);
  fill(255,0,0);
  arc(width/2, height/2, 400,400, PI+PI/2 ,PI+PI/2 + radians(hour)/24*360);
  fill(0);
  ellipse(width/2, height/2, 349,349);
}
