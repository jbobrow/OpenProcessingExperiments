
//jitters

PFont lakestreet;
String word = "jittery";

void setup()
{
  size(700, 700);
  smooth(); 
  lakestreet = loadFont("Lakestreet-48.vlw");
  textAlign(CENTER, CENTER);
}


void draw()
{
  background(255, 248, 222);
  float mx = mouseX/20;
  float my = mouseY/20;
  float offsetA = random(-mx, my);
  float offsetB = random (-mx, my);
  fill(255, 104, 28 );
  textFont(lakestreet);
  textSize(45);

  for (int x=20; x < width; x+=20)
  {
    if(
        (mouseX<width/2) && 
        (mouseX>(width/2)) && 
        ((mouseY<height/2) && (mouseY>(height/2+45) ) )
    )
    {
      //translate(-100, 0);
      text( word, (x+offsetB), (x-offsetA));
    }
  }
}


