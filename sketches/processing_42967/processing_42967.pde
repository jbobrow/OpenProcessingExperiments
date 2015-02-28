
int num = 0;
float percentage;

void setup()
{
  size(300,300);
}

void draw()
{
  
  stroke(255);
  background(0);
  if (mousePressed)
  {
   num = 0;
   percentage = 0;
  }
  if (percentage < 100)
  {  
    textAlign(LEFT);
    num += 1;
    percentage = map(num,0,300,0,100);
    noFill();
    rect(50,(150-10),200,20);
    fill(255);
    noStroke();
    rect(50,(150-10),2*percentage,20);
    text("LOADING " + int(percentage) + "%", 50, 150-18);
  }
  else
  {
    textAlign(CENTER);
    text("DONE! CLICK TO RESET",150,150);
  }
  
}
