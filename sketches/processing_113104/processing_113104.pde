
float a = 100;
float b = 100;
void setup()

{
  size(800,800);
  noStroke();
  background(255);
  frameRate(10);
   for (int i=0; i<=800;i+=200)
  {
    fill(0);
    rect(i,0,a,b);
  }
  for (int i=100; i<=800;i+=200)
  {
    fill(0);
    rect(i,100,a,b);
  }
  for (int i=0; i<=800;i+=200)
  {
    fill(0);
    rect(i,200,a,b);
  }
  for (int i=0; i<=800;i+=200)
  {
    fill(0);
    rect(i,400,a,b);
  }
  for (int i=0; i<=800;i+=200)
  {
    fill(0);
    rect(i,600,a,b);
  }
   for (int i=100; i<=800;i+=200)
  {
    fill(0);
    rect(i,300,a,b);
  }
   for (int i=100; i<=800;i+=200)
  {
    fill(0);
    rect(i,500,a,b);
  }
   for (int i=100; i<=800;i+=200)
  {
    fill(0);
    rect(i,700,a,b);
  }
}

void draw()
{
 drawpawn(random(800),random(800),60,60);

 
 
}


void drawpawn(float x, float y, float c, float d)
{ 
  //if (mouseX >= 0 && mouseY >= 0 && mousePressed == true && keyPressed == true)
  {
    strokeWeight(5);
    stroke(100);
    fill(0);
    rectMode(CENTER);
    rect(x,y+60,c/.75,d/3);
    rect(x,y+20,c/2,d);
    ellipse(x,y,c,d);
    textAlign(CENTER);
    fill(10,10,10,5);
    rect(400,350,width,200);
    fill(255,0,0);
    stroke(0);
    strokeWeight(10);
    textSize(170);
 
    text("PAWNED",400,400);
  }
}





