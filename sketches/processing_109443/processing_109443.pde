
//annie ranttila, aranttil
//carnegie mellon university, fall 2013
//computing for the arts with processing

float x, y, wd, ht;
//happens first

void setup()
{
  size(400,400);
  fill(200,0,0);
  x = width*.5;
  y = height*.5;
  wd = width;
  ht = height;
  background (124,51,88);
}

void draw()
{
  fill(162,203,68);
  stroke(162,203,68);
  strokeWeight(3);
  line (x-wd*.5, y-ht*.18, x+wd*.5,y-ht*.18);
  line (x-wd*.5, y+ht*.18, x+wd*.5,y+ht*.18);
  line (x+wd*.18, y-wd*.5, x+wd*.18,y+wd*.5);
  line (x-wd*.18, y-wd*.5, x-wd*.18,y+wd*.5);
}

void mouseClicked()
{
  fill(46,111,94);
  noStroke();
  {
  
  //TL
   if (mouseX < x-wd*.18 && mouseY < y-ht*.18)
    {
     rect(x-wd*.5,y-wd*.5,x-wd*.18,y-ht*.18);
    }
  //TR
 else if (mouseX > x+wd*.18 && mouseY < y-ht*.18)
    {
     rect(x+wd*.18,y-wd*.5,x+wd*.5,y-ht*.18);
    }
  //BR
 else if (mouseX > x+wd*.18 && mouseY > y+ht*.18)
    {
      rect(x+wd*.18,y+wd*.18,x+wd*.5,y+ht*.5);
    }
  //BL
 else if (mouseX < x-wd*.18 && mouseY > y+ht*.18)
    {
      rect(x-wd*.5, y+wd*.18,x-wd*.18,y+ht*.5);
    }
  //CR
else if (mouseX > x+wd*.18 && mouseY < y+ht*.18 && mouseY > y-ht*.18)
    {
     rect(x+wd*.18,y-wd*.18,x+wd*.5,y-ht*.14);
    }
  //CL
else if (mouseX < x-wd*.18 && mouseY < y+ht*.18 && mouseY > y-ht*.18)
    {
    rect(x-wd*.5,y-ht*.18,x-wd*.18,y-ht*.14);
    }
  //TM  
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY < y-ht*.18)
    {
    rect(x-wd*.18,y-ht*.5,x-wd*.14,y-ht*.18);
    }
  //BM  
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY > y+ht*.18)
    {
    rect(x-wd*.18,y+ht*.18,x-wd*.14,y+ht*.18);
    }
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY<y+ht*.18 && mouseY> y-ht*.18)
{
  rect(x-wd*.18,y-ht*.18,x-wd*.14,y-ht*.14);
}
}
}

//click key to clear screen
void keyPressed() 
{
  if (key == CODED) 
    {
    if (keyCode == DOWN) 
      {
      background (124,51,88);
      }
    else if (keyCode== UP)
      {
      fill(203,35,77);
      noStroke();
  
  //TL
   if (mouseX < x-wd*.18 && mouseY < y-ht*.18)
    {
     rect(x-wd*.5,y-wd*.5,x-wd*.18,y-ht*.18);
    }
  //TR
 else if (mouseX > x+wd*.18 && mouseY < y-ht*.18)
    {
     rect(x+wd*.18,y-wd*.5,x+wd*.5,y-ht*.18);
    }
  //BR
 else if (mouseX > x+wd*.18 && mouseY > y+ht*.18)
    {
      rect(x+wd*.18,y+wd*.18,x+wd*.5,y+ht*.5);
    }
  //BL
 else if (mouseX < x-wd*.18 && mouseY > y+ht*.18)
    {
      rect(x-wd*.5, y+wd*.18,x-wd*.18,y+ht*.5);
    }
  //CR
else if (mouseX > x+wd*.18 && mouseY < y+ht*.18 && mouseY > y-ht*.18)
    {
     rect(x+wd*.18,y-wd*.18,x+wd*.5,y-ht*.14);
    }
  //CL
else if (mouseX < x-wd*.18 && mouseY < y+ht*.18 && mouseY > y-ht*.18)
    {
    rect(x-wd*.5,y-ht*.18,x-wd*.18,y-ht*.14);
    }
  //TM  
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY < y-ht*.18)
    {
    rect(x-wd*.18,y-ht*.5,x-wd*.14,y-ht*.18);
    }
  //BM  
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY > y+ht*.18)
    {
    rect(x-wd*.18,y+ht*.18,x-wd*.14,y+ht*.18);
    }
else if (mouseX > x-wd*.18 && mouseX < x+wd*.18 && mouseY<y+ht*.18 && mouseY> y-ht*.18)
{
  rect(x-wd*.18,y-ht*.18,x-wd*.14,y-ht*.14);

}
}
    }
}





