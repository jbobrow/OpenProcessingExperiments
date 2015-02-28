
void setup() {
  size(300, 300);
  background(255);
  noStroke();
}


void draw() {
  
  background(60, 245, 255);

    //loop 1-2 righe

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 25, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 35, 30, 30);
  }

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 75, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 65, 30, 30);
  }

  //loop 3-4 righe

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 125, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 135, 30, 30);
  }

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 175, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 165, 30, 30);
  }


  //loop 5-6 righe

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 275, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 265, 30, 30);
  }

  for (int i = 25; i < 300; i = i + 50) 
  {    
    fill(60, 65, 255);
    ellipse(i, 225, 50, 50);
    fill(61, 254, 119);
    ellipse(i, 235, 30, 30);
  }
}
