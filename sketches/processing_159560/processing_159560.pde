
void setup()
{
size(400,400);
smooth();
background(132,208,214);
}

int i = 0;    //used for counting

void draw()
{
  fill(160,132,214);
  noStroke();
  
  //Left Side Triangles
  triangle(0, 0, 30, 40, 0, 90);
  triangle(0, 90, 30, 130, 0, 180);
  triangle(0, 180, 30, 220, 0, 270);
  triangle(0, 270, 30, 310, 0, 360);
  triangle(0, 360, 30, 400, 0, 450);
  
  //Right Side
  triangle(400, 0, 400, 90, 370, 40);
  triangle(400, 90, 400, 180, 370, 130);
  triangle(400, 180, 400, 270, 370, 220);
  triangle(400, 270, 400, 360, 370, 310);
  triangle(400, 360, 400, 450, 370, 400);
  
  strokeWeight(2);
  stroke(255);
  line(20, 10, 100, 75);
  line(120, 10, 190, 75);
  line(210, 10, 280, 75);
  line(300, 10, 370, 75);
  
  line(60, 150, 60, 200);
  line(160, 150, 160, 200);
  line(250, 150, 250, 200);
  line(340, 150, 340, 200);
  
  line(20, 260, 100, 260);
  line(120, 260, 200, 260);
  line(210, 260, 290, 260);
  line(300, 260, 380, 260);
  
  line(60, 315, 60, 350);
  line(160,315, 160, 350);
  line(250, 315, 250, 350);
  line(340, 315, 340, 350);
  {
    strokeWeight(3);    //thickness of line around circle
    stroke(255);        //color around circle
  
    i = i + 1; //here the counter increases by one each frame
  
   if (i>20)
 { 
   fill(232,247,122); 
 }
  
 if (i>200)
 { 
   fill(232,247,122);  
   i=0;  //resets the counter to start the flashing loop over
 }
  }
  ellipse(60, 40, 55, 55);
  ellipse(60, 150, 55, 55);
  ellipse(60, 260, 55, 55);
  ellipse(60, 370, 55, 55);
   
   {
    i = i + 1; 
  
   if (i>25)
 { 
   fill(128,247,122); 
 }
  
 if (i>50)
 { 
   fill(128,247,122);  
   i=0;  
 }
  }
  ellipse(160, 40, 55, 55);
  ellipse(160, 150, 55, 55);
  ellipse(160, 260, 55, 55);
  ellipse(160, 370, 55, 55);
  {
    i = i + 1; 
  
   if (i>25)
 { 
   fill(247,150,202); 
 }
  
 if (i>50)
 { 
   fill(247,150,202);  
   i=0;  
 }
  }
  ellipse(250, 40, 55, 55);
  ellipse(250, 150, 55, 55);
  ellipse(250, 260, 55, 55);
  ellipse(250, 370, 55, 55);
  
  {
    i = i + 1; 
  
   if (i>25)
 { 
   fill(252,159,97); 
 }
  
 if (i>50)
 { 
   fill(252,159,97);  
   i=0;  
 }
  }
  ellipse(340, 40, 55, 55);
  ellipse(340, 150, 55, 55);
  ellipse(340, 260, 55, 55);
  ellipse(340, 370, 55, 55);
  
  
}










