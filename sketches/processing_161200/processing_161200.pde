

void setup() {
  size(500, 500);
  fill(0);
  background(0);
  noStroke();
}

void draw() {
  float taille = random(30,80);
 
  if (keyPressed == true)
  { 
    fill(0, 0, random(200, 255), random(10, 25));
    rect(random(500), random(500), taille, taille);
    
    fill(random(200, 255), 0, 0, random(10, 25));
    rect(random(500), random(500), taille, taille);  
    
    fill(random(200, 255), random(80, 255), 0, random(10, 25));
    rect(random(500), random(500), taille, taille); 
    
    fill(0, random(200, 255), 0, random(10, 25));
    rect(random(500), random(500), taille, taille);
  }

  else {  
    fill(0, 0, random(200, 255), random(10, 35));
    ellipse(random(500), random(500), taille, taille);
    
    fill(random(200, 255), 0, 0, random(10, 35));
    ellipse(random(500), random(500), 60, 60);  
    
    fill(random(200, 255), random(80, 255), 0, random(10, 35));
    ellipse(random(500), random(500), taille, taille); 
    
    fill(0, random(200, 255), 0, random(10, 35));
    ellipse(random(500), random(500), 60, 60);
  }  
  
}


