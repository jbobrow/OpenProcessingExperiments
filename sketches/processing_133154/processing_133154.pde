
int displayW = 1300;
int displayH = 700;
void setup()
{
  size(displayW, displayH);
}

void draw()
{
  if((mousePressed == true) && (mouseButton == LEFT))
  {
    background(220, 220, 220);
    fill(50, 50, 50);
    text("Press left and right mouse button", 20, 20);
    
    //**************** repeatition of patterns
    
    for(int i=0; i<=displayW; i=i+40)
  {
    for(int j=0; j<=displayH; j=j+40)
    {
      stroke(150, 150, 150);
      strokeWeight(2);
      smooth();
      noFill();
      ellipse(i, j, 10, 10);
    }
  }
    
    //****************
  
  //********left eye
  //outer eye
  smooth();
  stroke(0, 100, 100);
  fill(0, 100, 100);
  ellipse(450, displayH/3, 200, 200);
  //inner eye
  fill(255, 255, 255);
  ellipse(450, displayH/3, 150, 150);
  
  //********right eye
  stroke(0, 100, 100);
  smooth();
  fill(0, 100, 100);
  ellipse(950, displayH/3, 200, 200);
  //inner effects
  fill(255, 255, 255);
  noStroke();
  rect(925, displayH/3.6, 50, 100);
  rect(900, displayH/3.2, 100, 50);
  //lips
  strokeWeight(5);
  smooth();
  stroke(0, 0, 0);
  line(450, (displayH/2) + 100, 940, (displayH/2) + 100);
 }
 
 if((mousePressed == true) && (mouseButton == RIGHT)) 
 {
   background(220, 220, 220);
   fill(50, 50, 50);
   text("Press left and right mouse button", 20, 20);
   
   //****************** Repeatition of patterns
   for(int i=0; i<=displayW; i=i+40)
  {
    for(int j=0; j<=displayH; j=j+40)
    {
      stroke(150, 150, 150);
      strokeWeight(2);
      smooth();
      noFill();
      rect(i, j, 10, 10);
    }
  }
   //******************
  
   //********left eye
  smooth();
  stroke(0, 100, 100);
  fill(0, 100, 100);
  ellipse(450, displayH/3, 200, 200);
  //inner eye
  fill(255, 255, 255);
  noStroke();
  rect(425, displayH/3.6, 50, 100);
  rect(400, displayH/3.2, 100, 50);
  
  //********right eye
  stroke(0, 100, 100);
  smooth();
  fill(0, 100, 100);
  ellipse(950, displayH/3, 200, 200);
  //inner effects
  fill(255, 255, 255);
  ellipse(950, displayH/3, 150, 150);
  //lips
  strokeWeight(5);
  smooth();
  stroke(0, 0, 0);
  noFill();
  arc(displayW/2, (displayH/2) + 100, 500, 200, HALF_PI/2, HALF_PI + HALF_PI/2);
 
}
}


