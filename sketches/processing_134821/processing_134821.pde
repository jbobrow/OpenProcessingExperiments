
int r = 0;
int g = 0;
int b = 0;
int circleX1= 100;
int circleX2= 300;
int circleY= 100;
int xspeed1 = 1;
float xspeed2 = 1.4;
float yspeed = 1.2;

void setup()
{
  size(400, 400); //workspace size

}

void draw()
{  
  background(243,253,198); //background color

  //Eyes
  stroke(255, 0, 0); //outline colored red
  fill(0); //
  ellipse(circleX1, circleY, 60, 60);

  fill(0);
  ellipse(circleX2, circleY, 60, 60);
  
  //Bouncing eyes!!!!
  circleX1 += xspeed1;
  circleX2 += xspeed2;
  circleY += yspeed;
  
  if(circleX1 >= width || circleX1 <= 0)
  {
    xspeed1 = xspeed1 * (-1);
  }
  
  if(circleX2 >= width || circleX2 <= 0)
  {
    xspeed2 = xspeed2 * (-1);
  }
  
  if(circleY >= width || circleY <= 0)
  {
    yspeed = yspeed * (-1);
  }
  
  
  //Triangle in eyes
  stroke(0);//Returns outline color to black.
  //random eye colors
  
  int i = 0;
  int x = 78;
  int y = 100;
  int z=120;
  while(i < 2){
    fill(255);
    triangle(x,120,y,70,z,120);
    x += 200;
    y += 200;
    z += 200;
    i++;
  } 
  
//  translate(width/2, height/2);
//  rotate(PI/3.0);
//  rect(-26, -26, 52, 52);
  
  //Nose
  fill(250,155,144);
  triangle(150,200,200,120,250,200);
  
  //Nostrils
  fill(0);
  rect(175,180,15,20);
  
  fill (0);
  rect(210,180,15,20);
  
  //Mouth
  fill(0,0,0,210); //added transparency with fourth argument.
  rect(70,270,250,80);
  
  //Teeth
  fill(255);
  rect(70,270,35,55);
  
  fill(255);
  rect(120,310,35,40);
 
  fill(255);
  rect(170,270,35,60);
 
  fill(255);
  rect(220,270,30,25);
  
  fill(255);
  rect(225,325,23,25);
  
  fill(255);
  rect(260,270,40,35);
  
  fill(255);
  triangle(275,350,295,315,320,350);
  
  //Tears on the left eye
  if(mouseY <= 255)
  {
    int r = mouseY;
    int g = mouseY/2;
    
  fill(mouseY,mouseX,242);
  ellipse(70,150+mouseY,10,20);
  
  fill(mouseY,mouseX,242);
  ellipse(110,150+mouseY,10,20);
  
  fill(mouseY,mouseX,242);
  ellipse(70,200+mouseY,10,20);
  
  fill(r,g,242);
  ellipse(90,175+mouseY,10,20);
  }
  //Tears on the right eye
  if(mouseY <= 255)
  {
    int r = mouseY;
    int g = mouseY/2;
  
  fill(mouseX,mouseY,242);
  ellipse(280,150+mouseY,10,20);
  
  fill(mouseX,mouseY,242);
  ellipse(315,150+mouseY,10,20);
  
  fill(mouseX,mouseY,242);
  ellipse(295,175+mouseY,10,20);
  
  fill(mouseX,mouseY,242);
  ellipse(315,200+mouseY,10,20);
  }
  
}
void mouseClicked()
{
  
  if (r == 0 && g == 0 && b == 0) {
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }
  else {
    r = (int)random(255);
    g = (int)random(255);
    b = (int)random(255);
  }
}




