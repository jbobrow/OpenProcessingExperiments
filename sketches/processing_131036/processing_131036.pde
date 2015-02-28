
void setup()
{
  saveFile("flying bulseye.png");
  size(600, 600);
}
void draw()
{
background(0);


    
  fill(300, 0, 0);
  translate(mouseX, mouseY);
  ellipse(300,300, 100, 100);
  ellipse(300, 300, 75, 75);
  ellipse(300, 300, 50, 50);
  line(300, 300, 300, 0);
  line(300, 350, 300, 0);
  line(250, 300, 350, 300);
   

}
void mouseDragged() {
  fill(random(300), random(300), random(300));
    ellipse(300,300, 100, 100);
  ellipse(300, 300, 75, 75);
  ellipse(300, 300, 50, 50);
}


