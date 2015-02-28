
float bubble1x=700;
float bubble1y=-50;
float bubble2x=700;
float bubble2y=-50;
float bubble3x=700;
float bubble3y=-60;

void setup()
{
  size(600, 400);
  background(17, 211, 216);
  frameRate(20);
}

void draw()
{
  background(17, 211, 216);
  fill(245, 106, 243);
  triangle((mouseX-120+frameCount%20), mouseY-60, (mouseX-120+frameCount%20), mouseY+60, mouseX-75, mouseY);  //fin
  ellipse(mouseX, mouseY, 150, 80);
  fill(0, 0, 0);
  ellipse(mouseX+30, mouseY-20, 10, 10);
  line(mouseX+75, mouseY, mouseX+50, mouseY);
  fill(0, 255, 0);
  triangle(0, 400, 100, 400, 50, 300);
  triangle(100, 400, 200, 400, 150, 300);
  triangle(200, 400, 300, 400, 250, 300);
  triangle(300, 400, 400, 400, 350, 300);
  triangle(400, 400, 500, 400, 450, 300);
  triangle(500, 400, 600, 400, 550, 300);

  if (mouseX>300)
  {
    background(17, 211, 216);
    fill(245, 106, 243);
    triangle((mouseX+120-frameCount%20), mouseY+60, (mouseX+120-frameCount%20), mouseY-60, mouseX+75, mouseY);
    ellipse(mouseX, mouseY, 150, 80);
    fill(0, 0, 0);
    ellipse(mouseX-30, mouseY-20, 10, 10);
    line(mouseX-75, mouseY, mouseX-50, mouseY);
    fill(0, 255, 0);
    triangle(0, 400, 100, 400, 50, 300);
    triangle(100, 400, 200, 400, 150, 300);
    triangle(200, 400, 300, 400, 250, 300);
    triangle(300, 400, 400, 400, 350, 300);
    triangle(400, 400, 500, 400, 450, 300);
    triangle(500, 400, 600, 400, 550, 300);
  }

  fill(255, 255, 255);
  ellipse(bubble1x, bubble1y, 35, 35);
  ellipse(bubble2x, bubble2y, 43, 43);
  ellipse(bubble3x, bubble3y, 20, 20);

  bubble1y=bubble1y-5;
  bubble2y=bubble2y-6;
  bubble3y=bubble3y-4;
  
  if (bubble3y<0)
  {if (mouseX<300)
  {
bubble1x=mouseX+40;
bubble2x=mouseX+30;
bubble3x=mouseX+50;
bubble1y=mouseY-100;
bubble2y=mouseY-140;
bubble3y=mouseY-70;
   
  }

  if (mouseX>300)
  {
    bubble1x=mouseX-40;
    bubble2x=mouseX-30;
    bubble3x=mouseX-50;
    bubble1y=mouseY-100;
    bubble2y=mouseY-140;
    bubble3y=mouseY-70;
  } 
  }
}

void mousePressed()
{
  if (mouseX<300)
  {
bubble1x=mouseX+40;
bubble2x=mouseX+30;
bubble3x=mouseX+50;
bubble1y=mouseY-100;
bubble2y=mouseY-140;
bubble3y=mouseY-70;
   
  }

  if (mouseX>300)
  {
    bubble1x=mouseX-40;
    bubble2x=mouseX-30;
    bubble3x=mouseX-50;
    bubble1y=mouseY-100;
    bubble2y=mouseY-140;
    bubble3y=mouseY-70;
    
  }
}

