
float i = 0;
float random1 = random(0,255);
void setup()
{
  size(800,800);
}
 
void draw()
{
if ((keyPressed == true) && (key == '1')){
       fill(32, 250, 0);

    ellipse(mouseX, mouseY, 30, 30);
  
    fill(3, 3, 3);

    ellipse(mouseX/2, mouseY/2, 30, 30); 
 
    fill(255, 0, 192);
 
    ellipse(mouseX*2, mouseY*2, 30, 30);
 
}  
 if ((keyPressed == true) && (key == 'a')){
 
fill(255, 255, 255);
  
ellipse(mouseX, mouseY, 50, 35);
 
fill(255, 255, 0);
 
ellipse(mouseX, mouseY, 25, 25);
 
fill(0, 0, 0);
  
ellipse(mouseX, mouseY, 10, 10);
 
fill(255, 0, 0);
 
ellipse(mouseX/2, mouseY/2, 50, 35);
 
fill(255, 255, 0);
  
ellipse(mouseX/2, mouseY/2, 25, 25); 
 
fill(0, 0, 0);
 
ellipse(mouseX/2, mouseY/2, 10, 10);
  
fill(0, 0, 255);
 
ellipse(mouseX*2, mouseY*2, 50, 35);
 
fill(255, 255, 0);
  
ellipse(mouseX*2, mouseY*2, 25, 25);
 
fill(0, 0, 0);
 
ellipse(mouseX*2, mouseY*2, 10, 10);
 
 
} 
 
    if (mousePressed&&mouseButton == LEFT)
{
  translate(-random(30,50)/2,-random(30,50)/2);
  fill(random(0,155),random(0,155),random(0,155));
  noStroke();
  rect(mouseX,mouseY,random(10,40),random(10,40));
}
  if (mousePressed&&mouseButton == LEFT&&pmouseX == mouseX&&pmouseY == mouseY)
{
  fill(random(100,355),random(0,155),random(0,155));
  noStroke();
  rect(random(0,800),random(0,800),random(30,50),random(30,50));
}
   
  if (mousePressed&&mouseButton == CENTER)
  {
    stroke(random(200,255),random(255),random(255));
    strokeWeight(6);
   fill(155,155,155);
   
     
    line(pmouseX,pmouseY,mouseX,mouseY);
    line(pmouseX+10,pmouseY+10,mouseX+10,mouseY+10);
    line(pmouseX+20,pmouseY+20,mouseX+20,mouseY+20);
    line(pmouseX+30,pmouseY+30,mouseX+30,mouseY+30);
    line(pmouseX+40,pmouseY+40,mouseX+40,mouseY+40);
    line(pmouseX-10,pmouseY-10,mouseX-10,mouseY-10);
    line(pmouseX-20,pmouseY-20,mouseX-20,mouseY-20);
    line(pmouseX-30,pmouseY-30,mouseX-30,mouseY-30);
    line(pmouseX-40,pmouseY-40,mouseX-40,mouseY-40);
     
     
     
    if (frameCount%5 == 0)
    {
    ellipse(pmouseX+50,pmouseY+50,30,30);
    ellipse(pmouseX-50,pmouseY-50,30,30);
    }
    }
 
    if (mousePressed&&mouseButton==RIGHT)
{
  if (pmouseX<mouseX&&pmouseY<mouseY)
  {
  translate ((mouseX-pmouseX),(mouseY-pmouseY));
  stroke((random(200,255)),(random(0,255)),(random(0,255)));
  strokeWeight(random(10,40));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  }
  if (pmouseX>mouseX&&pmouseY>mouseY)
  {
  translate ((mouseX-pmouseX),(mouseY-pmouseY));
  stroke((random(200,255)),(random(0,255)),(random(0,255)));
  strokeWeight(random(10,40));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  }
  if (pmouseX<mouseX&&pmouseY>mouseY)
  {
  translate ((mouseX-pmouseX),(mouseY-pmouseY));
  stroke((random(200,255)),(random(0,255)),(random(0,255)));
  strokeWeight(random(10,40));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(0,100),mouseY+mouseY-pmouseY-random(0,100));
  }
  if (pmouseX>mouseX&&pmouseY<mouseY)
  {
  translate ((mouseX-pmouseX),(mouseY-pmouseY));
  stroke((random(100,155)),(random(0,255)),(random(0,255)));
  strokeWeight(random(10,40));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX-random(0,100),mouseY+mouseY-pmouseY+random(0,100));
  }
  if (pmouseX == mouseX && pmouseY == mouseY)
  {
    translate ((mouseX-pmouseX),(mouseY-pmouseY));
    rotateY(PI/3.0);
  stroke((random(100,155)),(random(0,255)),(random(0,255)));
  strokeWeight(random(10,40));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(-100,100),mouseY+mouseY-pmouseY+random(-100,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(-100,100),mouseY+mouseY-pmouseY+random(-100,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(-100,100),mouseY+mouseY-pmouseY+random(-100,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(-100,100),mouseY+mouseY-pmouseY+random(-100,100));
  line(pmouseX,pmouseY,mouseX+mouseX-pmouseX+random(-100,100),mouseY+mouseY-pmouseY+random(-100,100));
}
}
}



