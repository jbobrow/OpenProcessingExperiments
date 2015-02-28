
int colorBackground = 0;
void setup()
{
  
  size(600, 300);
  background(255);
  textSize(32);
fill(255, 0, 0);
text("R", 10, 30); 
fill(0, 0, 255);
text("B", 10, 60);
fill(11, 183, 29);
text("G", 10, 90); 
fill(299, 220, 42);
text("Y", 10, 120); 
fill(0);
text("K", 10, 150); 
fill(1,0,0);
text("W to erase", 10, 290); 
 ellipse(540,30,1,1);
   {
   fill(0);
   }
    ellipse(540,60,7,7);
   {
   fill(0);
   }
    ellipse(540,90,18,18);
   {
   fill(0);
   }
    ellipse(540,130,30,30);
   {
   fill(0);
   }
    ellipse(540,190,60,60);
   {
   fill(0);
   }
   textSize(12);
 
 fill(0);
text("1", 590, 35);
fill(0);
text("2", 590, 65); 
fill(0);
text("3", 590, 95); 
fill(0);
text("4", 590, 140); 
fill(0);
text("5", 590, 200);

noFill();
rect(50,10, 450, 250);

  
  
}
void draw()
{
 
  if ( key=='r')
  {
    stroke(255, 0, 0);
  }
  if (key=='b')
  {
    stroke(0, 0, 255);
  }
  if (key=='g')
  {
    stroke(11, 183, 29);
  }
  if (key=='y')
  {
  stroke(229,220,42);
  }
  if (key== 'k')
  {
    stroke(0);
  }
  if (key=='w')
  {
    stroke(255);
  }
  if (key=='1')
  {
    strokeWeight(1);
  }
  if (key=='2')
  {
    strokeWeight(8);
  }
  if (key=='3')
  {
    strokeWeight(18);
  }
  if (key=='4')
  {
    strokeWeight(30);
  }
  if (key=='5')
  {
    strokeWeight(55);
  }
  if (key=='e')
  {
    stroke(255);
  
 
   }
  
 
 
}
void mouseDragged()
{
  line(mouseX, mouseY, pmouseX, pmouseY);
}
