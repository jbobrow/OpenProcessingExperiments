
void setup()
{
  size(500,500);
  smooth();
}

void draw()
{
  
  background(#384BF0);
  //variables
  int cloudX;
  
  cloudX = -50;
  //line(0,450,500,450);
  fill(#5AC445);
  rect(0,450,500,50);
  
  //house
  stroke(1);
  fill(#670762);
  rect(200,350,100,100);
  fill(#836650);
  triangle(200,350,300,350,250,275);
  
  //windows
  stroke(1);
  fill(120);
  rect(210,370,20,20);
  line(220,370,220,390);
  line(210,380,230,380);
  rect(270,370,20,20);
  line(280,370,280,390);
  line(270,380,290,380);
  
  //door
  fill(#836650);
  rect(235,410,25,40);
  fill(#EAE353);
  ellipse(240,430,5,5);
  
  //sun and movement
  stroke(1);
  ellipse(mouseY,mouseY/2,60,60);
  
  
  //cloud and movement
  fill(255);
  ellipse(mouseX,80,80,80);
  ellipse((mouseX+40),80,90,100);
  ellipse((mouseX+80),80,100,80);

  if(mouseY > 300)
  {
    //lights turn on
    stroke(1);
    fill(#F2EB16);
    rect(210,370,20,20);
    line(220,370,220,390);
    line(210,380,230,380);
    rect(270,370,20,20);
    line(280,370,280,390);
    line(270,380,290,380);
  }
}
