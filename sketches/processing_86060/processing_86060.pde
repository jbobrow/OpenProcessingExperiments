
void setup()
{
  size(400, 400);
  smooth();
  background(255,0,0);
}
void draw()
{
  println(mouseX+","+mouseY);
  
  if(key == '1')
  {
    text("type in the abc's to make the snowman", 70, 365);
  }
  //background:
//  background(random(255), random(255), random(255));
  fill(27, 203, 12);
  //tree:
  if(key == 'a')
  {
    triangle(225, 15, 60, 375, 340, 375);
  }
  fill(255, 255, 255);
  //body bottom:
  if(key == 'b')
  {
  ellipse(200, 300, 200, 200);
  }
  // body middle:
  if(key == 'c')
  {
  ellipse(200, 200, 150, 150);
  }
  //body top:
  if(key == 'd')
  {
  ellipse(200, 100, 100, 100);
  }
  fill(random(255), random(255), random(255));
  //button #1:
  if(key == 'e')
  {
  ellipse(200, 250, 20, 20);
  }
  // button#2:
  if(key == 'f')
  {
  ellipse(200, 225, 20, 20);
  }
  //button#3:
  if(key == 'g')
  {
  ellipse(200, 200, 20, 20);
  }
  //button#4:
  if(key == 'h')
  {
  ellipse(200, 175, 20, 20);
  }
  fill(0, 0, 0);
  //eye #1:
  if(key == 'i')
  {
  ellipse(180, 95, 15, 15);
  }
  //eye#2:
  if(key == 'j')
  {
  ellipse(220, 95, 15, 15);
  }
  fill(245, 124, 25);
  // nose:
  if(key == 'k')
  {
  triangle(125, 125, 200, 100, 215, 115);
  }
  fill(225, 0, 0);
  strokeWeight(4);
  //mouth:
  if(key == 'l')
  {
  line(180, 125, 220, 125);
  }
  //arm#1:
  if(key == 'm')
  {
  line(60, 275, 132, 165);
  }
  //arm#2:
  if(key == 'n')
  {
  line(340, 275, 268, 165);
  }
  fill(0, 0, 0);
  //hand#1:
  if(key == 'o')
  {
  ellipse(60, 275, 15, 15);
  }
  //hand#2:
  if(key == 'p')
  {
  ellipse(340, 275, 15, 15);
  }
  fill(255, 213, 0);
  //star:
  if(key == 'q')
  {
  ellipse(225, 15, 25, 25);
  }
  fill(255);
  if(key == 'r')
  {
    text("*", 80, 56);
  }
  if(key == 's')
  {
    text("*", 83, 46);
  }
  if(key == 't')
  {
    text("*", 330, 56);
  }
  if(key == 'u')
  { 
    text("*", 327, 180);
  }
  if(key == 'v')
  {
    text("*", 275, 76);
  }
  if(key == 'w')
  {
    text("*", 32, 192);
  }
  if(key == 'x')
  {
    text("*", 271, 26);
  }
  if(key == 'y')
  {
    text("*", 102, 159);
  }
  if(key == 'z')
  {
    text("*", random(400), random(400));
  }
  if(key == ' ')
  {
    background(0);
    text("now i know my abc's next time wont you sing with me......", 4, 200);
  }
}


