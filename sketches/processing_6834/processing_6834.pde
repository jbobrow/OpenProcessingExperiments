
float r = 0;
float g = 0;
float b = 0;

void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
  noStroke();
  fill(240);
  
  rect(0,410, width,90);
  strokeWeight(3); stroke(0);
  
  fill(0);
  line(0,420, 500,420);
  // black --------------------------------------------------------------->
  fill(0);       rect(40,440, 30,30);
  
  // red ----------------------------------------------------------------->
  fill(255,0,0); rect(140,440, 30,30);
  
  // green --------------------------------------------------------------->
  fill(0,255,0); rect(240,440, 30,30);
  
  // blue ---------------------------------------------------------------->
  fill(0,0,255); rect(340,440, 30,30);
  
  // reset --------------------------------------------------------------->
  fill(255,255,0); rect(random(440,442),random(440,442), random(28,30),random(28,30));

}

void mousePressed()
{
   if ((mouseX >40) && (mouseX <70) && (mouseY >440) && (mouseY <470)) 
   { 
    r = 0;
    g = 0;
    b = 0;
   }
   
   if ((mouseX >140) && (mouseX <170) && (mouseY >440) && (mouseY <470)) 
   { 
    r = random(150,255);
    g = 0;
    b = 0;
   }   
 
    if ((mouseX >240) && (mouseX <270) && (mouseY >440) && (mouseY <470)) 
   { 
    r = 0;
    g = random(150,255);
    b = 0;
   } 
  
   if ((mouseX >340) && (mouseX <370) && (mouseY >440) && (mouseY <470)) 
   { 
    r = 0;
    g = 0;
    b = random(150,255);
   }
   
   if ((mouseX >440) && (mouseX <470) && (mouseY >440) && (mouseY <470)) 
   { 
     background(255);
   }   
}

void mouseDragged()
{
  fill(r, g, b);
  noStroke();
  ellipse(mouseX,mouseY, random(1,20),random(1,20));

}

