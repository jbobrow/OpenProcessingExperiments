
Maxim maxim;
AudioPlayer player;
void setup()
{
 maxim = new Maxim(this);
player = maxim.loadFile("AullidoLobo.wav");
 player.setLooping(true);
 player.volume(0.25);
  size(640, 960);
  background(0);
  rectMode(CENTER);

}

void draw()
{
//  
}

void mouseDragged()
{
 player.play();
  
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);
  float alpha = map(speed, 0, 20, 0, 10);
  float lineWidth = map(speed, 0, 10, 10, 1);

  fill(0, alpha);
  rect(width/2, height/2, width, height);
  stroke(100, 255);
  for (int i=1;i<=640;i=i+3)
  {
    line(i, 960/2+(mouseY-960/2)*cos(3.1416*i/180+mouseX*3.1416/180), i+1, 960/2+(mouseY-960/2)*cos(3.1416*(i+1)/180)+mouseX*3.1416/180);
  }
  player.setFilter((float) mouseY/height*5000,mouseX / width);
  player.speed((float) mouseX/width);
   
}

void mouseReleased()
{
          
}
