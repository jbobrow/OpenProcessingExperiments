
void setup()
{
  size(876,900);
  frameRate(10);
  smooth();
}

void draw()
{
  int n = 0;
  background(1,7,10);
  float alpha = random(150);
  stroke(206,231,240,alpha);
  
  for(int i=0; i<100; i+=1)
  {
    strokeWeight(3);
    float x = random(width);
    float a = random(-PI/60, PI/60);
    float size = random(800,1000);
    line(x,0 ,x+size*sin(a),size*cos(a)); 
  }
  if(mousePressed)
  {
    noStroke();
    fill(206,231,240);
    ellipse(mouseX,mouseY, 150,120);
    fill(1,7,10);
    rect(mouseX-75,mouseY,150,900-mouseY);
    stroke(255);
    line(mouseX,mouseY, mouseX, mouseY+75);
    line(mouseX,mouseY+75,mouseX+10,mouseY+60);
    line(mouseX,mouseY-60,mouseX,mouseY-70);
  }
}
