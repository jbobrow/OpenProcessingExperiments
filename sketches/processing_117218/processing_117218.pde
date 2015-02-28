
int randR, randG, randB;

void setup() {
size(500,500);
background(00);
}

void draw() {

  if(mouseClicked) {
    fill(randR, randG, randB);
    ellipse(250,250,400,400);
    rect(230, 15, 35, 35);
  }
 
 

fill(0);
triangle(130, 230, 168, 160, 206, 230);
triangle(290, 230, 328, 160, 366, 230);
triangle(230, 290, 250, 250, 270, 290);
rect(255, 320, 25, 55);
rect(215, 320, 25, 55);
rect(180, 320, 20, 35);
rect(295, 320, 20, 35);

}


void mouseClicked()
{
  randR = (int)random(255);
  randG = (int)random(255);
  randB = (int)random(255);
}
