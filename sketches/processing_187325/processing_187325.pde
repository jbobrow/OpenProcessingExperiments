
import ddf.minim.*;
import ddf.minim.analysis.*;
Minim minim;
AudioPlayer song;
AudioMetaData meta;
BeatDetect beat;

String songFile = "1 Mas Que Nada.mp3";
int gridSize = 40;
color[] aColor;
float bColor;
int historySize;

void setup()
{
  size(640, 360); 
  background(0);
  noStroke();
  colorMode(HSB, 256);
  
  minim = new Minim(this);
  beat = new BeatDetect();
  beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.setSensitivity(40);
  println(dataPath(songFile));
  song = minim.loadFile(dataPath(songFile));
  song.play();
  
  historySize = (int)Math.ceil((0.5 * width)/gridSize);
  aColor = new color[historySize];
}

void draw()
{
  for (int i = historySize - 1; i > 0; i--)
  {
    aColor[i] = aColor[i - 1];
  }
  
  beat.detect(song.mix);
  if (beat.isHat()) aColor[0] = color(random(0,255), 128, 200);
  else
  {
    aColor[0] = color(hue(aColor[0]), saturation(aColor[0]) - 1, 200);
    if (beat.isKick()) bColor = 128;
    else bColor--;
  }
  
  background(0);
  
  int i = 0;
  for (int x = (int)(width * 0.5); x <= width - gridSize; x += gridSize)
  {
    for (int y = gridSize; y <= height - gridSize; y += gridSize)
    {
      if (x != width * 0.5 || y > height * 0.5)
        DrawNode(i, true, width - x, y);
      if (x != width * 0.5 || y < height * 0.5)
        DrawNode(i, false, x, y);
    }
    i++;
  }
}

void DrawNode(int index, boolean isLeftChannel, int x, int y)
{
  noStroke();
  fill(aColor[index]);
  float channelVolume;
  if (isLeftChannel) channelVolume = song.left.get(index);
  else channelVolume = song.right.get(index);
  float size = gridSize * 0.5 * channelVolume;
  float halfSize = 0.5 * size;
  rect(x - halfSize, y - halfSize, size, size);
  stroke(#00FF00, bColor);
  line(x, y, width/2, height/2);
}


