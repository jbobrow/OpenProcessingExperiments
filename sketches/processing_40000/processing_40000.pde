
void setup()
{
  size(600, 600); 
  noStroke();
  noLoop();
}

void draw()
{
  // this for loop draws a bunch of horizontal ines
  // or random thikness and random shade of grey
  for(int i=0;i<height;i++){
    strokeWeight(random(30));
    stroke(random(255));
   line(0,i,width,i);
  } 
  
  // this nested loop draws a grid of houses
  for (int x=0;x<width;x+=50) {
    for (int y=25;y<width;y+=75) {
      house(x, y, 50, random(255));
    }
  }
}

//it is possible to have two fuctions with the same name
//as long as they have a different sets of arguments
void house() {
  int x=100;
  int y=100;
  int s=50;
  triangle(x, y, x+s, y, x+s/2, y-s/2);
  rect(x, y, s, s);
}

void house(float x, float y, float s, float c) {
  noStroke();
  colorMode(HSB,255);
  fill(c,200,200,120);
  triangle(x, y, x+s, y, x+s/2, y-s/2);
  rect(x, y, s, s);
}


