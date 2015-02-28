

void setup()
{
  size(500, 500);
  background(255); 
}

void draw()
{
background(255); 

translate(width/2, height/2);
pushMatrix(); 
  noStroke();
  fill(134, 255, 157);
  ellipse(0, 0, 150, 150);
  popMatrix(); 
  
  for (int y=0; y<360; y+=30) {
    pushMatrix();
    rotate(radians(y)); 
    translate(0, 125); 
    noFill(); 
    stroke(0); 
    rect(0, 0, 20, 20); 
    popMatrix(); 
 
  
  for (int x=0; x<360; x+=30) {
    pushMatrix();
    rotate(radians(x)); 
    translate(0, 175);
    fill(134, 255, 157);
    noStroke();
    ellipse(0, 0, 25, 25); 
    popMatrix(); 
  }
  }


float sec = map(second(), 0, 60, 0, 360); 
pushMatrix();
rotate(radians(sec));
translate(0, -175); 
noStroke(); 
fill(0);
ellipse(0, 0, 10, 10); 
popMatrix();


float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min)); 
translate(0, -100); 
noStroke();
fill(0);
ellipse(0, 0, 15, 15);
popMatrix();


float h = map(hour(), 0, 12, 0, 360);
pushMatrix(); 
rotate(radians(h)); 
translate(0, -50); 
noStroke(); 
fill(0); 
ellipse(0, 0, 25, 25); 
popMatrix(); 

}
