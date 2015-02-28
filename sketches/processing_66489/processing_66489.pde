
int x;
int y;


void setup(){
  size(400, 400);
  background(240, 0, 200);

  
  
  x = 0;
  y = 0;
}

void draw(){
    
  noStroke();
  fill(255, 50, 100, 80);
  x = mouseX; //la elipse se mueve con el mouse
  y = mouseY;
  ellipse(x, y, 90, 90);
  
  noStroke();
  fill(0, 100, 100, 80);
  x = mouseX; //la elipse se mueve con el mouse
  y = mouseY;
  ellipse(x, y, 60, 60);
 
  noStroke();
  fill(255, 70, 100);
  x = mouseX; //la elipse se mueve con el mouse
  y = mouseY;
  rect(x, y, 10, 10);
  
  
  
  
}

