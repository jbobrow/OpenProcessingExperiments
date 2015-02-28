
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
  ellipse(100, 100, 60, 60);

  fill(0);
  ellipse(300, 100, 60, 60);
  
  //Triangle in eyes
  stroke(0);//Returns outline color to black.
  fill(255);
  triangle(78,120,100,70,120,120);
  
  fill(255);
  triangle(278,120,300,70,320,120);

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
  fill(20,200,242);
  ellipse(70,150,10,20);
  
  fill(20,200,242);
  ellipse(110,150,10,20);
  
  fill(20,200,242);
  ellipse(70,200,10,20);
  
  fill(20,200,242);
  ellipse(90,175,10,20);
  
  //Tears on the right eye
  fill(20,200,242);
  ellipse(280,150,10,20);
  
  fill(20,200,242);
  ellipse(315,150,10,20);
  
  fill(20,200,242);
  ellipse(295,175,10,20);
  
  fill(20,200,242);
  ellipse(315,200,10,20);
}



