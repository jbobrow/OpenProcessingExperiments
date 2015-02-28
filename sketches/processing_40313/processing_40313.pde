


void setup()
{
 size(600,600);
 noStroke();
 smooth();
 background(0);
 
}

void draw()
{
 for (int i = 0; i < 50; i++)
 {
   fill(255, 255, 255, 1);
 ellipse (mouseX,mouseY, 20, 20);
 }
 fill (random(300),random(300),random(300),5);
 for(int g = 0; g < 10; g++)
 {
 if (mousePressed) ellipse(mouseX+random(-100,100), mouseY+random(-100,100), 20, 20);
 }
}



