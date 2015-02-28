
//Winggo T, User Input, CP1 mods 4-5
//
void setup()
{
  size(500,500);
  background(133,206,250);
  smooth();
}
void draw()
{
  //grass
  stroke(0,100,0);
  fill(0,100,0);
  rect(0,500-150,500,500-150);
  //sun
  stroke(255,255,0);
  fill(255,255,0);
  ellipse(50,50,60,60);
  //house
  stroke(203,133,63);
  fill(203,133,63);
  triangle(320,200,400,260,240,260);
  stroke(245,245,220);
  fill(245,245,220);
  rect(250,260,140,90);
  //door
  fill(210,105,30);
  stroke(210,105,30);
  rect(270,290,30,60);
  //window
  fill(255,215,0);
  stroke(244,164,96);
  rect(325,290,40,40);
}
//input
void mouseClicked()
{
  if(keyPressed==true&&key;=='t')
  {
    //tree
      fill(139,69,19);
      stroke(139,69,19);
      rect(mouseX,mouseY+15,15,40);  
      fill(34,139,34);
      stroke(34,139,34);
      ellipse(mouseX+7,mouseY,60,40);
  }
  if(keyPressed==true&&key;=='c')
  {
    //cloud
    stroke(255);
    fill(255);
    ellipse(mouseX,mouseY,25,50);
    ellipse(mouseX,mouseY,50,25);
  }
  if(keyPressed==true&&key;=='f')
  {
    //flower    
    stroke(139,69,19);
    fill(139,69,19);
    rect(mouseX-2,mouseY+5,3,30);
    stroke(0,255,255);
    fill(0,255,255);
    ellipse(mouseX,mouseY,30,15);
    ellipse(mouseX,mouseY,15,30);
    stroke(255);
    fill(255);
    ellipse(mouseX,mouseY,10,10);
  }
  if(keyPressed==true&&key;=='h')
  {
    //house
    stroke(0,250,154);
    fill(0,250,154);
    rect(mouseX-20,mouseY-20,50,40);
    fill(255,0,0);
    stroke(255,0,0);
    triangle(mouseX-20,mouseY-20,mouseX+30,mouseY-20,mouseX+5,mouseY-50);
  }
}
/**
Hold 't' and click for a tree<br>
Hold 'c' and click for a cloud<br>
Hold 'f' and click for a flower<br>
Hold 'h' and click for a house<br>
Enjoy!
*/
