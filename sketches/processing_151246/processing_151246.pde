
size (600, 600);
background(0);
rectMode(CENTER);
 
float  angolo=0;
 
for (int x=4; x<=width; x+=30)
{
  for (int y=5; y<=height; y+=30)
  {
    angolo += 4;
    resetMatrix();
    translate(x, y);
    rotate(angolo);
     
    fill(255,200,random(100));
    stroke(0);
    strokeWeight(2);
    ellipse(40,10, 80,20);
    
    fill(0,200,random(100));
    noStroke();
    ellipse(40,10,50,10);
  }
}




