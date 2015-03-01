
void setup()
{
  background(0,0,0);
  
  fill(0,0,0);
  ellipse(250,250,500,500);
  
  size(500,500);
}

void draw()
{ 
  float optionA = abs(255-mouseX);
  float optionB= abs(255-mouseY);
  float optionC = abs(255-mouseX)*sqrt(abs(255-mouseY));
  
  noStroke();  
  
  if(mousePressed) {
  fill(random(optionA),random(optionB),random(optionC));
  ellipse(mouseX,mouseY,30,30);
  }
  
  if(mousePressed && (200 < mouseX) && (mouseX < 300) && (200 < mouseY) &&(mouseY < 300)) {
    fill(0,0,0);
    rect(0,0,500,500);
  }
  
  fill(optionA, optionB, optionC);
  ellipse(250,250,100,100);
  
  fill(optionA, optionC, optionB);
  ellipse(125,125,100,100);
  ellipse(375,375,100,100);
  ellipse(125,375,100,100);
  ellipse(375,125,100,100);
  
  fill(optionB, optionA, optionC);
  ellipse(250,75,75,75);
  ellipse(250,425,75,75);
  ellipse(75,250,75,75);
  ellipse(425,250,75,75);
  
  fill(optionB, optionC, optionA);
  ellipse(250,155,30,30);
  ellipse(250,345,30,30);
  ellipse(155,250,30,30);
  ellipse(345,250,30,30);
  
  fill(optionC, optionA, optionB);
  ellipse(185,185,15,15);
  ellipse(315,315,15,15);
  ellipse(185,315,15,15);
  ellipse(315,185,15,15);
  
  fill(optionC, optionB, optionA);
  ellipse(435,65,30,30);
  ellipse(65,435,30,30);
  ellipse(65,65,30,30);
  ellipse(435,435,30,30);
  
  
}


