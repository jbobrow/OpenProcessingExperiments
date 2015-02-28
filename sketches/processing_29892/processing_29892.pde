
void setup()
{
size(800,600);
background(225);
smooth();

}

void draw(){

for (int i=0; i<10; i=i+1) 
  if (mousePressed == true) {
    fill(random(255),random(255),random(0));
  } else {
    fill (random(255));
  }

quad(mouseX, mouseY, random(width), random(height), random(width), random(height), random(width), random(height));
}

