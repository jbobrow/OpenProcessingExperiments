
void setup()
{
  size(600, 600);
  background(0);
  frameRate(20);
}
int x=0;
void draw()
{
  background(0,0,0,255);
  fill(255);
  textSize(60);
  text("Failblows", 100,240);
  textSize(20);
  text("Macrohard", 103,190);
  textSize(30);
  fill(255,0,0);
  text("LOL", 370,215);
  fill(255);
  textSize(15);
  text("Copyright Lololo", 10,590);
  textSize(20);
  text("Macrohard", 475,590);
  fill(255);
  fill(102,151,234);
  stroke(0);
  quad(0+x,251,24+x,251,24+x,299,0+x,299);
  quad(29+x,251,53+x,251,53+x,299,29+x,299);
  quad(58+x,251,82+x,251,82+x,299,58+x,299);
  fill(0);
  quad(501,250,600,250,600,300,501,300);
  quad(0,250,99,250,99,300,0,300);
  noFill();
  stroke(255);
  quad(100,250,500,250,500,300,100,300);
  stroke(0);
  strokeWeight(3);
  fill(239,240,77);
  quad(300,50,350,50,350,100,300,100);
  fill(0,255,0);
  quad(300,105,350,105,350,155,300,155);
  fill(0,0,255);
  quad(355,50,405,50,405,100,355,100);
  fill(255,0,0);
  quad(355,105,405,105,405,155,355,155);
  x=x+10;
  if (x>500)
  {
    x=10;
  }

}
