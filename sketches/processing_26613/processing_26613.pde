
//red
color but1 = #ED0C0C;
//blue
color but2 = #0C20ED;
//green
color but3 = #0CED24;
//yellow
color but4 = #D2ED0C;
//white
color but5 = #FFFFFF;
//Black
color but6 = #000000;
//redo
color but7 = #AAAAA7;
color shade = #000000;
float oldx, oldy;

void setup()
{
  smooth();
  size(500,500);
}

void draw()
{
  //background(200);
  //release the buttons!!!
  fill (but1);
  rect (10,10,30,30);
  fill (but2);
  rect(50,10,30,30);
  fill (but3);
  rect (90,10,30,30);
  fill (but4);
  rect (130,10,30,30);
  fill (but5);
  rect (170,10,30,30);
  fill (but6);
  rect (210,10,30,30);
  ellipseMode (CORNER);
  fill (but7);
  ellipse (250,10,30,30);



  //make the thing draw!!!!!
  stroke(shade);
  strokeWeight(3);
  if(mousePressed) 
  {
    line (mouseX, mouseY, oldx, oldy);
    {
      oldx=mouseX;
      oldy=mouseY;
    }
  }   

  //now create the button part thingy

  if(mousePressed) 
  {
    if(mouseY > 5 && mouseY < 35) 
    {
      if(mouseX > 5  && mouseX < 35) 
      { 
        shade = but1;
      }
      else if(mouseX > 50 && mouseX < 80) 
      {  
       shade = but2;
      }
      else if(mouseX > 90 && mouseX < 120) 
      { 
        shade = but3;
      }
      else if(mouseX > 130 && mouseX < 160)
      {  
        shade = but4;
      }
      else if(mouseX > 170 && mouseX < 200)
      {  
        shade = but5;
      }
      else if(mouseX > 210 && mouseX < 240)
      {  
        shade = but6;
      }
      else if(mouseX > 250 && mouseX < 280)
      {  
        background(200);
      }
    }
  }
}


