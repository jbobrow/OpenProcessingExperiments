
import processing.opengl.*;
import volatileprototypes.Panel4P.*;
import cello.tablet.*;
import gifAnimation.*;

public float redc=35, grec=250, bluc=245, sz=20;
public int paintmode=1;
public boolean ers=false;
Panel4P i;

GifMaker gifExport;

public int length = 10;
static int delay = 60;
public int currentFrame = 0;
PImage[] frames = new PImage[length];
int lastTime = 0;
JTablet jtablet = null;

boolean[] keys = new boolean[526];

public boolean pause=false;

void setup() {
  size(400,189); 
//  frameRate(30);
  
  initFrames();

  i = new Panel4P(this);
  i.addLabel("p","Paint");
  i.addButton("clr","Clear");
  i.addButton("ers","Erase", 0);
  i.addLabel("q","Stroke");
  String[] e = {"Ellipse","Motion","Line"};
  i.addButtonGroup("paintmode",e,1);
  i.addLabel("c","Color & Size");
  i.addSlider("redc","Red",0,255,redc);
  i.addSlider("grec","Green",0,255,grec);
  i.addSlider("bluc","Blue",0,255,bluc);
  i.addSlider("sz","Size",1,120,sz);
  i.addButton("pause","Pause", 0);
  i.addButton("loadBg","Load BG");
  i.addButton("export","Export GIF");
//  i.addSlider("currentFrame","Frame",0,15,currentFrame);
  i.autoSize();

  try {
    jtablet = new JTablet();
  } catch (JTabletException jte) {
    println("Could not load JTablet! (" + jte.toString() + ").");
  }
}

void initFrames() {
  background(0);
  for (int i = 0; i < frames.length; i++) {
    frames[i] = get(); // Create a blank frame
  }
}

void nextFrame() {
  frames[currentFrame] = get(); // Get the display window
  currentFrame++; // Increment to next frame
  if (currentFrame >= frames.length) {
    currentFrame = 0;
  }
  image(frames[currentFrame], 0, 0);
}

void draw() 
{
  try {
    // Get latest tablet information
    jtablet.poll();
  } catch (JTabletException jte) {
    println("JTablet Error: " + jte.toString());
  }
  
  int currentTime = millis();
  if (currentTime > lastTime+delay && !checkKey(KeyEvent.VK_CONTROL) && !pause) {
    nextFrame();
    lastTime = currentTime;
  }
  if (mousePressed) {
    if (jtablet.hasCursor())
    {
    // Get the current cursor
      JTabletCursor cursor = jtablet.getCursor();
      strokeWeight(
      cursor.getPressureFloat() * sz);
      ers = (cursor.getCursorType() == cursor.TYPE_PEN_ERASER);
    }
    else strokeWeight(sz);
//    line(pmouseX, pmouseY, mouseX, mouseY);
    
    
    if (!ers) {fill(redc,grec,bluc);stroke(redc,grec,bluc);} else {fill(0);stroke(0);}
    if (paintmode==0) {
      ellipse(mouseX,mouseY,noise(mouseX*.01,mouseY*.01)*sz,noise(mouseY*.01,mouseX*.01)*sz);
    } else if (paintmode==1) {
      //line(pmouseX-noise(mouseX*.01,mouseY*.01)*sz+sz*.5,pmouseY-noise(mouseY*.01,mouseX*.01)*sz+sz*.5,
        //   mouseX+noise(mouseX*.01,mouseY*.01)*sz-sz*.5,mouseY+noise(mouseY*.01,mouseX*.01)*sz-sz*.5);
        line(pmouseX, pmouseY, mouseX, mouseY);
    } else if (paintmode==2) {
      line(mouseX-noise(mouseX*.01,mouseY*.01)*sz+sz*.5,mouseY-noise(mouseY*.01,mouseX*.01)*sz+sz*.5,
        mouseX+noise(mouseX*.01,mouseY*.01)*sz-sz*.5,mouseY+noise(mouseY*.01,mouseX*.01)*sz-sz*.5);
    }
    if (mouseButton == RIGHT)
      initFrames();
  }
}

public void loadBg() {
  
  PImage[] allFrames = Gif.getPImages(this, "import.gif");
//  size(400,400); 
  frames = allFrames;

  /*
  if (allFrames.length() == 1) {
    for (int i = 0; i < frames.size; i++) {
      frames[i] = allFrames[0];
    }
  } else frames = allFrames;*/
}

public void export() {
  String filename = "export_" + year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second() + ".gif";
  gifExport = new GifMaker(this, filename);
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setTransparent(0,0,0); // make black the transparent color. every black pixel in the animation will be transparent
  // GIF doesn't know have alpha values like processing. a pixel can only be totally transparent or totally opaque.
  // set the processing background and the transparent gif color to the same value as the gifs destination background color 
  // (e.g. the website bg-color). Like this you can have the antialiasing from processing in the gif.
  
  gifExport.setDelay(1);
  for (int i = 0; i < length; i++)
    gifExport.addFrame(frames[i]);
  
  gifExport.finish();
}

public void clr() {
  initFrames();
//  fill(255);
//  noStroke();
//  rect(0,0,width,height);
}

boolean checkKey(int k) {
  if (keys.length >= k) {
    return keys[k];  
  }
  return false;
}
 
void keyPressed() { 
  keys[keyCode] = true;
//  println(KeyEvent.getKeyText(keyCode));
//  if(checkKey(CONTROL) && checkKey(KeyEvent.VK_S)) println("CTRL+S");
}
 
void keyReleased() { 
  keys[keyCode] = false; 
}

