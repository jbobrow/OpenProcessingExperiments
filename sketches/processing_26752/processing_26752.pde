
float TheX;
float TheY;
float Paintbrush= 2;
// look at all those colors! 
color Red= color(255,0,0);
color Orange= color(255,124,0);
color Yellow= color(254,255,0);
color Green= color(0,175,1);
color Blue= color(24,0,252);
color Indigo= color(119,2,216);
color Pink= color(245,57,182);
color Mystery1= color(random (255),random (255),255);
color Mystery2= color(random (255),255,random (255));
color Mystery3= color(255,random(255),random (230,255));
color Mystery4= color(random(255));
color White= color(255);
color Black= color(0);
 
 
void setup(){
  size(500,500);
  smooth();
  background(255);
   
}
 
void draw()
{  
  strokeWeight(1);
  fill(Red);
  rect(25,375,25,25);
  fill(Orange);
  rect(25,400,25,25);
  fill(Yellow);
  rect(25,425,25,25);
  fill(Green);
  rect(25,450,25,25);
  fill(Blue);
  rect(50,375,25,25);
  fill(Indigo);
  rect(50,400,25,25);
  fill(Pink);
  rect(50,425,25,25);
  fill(Mystery1);
  rect(50,450,25,25);
  fill(Mystery2);
  rect(75,375,25,25);
  fill(Mystery3);
  rect(75,400,25,25);
  fill(Mystery4);
  rect(75,425,25,25);
  fill(Black);
  rect(75,450,25,25);
  
  fill(255);
  rect(425,425,50,50);
  
  fill(242,139,224);
  quad (300,425,350,425,375,475,325,475);
  
  fill(255);
  rect(125,375,2,100);
  strokeWeight(2);
  rect(150,375,4,100);
  strokeWeight(4);
  rect(175,375,6,100);
  strokeWeight(6);
  rect(200,375,8,100);
  strokeWeight(8);
  rect(225,375,10,100);
  strokeWeight(10);
   
  if(mousePressed)
  {
    if(mouseX> 25 && mouseX< 50)
    {
      if(mouseY> 375 && mouseY< 400)
      {
        stroke(Red);
      }
      if(mouseY> 400 && mouseY< 425)
      {
        stroke(Orange);
      }
      if(mouseY> 425 && mouseY< 450)
      {
        stroke(Yellow);
      }
      if(mouseY> 450 && mouseY< 475)
      {
        stroke(Green);
      }
    }
      if(mouseX> 50 && mouseX< 75)
      {
        if(mouseY> 375 && mouseY< 400)
        {
          stroke(Blue);
      }
      if(mouseY> 400 && mouseY< 425)
      {
        stroke(Indigo);
      }
       if(mouseY> 425 && mouseY< 450)
       {
        stroke(Pink);
      }
      if(mouseY > 450 && mouseY < 475)
      {
        stroke(Mystery1);
    }
      }
    if(mouseX> 75 && mouseX< 100)
    {
      if(mouseY> 375 && mouseY< 400)
      {
        stroke(Mystery2);
      }
      if(mouseY> 400 && mouseY< 425)
      {
        stroke(Mystery3);
      }
      if(mouseY> 425 && mouseY< 450)
      {
        stroke(Mystery4);
      }
      if(mouseY>450 && mouseY< 475)
      {
        stroke(Black);
      }
    }
    if (mouseX>325 && mouseX<375)
    {
      if (mouseY>425 && mouseY<475)
      {
        stroke (White);
      }
    }
    
    if(mousePressed)
    {
      if(mouseX> 125 && mouseX< 128 )
      {
        if(mouseY> 375 && mouseY< 425)
        {
          Paintbrush=2; 
        }
        }
      if(mouseX > 150 && mouseX< 155)
      {
        if(mouseY> 375 && mouseY< 425)
        {
          Paintbrush=4;
        }
      }
      if(mouseX> 175 && mouseX< 182)
      {
        if(mouseY> 375 && mouseY< 425)
        {
          Paintbrush=6;
      } 
         }
      if(mouseX> 200 && mouseX< 209)
      {
        if(mouseY> 375 && mouseY< 425)
        {
          Paintbrush=8;
      } 
         }
      if(mouseX> 225 && mouseX < 236)
      {
        if(mouseY> 375 && mouseY< 425)
        {
          Paintbrush=10;
      } 
    }
    strokeWeight(Paintbrush);
    }
  if(mousePressed)
  {
    if(mouseX> 425 && mouseX< 475)
    {
      if (mouseY> 425 && mouseY< 475)
      {
        background (255);
      }
    }
  }
  if(mousePressed)
  {
  line(mouseX, mouseY, TheX, TheY);
  }
  }
  TheX=mouseX;
  TheY=mouseY;
  }
     
                
