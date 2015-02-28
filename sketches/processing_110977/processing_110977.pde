
boolean write = false;
int FireButton = 0;
void setup()
{
  size(600,600);
  noStroke();
  background(87,59,12);
  frameRate(15);
}

void draw()

{
 
  
 if (write == true)
 {
   fill(random(35,70),random(70,110),random(0,20));
   bezier(mouseX-random(20,25),mouseY-random(20,25),mouseX-random(13,18),mouseY-random(2,7),mouseX-random(0,5),mouseY+random(13,18),mouseX+random(20,25),mouseY+random(15,20));
   bezier(mouseX-random(20,25),mouseY-random(20,25),mouseX+random(13,18),mouseY+random(2,7),mouseX+random(0,5),mouseY-random(13,18),mouseX+random(20,25),mouseY+random(15,20));
   fill(87,59,12);
   rectMode(CENTER);
   rect(300,550,350,70);
   textAlign(CENTER);
   textSize(25);
   fill(255);
   text("Hold F to burn the leaves!",300,550);
 }
 

 
  if (keyPressed)
  {
    if (key == 'd' || key == 'D')
    {
      background(random(70,99),random(40,70),random(0,20));
     textAlign(CENTER);
     textSize(25);
     fill(255);
     text("Make new leaves again!",300,550);
    }
    if (key == 'f' || key == 'F')
    {
     background(random(150,255),random(10,20),random(10,30));
     textAlign(CENTER);
     textSize(25);
     fill(255);
     text("Now hold D for new dirt!",300,550);
    }
  }
}

void mousePressed()
{
  write = true;
 
}

void mouseReleased()
{
  write = false;
}






