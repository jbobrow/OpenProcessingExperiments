
color lineColor;
boolean backgroundcomplete = false;
void setup()
{
  size(550,500);
  if (backgroundcomplete == false)
    background(255);
  noStroke();
  fill(204);
  rect(0,0,50,500);
  fill(0);
  rect(10,10,30,30);
  fill(255,0,0);
  rect(10,50,30,30);
  fill(0,255,0);
  rect(10,90,30,30);
  fill(0,0,255);
  rect(10,130,30,30);
  fill(17,136,34);
  rect(10,170,30,30);
  fill(49,79,79);
  rect(10,210,30,30);
  fill(0,0,205);
  rect(10,250,30,30);
  fill(0,255,255);
  rect(10,290,30,30);
  fill(50,205,50);
  rect(10,330,30,30);
  fill(138,43,226);
  rect(10,370,30,30);
  fill(184,134,11);
  rect(10,410,30,30);
  fill(160,82,45);
  rect(10,450,30,30);
  strokeWeight(10);
  stroke(lineColor);
  backgroundcomplete = true;
}
void draw()
{

  if (mousePressed)
    line(pmouseX,pmouseY,mouseX,mouseY);  
  if (mouseX < 50)
  {
    if (get(mouseX,mouseY) != color(204))
    {
      cursor(HAND); 
    } 
    else
    {
      cursor(ARROW);  
    }
  }
  else
  {
    cursor(ARROW);  
  }
  setup();
}
void mousePressed()
{
  if (mouseX < 50)
  {
    if (get(mouseX,mouseY) != color(204))
    {
      lineColor = get(mouseX,mouseY);
      stroke(lineColor); 
    }
  } 
}
void keyPressed()
{
  if (key == 'e')
  {
    noStroke();
    fill(255);
    rect(50,0,500,500);
    strokeWeight(10);
    stroke(lineColor);
  }
  else if (key == 'r')
  {
    noStroke();
    fill(204);
    rect(0,0,50,500);
    fill(random(255),random(255),random(255));
    rect(10,10,30,30);
    fill(random(255),random(255),random(255));
    rect(10,50,30,30);
    fill(random(255),random(255),random(255));
    rect(10,90,30,30);
    fill(random(255),random(255),random(255));
    rect(10,130,30,30);
    fill(random(255),random(255),random(255));
    rect(10,170,30,30);
    fill(random(255),random(255),random(255));
    rect(10,210,30,30);
    fill(random(255),random(255),random(255));
    rect(10,250,30,30);
    fill(random(255),random(255),random(255));
    rect(10,290,30,30);
    fill(random(255),random(255),random(255));
    rect(10,330,30,30);
    fill(random(255),random(255),random(255));
    rect(10,370,30,30);
    fill(random(255),random(255),random(255));
    rect(10,410,30,30);
    fill(random(255),random(255),random(255));
    rect(10,450,30,30);
    strokeWeight(10);
    stroke(lineColor);
  }  
}





