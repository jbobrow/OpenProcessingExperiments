
int x, y;
Maxim maxim;
AudioPlayer player;

void setup()
{
  
  size(800, 600);
  background(0);
   start();
  maxim=new Maxim(this);
  player = maxim.loadFile("1.wav");
  player.setLooping(false);
}

void start()
{
  noFill();
  stroke(255, 0, 0);
  rect( width/2-80, height/2-80, 200, 200);
  textSize(16);
  text("start drag the star", 350, 270);
  x=420;
  y=300;
  stroke(random(255), random(255), random(255));
  line(x, y, x-30, y+70);
  line(x-30, y+70, x+50, y+20);
  line(x+50, y+20, x-50, y+20);
  line( x-50, y+20, x+30, y+70);
  line( x+30, y+70, x, y);
}

void smallStar()
{
  background(0);
  noFill();
  stroke(255, 0, 0);
  rect( width/2-80, height/2-80, 200, 200);
  textSize(16);
  text("start drag the star", 350, 270);

  x=mouseX;
  y=mouseY;
  stroke(random(255), random(255), random(255));
  line(x, y, x-30, y+70);
  line(x-30, y+70, x+50, y+20);
  line(x+50, y+20, x-50, y+20);
  line( x-50, y+20, x+30, y+70);
  line( x+30, y+70, x, y);
}

void largeStar()
{
  x=mouseX;
  y=mouseY;
  stroke(random(255), random(255), random(255));
  line(x, y, x-70, y+110);
  line(x-70, y+110, x+90, y+50);
  line(x+90, y+50, x-90, y+50);
  line( x-90, y+50, x+70, y+110);
  line( x+70, y+110, x, y);
}

void draw() {
  float ratio = (float) mouseX / (float) width;
  ratio *= 2;
  player.speed(ratio);
}

void mouseDragged()
{
  if (dist(mouseX, mouseY, width/2, height/2) < 250)
  {
    smallStar();
   }
  if (dist(mouseX, mouseY, width/2, height/2) >= 250)
  {
    largeStar();
     player.cue(0);
  player.play();
  }
 
}

void mouseReleased()
{
  background(0);
  start();
  player.stop();
}




