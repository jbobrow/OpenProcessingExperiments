
//Angela Kolosky Homework 4
//Copyright: Angela Kolosky, Pittsburgh, PA, 2013

float x,y,wd,ht;
float fireworkstartUP,fireworkstartRIGHT,fireworkstartLEFT;

void setup()
{
  size(400,400);
  
  //info on floats
  x = 200;
  y = 200;
  wd=width*.5;
  ht=height*.5;
  fireworkstartUP = 350;
  fireworkstartRIGHT = 350;
  fireworkstartLEFT = 350;
  
  //background
  noStroke();
  background(7,1,46);

}

void draw()
{
  noStroke();
  fill(7,1,46,100);
  rect(0,0,width,height);
  
  //moon
  fill(255);
  ellipse(90,90,40,40);
  fill(7,1,46);
  ellipse(85,90,40,40);
  
  //stars
  stroke(255,255,255,100);
  strokeWeight(3);
  point(random(1,400),random(1,400));
  
  //ground
  noStroke();
  fill(0);
  rect(0,350,400,400);
  
  //sparkler
  if (mousePressed == true)
  {
  stroke(255);
  strokeWeight(3);
  point(mouseX,mouseY);
  }
  
  //fireworks setup
   {if (keyCode == UP)
    {
    strokeWeight(5);
    if (fireworkstartUP < 100)
    {stroke(7,1,46);}
    else
    {stroke(0,255,78);}
    point(x,fireworkstartUP);
    fireworkstartUP = fireworkstartUP-1;
    
    if (fireworkstartUP == 100)
      {
      strokeWeight(10);
      stroke(0,255,78);
      point(200,100);
      point(200,70);
      point(200,130);
      point(170,100);
      point(230,100);
      point(170,70);
      point(230,70);
      point(170,130);
      point(230,130);
      }
    if (fireworkstartUP == 90)
      {
      strokeWeight(20);
      stroke(0,255,159);
      point(200,100);
      point(200,70);
      point(200,130);
      point(170,100);
      point(230,100);
      point(170,70);
      point(230,70);
      point(170,130);
      point(230,130);
      }
    if (fireworkstartUP == 70)
      {
      strokeWeight(20);
      stroke(0,255,159);
      point(200,100);
      point(200,70);
      point(200,130);
      point(170,100);
      point(230,100);
      point(170,70);
      point(230,70);
      point(170,130);
      point(230,130);
            strokeWeight(10);
      stroke(0,255,78);
      point(200,100);
      point(200,70);
      point(200,130);
      point(170,100);
      point(230,100);
      point(170,70);
      point(230,70);
      point(170,130);
      point(230,130);
      }   
    }
  }
  
    
  {if (keyCode == RIGHT)
    { 
    strokeWeight(5);
    if (fireworkstartRIGHT < 100)
    {stroke(7,1,46);}
    else
    {stroke(254,0,255);}
    point(300,fireworkstartRIGHT);
    fireworkstartRIGHT = fireworkstartRIGHT-1;
    
    if (fireworkstartRIGHT == 100)
      {
      strokeWeight(10);
      stroke(254,0,255);
      point(300,100);
      point(300,70);
      point(300,130);
      point(270,100);
      point(330,100);
      point(270,70);
      point(330,70);
      point(270,130);
      point(330,130);
      }
    if (fireworkstartRIGHT == 90)
      {
      strokeWeight(20);
      stroke(186,0,255);
      point(300,100);
      point(300,70);
      point(300,130);
      point(270,100);
      point(330,100);
      point(270,70);
      point(330,70);
      point(270,130);
      point(330,130);
      }
    if (fireworkstartRIGHT == 70)
      {
      strokeWeight(20);
      stroke(186,0,255);
      point(300,100);
      point(300,70);
      point(300,130);
      point(270,100);
      point(330,100);
      point(270,70);
      point(330,70);
      point(270,130);
      point(330,130);
            strokeWeight(10);
      stroke(254,0,255);
      point(300,100);
      point(300,70);
      point(300,130);
      point(270,100);
      point(330,100);
      point(270,70);
      point(330,70);
      point(270,130);
      point(330,130);
      }  
    }
  }
  
  
  {if (keyCode == LEFT)
    { 
      strokeWeight(5);
      if (fireworkstartLEFT < 200)
      {stroke(7,1,46);}
      else
      {stroke(255,170,0);}
      point(100,fireworkstartLEFT);
      fireworkstartLEFT = fireworkstartLEFT-1;
      
      if (fireworkstartLEFT == 200)
      {
      strokeWeight(10);
      stroke(255,170,0);
      point(100,200);
      point(100,170);
      point(100,230);
      point(70,200);
      point(130,200);
      point(70,170);
      point(130,170);
      point(70,230);
      point(130,230);
      }
    if (fireworkstartLEFT == 190)
      {
      strokeWeight(20);
      stroke(255,247,0);
      point(100,200);
      point(100,170);
      point(100,230);
      point(70,200);
      point(130,200);
      point(70,170);
      point(130,170);
      point(70,230);
      point(130,230);
      }
    if (fireworkstartLEFT == 170)
      {
      strokeWeight(20);
      stroke(255,247,0);
      point(100,200);
      point(100,170);
      point(100,230);
      point(70,200);
      point(130,200);
      point(70,170);
      point(130,170);
      point(70,230);
      point(130,230);
            strokeWeight(10);
      stroke(255,170,0);
      point(100,200);
      point(100,170);
      point(100,230);
      point(70,200);
      point(130,200);
      point(70,170);
      point(130,170);
      point(70,230);
      point(130,230);
      }  
    }
  }
}



