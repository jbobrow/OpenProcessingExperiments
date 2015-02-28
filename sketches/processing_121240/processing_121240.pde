
void setup()
{
 size(600,600);
 noStroke();
 smooth(2);
 background(#FFFFFF);
  
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
   fill(random(255,0),random(0,255),random(0,255));
 if (mousePressed) rect(mouseX+random(-500,500), mouseY+random(-500,500), 85, 35);
 }
 {
    fill(#6EFFF9);
 if (mousePressed) ellipse(mouseX+random(-400,400), mouseY+random(-400,400), 40, 40);
 }
 {
    fill(random(0,255),random(0,255),random(0,255));
 if (mousePressed) ellipse(mouseX+random(-300,300), mouseY+random(-300,300), 20, 90);
 }
  {
   fill(random(255,0),random(255,0),random(0,255));
 if (keyPressed) {
    if (key == 'y' || key == 'Y') ellipse(mouseX+random(-200,200), mouseY+random(-200,200), 90, 20);
 }}
 {
    fill(random(255,90),random(90,255),random(255,90));
 if (mousePressed) ellipse(mouseX+random(-100,100), mouseY+random(-100,100), 40, 20);

}
  {
   fill(#18F50C);
 if (keyPressed) {
    if (key == 'g' || key == 'G') ellipse(mouseX+random(-450,250), mouseY+random(-450,250), 10, 70);
 }}
}

