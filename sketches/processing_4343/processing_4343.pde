
int spd = 3;
int verti=25;
int horiz=225;
boolean goingdown = true;
boolean goingleft = true;
void setup()
{
  verti = 25;
  horiz = 225;
  size(500,500);
  background(205,133,63);
  noStroke();
  fill(139,69,19);
  rect(25,25,450,450);
  fill(0);
  rect(235,25,30,450);
  rect(25,235,450,30);
  fill(178,34,34);
  rect(235,verti,30,50);
  rect(horiz,235,50,30);
  stroke(222,184,135);
  strokeWeight(20);
  line(horiz+25,250,250,verti+25);
  noStroke();
  fill(spd,horiz,verti);
  ellipse(250,verti+25,25,25);
  ellipse(horiz+25,250,25,25); 
  goingdown = true;
  goingleft = true;
}
void draw()
{
  noStroke();
  fill(139,69,19);
  rect(25,25,450,450);
  fill(0);
  rect(235,25,30,450);
  rect(25,235,450,30);
  fill(178,34,34);
  rect(235,verti,30,50);
  rect(horiz,235,50,30);
  fill(205,133,63);
  rect(0,0,500,25);
  rect(0,0,25,500);
  rect(475,0,25,500);
  rect(0,475,500,25);
  stroke(222,184,135);
  strokeWeight(20);
  line(horiz+25,250,250,verti+25);
  noStroke();
  fill(spd,horiz,verti);
  ellipse(250,verti+25,25,25);
  ellipse(horiz+25,250,25,25);
  if (verti<=25)
  {
    goingdown = true;  
  }
  else if (verti>=425)
  {
    goingdown = false;  
  }
  if (horiz<=25)
  {
    goingleft = false;  
  }
  else if (horiz>=425)
  {
    goingleft = true;  
  }
  if (goingdown)
  {
    verti+=spd; 
  } 
  else
  {
    verti+=(spd * -1);  
  }
  if (goingleft)
  {
    horiz-=spd;  
  }
  else
  {
    horiz-=(spd * -1);  
  }
}
void keyPressed()
{
  if (key >= '0' && key <= '9')
  {
    if (key != '0')
      spd = key - '0';
    else if (key == '0')
      spd = 0;
  } 
}



