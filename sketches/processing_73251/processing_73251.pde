
PFont Font1, Font2;

int i=65, j=97;
float Width=0, Width1=0, AUX=0, AUX1=0;

void setup()
{
  size(1150,300);
  background(0);
  frameRate(6);
}

void draw()

{
  String[] Fonts = PFont.list();
  println (Fonts);
  
  fill(random(255), random(255), random(255));
  
  Font1 = createFont("Kunstler Script", 30);
  textFont (Font1);
  
    text (char(i), AUX, 110);
    Width = (textWidth (char(i)) ) + 20;
    AUX = Width + AUX;
    i++;
    
    fill(random(255), random(255), random(255));
    
    Font2 = createFont("Ravie", 30);
    textFont (Font2);
    
    text (char(j), AUX1, 200);
    Width1 = (textWidth (char(j)) ) + 20;
    AUX1 = Width1 + AUX1;
    j++;
   
  if(i==91 && j==123)
  {
    noLoop();
  }

}


