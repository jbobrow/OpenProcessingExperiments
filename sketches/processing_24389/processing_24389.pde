


int x = 0;
int y = 0;
int z = 55;
int q = 20;
int b = 10;


void setup() {
  size(300,600);
  background(255);
  frameRate(600);
  fill(16, 103, 15, 140);
  rect(0, 0, width, height);
  smooth();
}


void draw()
{
  while(q < 266) {
    stroke(q,z,0,20);
    strokeWeight(3);
    if(random(0,2) < 1) {
      line(0,0,x,y);
      x = x + b;
      if(x > width*2) {
        x = 0;
        y = y + b;
        if(y > height) {
          y = 0;
          x = 0;
          z = z + 25;
          q = q + 10;
          b = b +10;
        }
      }
    }
  }
}

void keyPressed()
//Takes PNG screenshots when you push S
//Careful - doesn't prompt when overwriting files!
{
  if(key == 's' || key == 'S')
  {
    String filePath = selectInput("Saving PNG - Select or Type File Name");  // Opens file chooser
    if(filePath != null)
    {
      save(filePath + ".png");
    }
  }
}


