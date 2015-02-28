

int posX = 0;
int posY = 0;
int myW = 400;
int myH = 400;
color col1 = color(100);
color col2 = color(100);
color col3 = color(100);
color col4 = color(100);


void setup () 
{
  size (400,400);
  background(0);  
}

void draw() 
{
  stroke(255);
  line(posX + 200, posY, myW/2, myH);
  line(posX, posY + 200, myW, myH /2);

//Rect 1
  fill(col1);
  rect(posX + 150, posY + 150, myW /8, myH /8);
  if (mouseX > 0 && mouseX < 200 && mouseY > 0 && mouseY <200) 
{
  col1 = color(100);
}
  else
{
  col1 = color(250);
}


//Rect 2
  fill(col2);
  rect(posX + 150, posY + 200, myW /8, myH /8);
  if (mouseX > 0 && mouseX < 200 && mouseY >200 && mouseY <400) 
{
  col2 = color(100);
}
  else
{
  col2 = color(250);
}

//Rect 3
  fill(col3);
  rect(posX + 200, posY + 150, myW /8, myW /8);
  if (mouseX > 200 && mouseX < 400 && mouseY >0 && mouseY <200) 
{
  col3 = color(100);
}
  else
{
  col3 = color(250);
}

//Rect 4
  fill(col4);
  rect(posX + 200, posY + 200, myW /8, myW /8);
  if (mouseX > 200 && mouseX < 400 && mouseY >200 && mouseY <400) 
{
  col4 = color(100);
}
  else
{
  col4 = color(250);
}

}






