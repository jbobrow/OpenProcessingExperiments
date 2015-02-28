
//Derek Chan, Magic Eight Ball, CP1 Mods 14-15
PImage fortune;
PImage fortunes[]; 
PImage azn;
PImage dollar;
boolean paid=false;
int money = 0;
void setup()
{
  size(600, 600);
  textAlign(CENTER);
  textSize(30);
  fortunes = new PImage[11];
  fortunes[0] = loadImage("Zero.jpg");
  fortunes[1] = loadImage("One.jpg");
  fortunes[2] = loadImage("Two.jpg");
  fortunes[3]= loadImage("Three.jpg");
  fortunes[4]=loadImage("Four.jpg");
  fortunes[5]=loadImage("Five.jpg");
  fortunes[6]=loadImage("Six.jpg");
  fortunes[7]=loadImage("Seven.jpg");
  fortunes[8]=loadImage("Eight.jpg");
  fortunes[9]=loadImage("Nine.jpg");
  fortunes[10]=loadImage("Ten.jpg");
  fortune=loadImage("FortuneTeller.jpg");
  azn=loadImage("Azn.jpg");
  dollar=loadImage("dolla.jpg");
  noLoop();
}
void draw()
{
  int decider = int(random(11));
  if (paid==false)
  {
    image(fortune, 0, 0, 600, 600);
    image(azn, 250, 175, 100, 150);
    fill(0);
    textSize(30);
    text("You want fortune? One dollah each!", 300, 550);
    image(dollar, 400, 0, 200, 100);
    fill(255);
    text("Money Spent:$" + money + ".00", 175, 100);
  }
  else if (paid==true)
  {
    image(fortunes[decider], 0, 0, 600, 600);
  }
}
void mousePressed()
{
  if (mouseX>400 && mouseX<600 && mouseY>0 && mouseY<100 && paid==false)
  {
    paid=!paid;
    money=(money+1);
    redraw();
  }
  else if (mousePressed==true)
  {
    paid=false;
    redraw();
  }
}



