
float Cx;
float Cy;
int C = 49;
boolean dentroC = false;
boolean bloqueado = false;

void setup() 
{
  size(100, 100);
  Cx = width/2.0;
  Cy = height/2.0;
  rectMode(RADIUS);  
}

void draw() 
{ 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > Cx-C && mouseX < Cx+C && 
      mouseY > Cy-C && mouseY < Cy+C) {
    dentroC = true;  
    if(!bloqueado) { 
       background(255);
    noStroke(); 
    fill(255);
    } 
  } else {
   noStroke();
    background(100);
    fill(100);
  }
  
  // Draw the box
  rect(Cx, Cy,C, C);
}

