
//Hannah Schmitt
//Homework 3, September 6th
//Copyright Hannah Schmitt, Carnegie Mellon University, 2012


float x, y, wd, ht;
void setup()
{
  size(400,400);
  smooth();
  fill(155,41,41);
  x=100;
  y=75;
  wd=55;
  ht=120;
}

void draw()
{
 
  noStroke(); // 2
  rect(x,frameCount%height,wd,ht);
  y= y+1;
  
 
  
  stroke(3); //1
  rect(x-(0.25*width),frameCount%height,wd,ht);
  y= y+1;
  
  
  
  noStroke(); //3
  rect(x+(0.50*width),frameCount%height,wd,ht);
  y= y+1;
 
  stroke(3); //4
  rect(x+(0.25*width),frameCount%height,wd,ht);
  y= y+1;
  
  noStroke();
  rect(frameCount%width,10,wd*0.1,ht*.1); //1st horizontal
 stroke(3);
 rect(frameCount%width,50,wd*0.1,ht*.1); //2nd horizontal
noStroke();
rect(frameCount%width,100,wd*0.1,ht*.1); //3rd horizontal
stroke(3);
 rect(frameCount%width,150,wd*0.1,ht*.1); //4th horizontal
 noStroke();
 rect(frameCount%width,200,wd*0.1,ht*.1); //5th horizontal
 stroke(3);
 rect(frameCount%width,250,wd*0.1,ht*.1); //6th horizontal
 noStroke();
 rect(frameCount%width,300,wd*0.1,ht*.1); //7th horizontal
 stroke(3);
 rect(frameCount%width,350,wd*0.1,ht*.1); //8th horizontal
 noStroke();
 rect(frameCount%width,400, wd*0.1,ht*.1); //9th horizontal
 
  
  noStroke();
  fill(145, 21, 86);
  rect(mouseX, mouseY, 10, 20);
  fill(random(255),random(255),random(255));
  
  
}

void keyPressed () {
  if (x == 0){
    x = 100;}
   else {
   x = 0;
   }
  }
  
 




