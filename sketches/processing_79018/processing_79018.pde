

boolean mode = false;


void setup()
{
  size(400,400);
  noLoop();
  smooth();
}
void draw()
{
  String answers[] = loadStrings("answers.txt");
  background(255);
  if (mode == true)
  {
    int x = int (random(0,15));
    fill(0);
    ellipse(200,200,400,400);
    fill(255);
    ellipse(200,200,220,220);
    fill(0);
    triangle (100,170,200,300,300,170);
    fill(255);
    textSize(10);
    text(answers[x],155,200);
  }
  else
  {
    fill(0);

    ellipse(200,200,400,400);
    fill(255);
    ellipse(200,60,190,90);
    fill(0);
    ellipse(200,40,50,35);
    ellipse(200,75,60,50);
    fill(255);
    ellipse(200,40,50,25);
    ellipse(200,75,60,40);
    
    
  }
}
void mousePressed()
{
  mode = !mode;
//  if(mouseX >25 && mouseX< 75 && mouseY > 25 && mouseY < 75)
//  {
//    fill (255,0,0);
//  }
  redraw();
}
void mouseReleased()
{
  fill (255);
  redraw();
}
  

