
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Boolean playing = false;
Minim m;
AudioPlayer player;
FFT fft;

SoundRing[] soundrings = new SoundRing[20];
SoundRing[] soundrings1 = new SoundRing[15];
SoundRing[] soundrings2 = new SoundRing[10];
int offsetx, offsety;

void setup()
{
  size(600, 400);
  background(0);
  m = new Minim(this);
  player = m.loadFile("song.mp3", 512);
  
  fft = new FFT(player.bufferSize(), player.sampleRate());
  for(int i = 0; i < soundrings.length; ++i)
  {
    soundrings[i] = new SoundRing(.5, boolean(i%2), 2, 3*i + 50, 3*i, 90);
  }
  for(int i = 0; i < soundrings1.length; ++i)
  {
    soundrings1[i] = new SoundRing(.5, !boolean(i%2), 2, 3*i + 60, 3*i, 90);
  }
  for(int i = 0; i < soundrings2.length; ++i)
  {
    soundrings2[i] = new SoundRing(.5, boolean(i%2), 2, 3*i + 70, 3*i, 90);
  }
  smooth();
  strokeCap(PROJECT);
  offsetx = 353;
  offsety = 235;
  player.play();

}

void draw()
{
  if(player.isPlaying()){
  background(0);
  
  
  stroke(color(175, 0, 175));
  strokeWeight(1);
  for(int i = 0; i < 509; ++i)
  {
     line(3.1*i, height/2-100*(player.left.get(i)), 3.1*i + 2, height/2-100*(player.left.get(i + 2)));
     line(3.1*i, height/2-100*(player.right.get(i)), 3.1*i + 2, height/2-100*(player.right.get(i + 2)));
  }
  stroke(color(0, 175, 175));
  
  fft.forward(player.left);
  for(int i = 0; i < width/2; i+=2)
  {
    if(fft.getBand(i)*10 < height/2 && fft.getBand(i)*10 > 1)line(i+width/2, height, i+width/2, height - fft.getBand(i)*10);
  }
  
  for(int i = width/2-1; i > -1; i-=2)
  {
    if(fft.getBand(width/2-1 - i)*10 < height/2 && fft.getBand(width/2-1 - i)*10 > 1) line(i, height, i, height - fft.getBand(width/2-1 - i)*10);
  }
  fft.forward(player.right);
  for(int i = 0; i < width/2; i+=2)
  {
    if(fft.getBand(i)*10 < height/2 && fft.getBand(i)*10 > 1)line(i+width/2, 0, i+width/2, fft.getBand(i)*10);
  }
  
  for(int i = width/2-1; i > -1; i-=2)
  {
    if(fft.getBand(width/2-1 - i)*10 < height/2 && fft.getBand(width/2-1 - i)*10 > 1) line(i, 0, i, fft.getBand(width/2-1 - i)*10);
  }
  
  fft.forward(player.left);
  for(int i = 0; i < soundrings.length; ++i)
  {
    color cur = color(175, 0, round(fft.getBand(soundrings[i].band))*10);
    soundrings[i].update(fft);
    soundrings[i].draw(offsetx, offsety, cur);
  }
  fft.forward(player.right);
  for(int i = 0; i < soundrings1.length; ++i)
  {
    color cur = color(0, round(fft.getBand(soundrings1[i].band))*10, 175);
    soundrings1[i].update(fft);
    soundrings1[i].draw(offsetx-50, offsety-100, cur);
  }
  fft.forward(player.mix);
  for(int i = 0; i < soundrings2.length; ++i)
  {
    color cur = color(round(fft.getBand(soundrings2[i].band))*10, 175, 0);
    soundrings2[i].update(fft);
    soundrings2[i].draw(offsetx-150, offsety, cur);
  }
  }
}

void keyPressed()
{
  if(key == ' ')
  {
    playing = !playing;
    if(playing)player.play();
    else player.pause();
  }
  else if(key == 'o')
  {
    player.pause();
    try
    {
      player = m.loadFile(selectInput(), 512);
      player.play();
    }
    catch(NullPointerException e)
    {
      player = m.loadFile("song.mp3", 512);
    }
  }
}

void stop()
{
  player.close();
  m.stop();
  super.stop();
}

class SoundRing
{
  float rotation = 0;
  float constant = 1;
  Boolean direction = false;
  int weight = 1;
  int rad = 100;
  public int band = 0;
  int arclength = 180;
  
  public SoundRing(float constant, Boolean direction, int weight, int rad, int band, int arclength)
  {
    this.constant = constant;
    this.direction = direction;
    this.weight = weight;
    this.rad = rad;
    this.band = band;
    this.arclength = arclength;
  }
  
  public void update(FFT fft)
  {
    rotation += fft.getBand(band)*constant;
    if(rotation > 360) rotation = rotation%360;
  }
  
  public void draw(int x, int y, color col)
  {
    stroke(col);
    strokeWeight(weight);
    for(int i = 0; i < arclength; ++i)
    {
      float ppx, ppy, px, py;
      if(direction)
      {
        ppx = rad*cos(radians(rotation + i - 1));
        px = rad*cos(radians(rotation + i));
        ppy = rad*sin(radians(rotation + i - 1));
        py = rad*sin(radians(rotation + i));
      }
      else
      {
        ppx = rad*cos(radians(-rotation - i - 1));
        px = rad*cos(radians(-rotation - i));
        ppy = rad*sin(radians(-rotation - i - 1));
        py = rad*sin(radians(-rotation - i));
      }
      
      line(x+ppx, y+ppy, x+px, y+py);
      
    }
  }
}

