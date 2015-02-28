
void setup()

{ size(500,500);
  background(0);
  
}

void draw()

{
  background(0);
   fill(0,200,0); 
  noStroke();
  ellipse(100,100,80,80);
  
  fill(0,200,0); 
  noStroke();
  ellipse(200,100,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(300,100,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(400,100,80,80);
 
    fill(0,200,0);
  noStroke();
  ellipse(100,400,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(200,400,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(300,400,80,80);
  
  
    fill(0,200,0); 
  noStroke();
  ellipse(400,400,80,80);
  
   translate(0,-mouseY/25);
    pushMatrix();
  
      fill(0,200,0); 
  noStroke();
  ellipse(100,200,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(200,200,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(300,200,80,80);
  
  
    fill(0,200,0); 
  noStroke();
  ellipse(400,200,80,80);
  
  popMatrix();
  resetMatrix();

  translate(0,mouseY/25);
  
  pushMatrix();
  
    fill(0,200,0); 
  noStroke();
  ellipse(100,300,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(200,300,80,80);
  
    fill(0,200,0); 
  noStroke();
  ellipse(300,300,80,80);
  
  
    fill(0,200,0); 
  noStroke();
  ellipse(400,300,80,80);
  
  popMatrix();
  resetMatrix();
}
