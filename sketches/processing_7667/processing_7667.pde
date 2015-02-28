
void setup()
{
  smooth();
  size(600,600);
  background(255);
}

void draw()
{
  background(255);
  //hair
  strokeWeight(1);
  stroke(0);
  for(int i = 150; i < 400; i = i+20)
  {
    line(i, random(150, 170), i+20, random(180,200));
  }
  for(int i = 125; i < 375; i = i+5)
  {
    line(i, random(125, 145), i+20, random(155,175));
  }
  
  //sides of face
  strokeWeight(5);
  line(125, 180, 125,400);
  line(400, 180, 400, 400);
  
  //eyes
  strokeWeight(1); 
  noFill();
  ellipse(200, (height/2)-75, 60, 20);
  ellipse(325, (height/2)-75, 60, 20);
  
  //pupils
  fill(200);
  ellipse(200, (height/2)-75, 16, 16);
  ellipse(325, (height/2)-75, 16, 16);
  
  //mouth
  fill(145);
  ellipse(262, (height/2)+65, (100+mouseX)/5, (100+mouseY)/10);
  
  //chin
  strokeWeight(5);
  line(125, 400, 225, 450);
  line(225, 450, 320, 450);
  line(320, 450, 400, 400);
  
  //nose
  stroke(80);
  strokeWeight(3);
  noFill();
  beginShape();
  vertex(262,250);
  vertex(292,290);
  vertex(292,300);
  vertex(282,310);
  vertex(265,310);
  endShape(); 
}

