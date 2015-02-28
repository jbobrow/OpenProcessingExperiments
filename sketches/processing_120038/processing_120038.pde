
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
  fill(200);
  ellipse(0, 0, 150, 150);
  popMatrix(); 
  
  pushMatrix(); 
  fill(160);
  ellipse(0, 0, 100, 100);
  popMatrix(); 
  
  pushMatrix(); 
  fill(130);
  ellipse(0, 0, 50, 50);
  popMatrix(); 
  
  for (int x=0; x<360; x+=6) {
  pushMatrix(); 
  rotate(radians(x)); 
  translate(0, 200); 
  noStroke();
  fill(200); 
  ellipse(0, 0, 10, 10); 
  popMatrix(); 
  
  for (int y=0; y<360; y+=90) {
  pushMatrix(); 
  rotate(radians(y)); 
  translate(0, 200); 
  noStroke();
  fill(255, 216, 235); 
  ellipse(0, 0, 30, 30); 
  popMatrix(); 
  
  for (int i=0; i<360; i+=30) {
  pushMatrix(); 
  rotate(radians(i)); 
  translate(0, 200); 
  noStroke();
  fill(160); 
  ellipse(0, 0, 20, 20); 
  popMatrix(); 
} 
}
}
 
float sec = map(second(), 0, 60, 0, 360); 
println(sec);  
pushMatrix();
rotate(radians(sec)); 
translate(0,-200);
noStroke(); 
fill(240, 5, 119); 
ellipse(0,0, 10, 10); 
popMatrix(); 

float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min)); 
translate(0, 0); 
noStroke();
fill(80);
rect(0, 0, 1, -150);
popMatrix();

float h = map(hour(), 0, 12, 0, 360);
pushMatrix(); 
rotate(radians(h)); 
translate(0, 0); 
noStroke(); 
fill(80); 
rect(0, 0, 3, -100); 
popMatrix(); 

pushMatrix(); 
fill(100);
ellipse(0, 0, 20, 20);
popMatrix(); 

}





