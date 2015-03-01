
float counter = 0; 

void setup()
{
  size(500,500);
  noStroke();
}

void draw()
{

 
  if (mouseX>=50 && mouseX<=150 && mouseY>=200 && mouseY<=300)
{
  if (mousePressed == true)
  {
    background(87,120,188);
  }
  else
  {
    background(200);
  }
}

else if (mouseX>=200 && mouseX<=300 && mouseY>=200 && mouseY<=300)
{
  if (mousePressed == true)
  {
    background(191,44,44);
  }
  else
  {
    background(200);
  }
}
else if (mouseX>=350 && mouseX<=450 && mouseY>=200 && mouseY<=300)
{
  if (mousePressed == true)
  {
    background(46,46,46);
  }
  else
  {
    background(200);
  }
}
else
{
  background(255);
}



 translate(100,height/2);
   pushMatrix();
  rectMode(CENTER);
  stroke(255);
 noFill();
  rect(0,0,100,100);
  rect(150,0,100,100);
  rect(300,0,100,100);
  popMatrix();
  
  pushMatrix();
  ellipseMode(CENTER); 
  noStroke();
  fill(65,99,170);
  ellipse(0,22,41,41);
  triangle(0,-35,-20,17,20,17);
  popMatrix();
  
  pushMatrix();
  ellipseMode(CENTER);
  fill(170,17,17);
  ellipse(170,-21,43,41);
  ellipse(130,-21,43,41);
  translate(-1,5);
  triangle(150,40,192,-20,110,-20);
  popMatrix();
  
  pushMatrix();
  rectMode(CENTER);
  fill(0);
  rect(300,0,10,100);
  rect(300,-10,50,10);
  popMatrix();
}
