
void setup()
{
  size(500, 500);
  background(0);
}

void draw()
{
  background(0);
  translate(250, 400);
  
  int std = hour();
  int min = minute();
  int sec = second();
  
  for (int i=0; i<second()*10; i+=10)
  { 
    pushMatrix();
    fill(255);
    rotate(radians(6*second()-90));
    ellipse(i, 0, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix(); 
    fill(150);
    rotate(radians(6*second()-90));    
    ellipse(i, 50, 10, 10);
    noStroke();
    popMatrix();
    
    pushMatrix();
    fill(255); 
    rotate(radians(6*second()-90));   
    ellipse(i, 100, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix();
    fill(255);   
    rotate(radians(6*second()-90)); 
    ellipse(i, 150, 10, 10);
    noStroke();
    popMatrix();
    
    pushMatrix();
    fill(150);
    rotate(radians(6*second()-90));
    ellipse(i, 200, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix();
    fill(255);
    rotate(radians(6*second()-90));    
    ellipse(i, 250, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix();
    fill(255);
    rotate(radians(6*second()-90));    
    ellipse(i, 300, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix();
    fill(150);
    rotate(radians(6*second()-90));    
    ellipse(i, 350, 10, 10);
    noStroke();
    popMatrix();

    pushMatrix();
    fill(255);
    rotate(radians(6*second()-90));    
    ellipse(i, 400, 10, 10);
    noStroke();
    popMatrix();
  }
  
  for (int i=0; i<minute()*10; i+=50)
  { 
    pushMatrix();
    fill(203, 50, 40);
    rotate(radians(6*minute()-90));
    ellipse(i, 00, 50, 50);
    noStroke();
    popMatrix(); 
  }
  
    for (int i=0; i<hour()*10; i+=50)
  { 
    pushMatrix();
    stroke(255);
    noFill();
    rotate(-radians(6*-hour()-90));
    ellipse(i, 0, 150, 150);
    popMatrix(); 
  }
}

