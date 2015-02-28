
PImage snowImage;

void setup()
{
  size(450, 600);
  snowImage = requestImage ("snow.jpg");
 
}
 
void draw()
{
  if (snowImage.width > 0)
  {
    image(snowImage, 0, 0);
    filter(GRAY);
    
    fill(#000000);
    ellipse(190, 135, 159, 47);//black lining
     ellipse(190, 150, 174, 159);//black lining top circle
   
   
       ellipse(190, 320, 200, 200);//black lining mid circle
    
   
     ellipse(190, 450, 265, 265);//black linging bot circle
   
   
   
   
   
     fill(#EAE3E3);
    ellipse(190, 150, 170, 155);//white top circle
  ellipse(190, 320, 196, 196);// white mid circle
  ellipse(190, 450, 261, 261);// white bottom circle
  
  
  
    fill(random(255), random(255), random(255));
      ellipse(190, 135, 155, 40);//eye color
      
       fill(#5D5959);
      rect(173, 190, 35, 5); //mouth
      
       fill(random(255), random(255), random(255));
  ellipse(349, 41, 3, 3);// right human eye
  ellipse(326, 50, 3, 3);// left human eye
  noStroke();
  }
  
  
  
  
float x = 0;
float y = 220;
float prevX = x;
float prevY = y;
strokeWeight (5);
stroke(#25B9F2);
while (x < 500)
{
  x+= 5;
  y+= random(-10, 10);
  line(prevX, prevY, x, y);
  prevX = x;
  prevY = y;
  noise(200, 200);}
  
  { noStroke();
    fill(random(255), random(255), random(255));
  ellipse(349, 41, 3, 3);// right human eye
  ellipse(326, 50, 3, 3);// left human eye
  noStroke();
  
 
   
}




}



