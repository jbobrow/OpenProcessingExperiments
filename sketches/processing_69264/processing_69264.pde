
//setup
void setup()
{
  //set the basics 
  size(600, 600);
  smooth();
  frameRate(30);
  println("Carpe Diem-By Angie Yunqi Chen");
  ellipseMode(CENTER);
}


void draw()
{
  {background(mouseX,mouseY,0);}
  
  //draw outermost layers... 
  {
    noFill();
    stroke(0,0,0);
    strokeWeight(100);
    ellipse(300,300, 460,460);
  }
  
  {
    noFill();
    stroke(0,0,0);
    strokeWeight(5);
    ellipse(300,300, 570,570);
  }
  
    {
    noFill();
    stroke(0,0,0);
    strokeWeight(5);
    ellipse(300,300, 585,585);
  }
  
    {
    noFill();
    stroke(0,0,0);
    strokeWeight(10);
    ellipse(300,300, 595,595);
  }


{//draw the outer-frame
  fill(mouseX, mouseY, 0);
  strokeWeight(11);
  stroke(0,0,0);
  ellipse(300,300, 400,400);
}
  

  {//draw the meso-frame
  fill(0,0,0);
  noStroke();
  ellipse(300,300, 383,383);
  }
  
   {  //draw the inner frame
    fill(mouseX-80,mouseY+30,0);
    noStroke();
    ellipse(300,300, 350,350);
  }
  
  {
    noStroke();
    fill(0,0,0);
    ellipse(300,300, 100,100);
  }
  
  {//draw the numbers
  {//XII
  stroke(0,0,0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(280,135, 330,135);
  line(280,160, 330,160);
  strokeWeight(4);
  line(285,135, 305,160);
  line(285,160, 305,135);
  line(310,135, 310,160);
  line(320,135, 320,160);
  }
  
  {//VI
  stroke(0,0,0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(285,440, 295,440);
  line(305,440, 320,440);
  line(310,465, 320,465);
  strokeWeight(4);
  line(290,440, 300,465);
  line(310,440, 300,465);
  line(315,440, 315,465);
  }
  
  
    {//III
  stroke(0,0,0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(425,313, 463,313);
  line(425,287, 463,287);
  strokeWeight(4);
  line(434,313, 434,287);
  line(443,313, 443,287);
  line(452,313, 452,287);
  }
  
  
   
    {//IX
  stroke(0,0,0);
  strokeWeight(2);
  strokeCap(SQUARE);
  line(135,313, 175,313);
  line(135,287, 175,287);
  strokeWeight(4);
  line(145,313, 145,287);
  line(155,313, 170,287);
  line(170,313, 155,287);
  }
  
  }
  
   {//draw the clock hand
  stroke(0,0,0);
  strokeWeight(10);
  strokeCap(ROUND);
  line(300,300,mouseX,mouseY);
  }
  
  {//draw the center pivot
  noStroke();
  fill(247,240,10);
  ellipse(300,300,35,35);
  fill(0,0,0);
  ellipse(300,300, 15,15);
  }

  }


