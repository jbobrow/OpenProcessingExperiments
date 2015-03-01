
import gifAnimation.*;

GifMaker gifExport;

PFont font;
String[] fonts;
String t = "¯\\_(ツ)_/¯";
int index = 0;

void setup() {
  size(256, 128);

  fonts = PFont.list();
  
  gifExport = new GifMaker(this, "yumad_emoji.gif");
  gifExport.setRepeat(0);
}

void draw()
{
  background(0);
  font = createFont(fonts[index], 32);
  textFont(font);
  textAlign(CENTER, CENTER);
  text(t, width/2, height/2);

  gifExport.setDelay(1);
  gifExport.addFrame();
  
  if (index < fonts.length-1)
  {
    index ++;
  }
  else
  {
    gifExport.finish();
    exit();
  }
}

