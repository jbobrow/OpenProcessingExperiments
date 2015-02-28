
// import java.awt.event.KeyEvent;
public static final int KEY_M = 77;
public static final int KEY_1 = 49;
public static final int KEY_9 = 57;

Pen pen;
Pen pen1;
Pen pen2;
Pen pen3;
PImage saveScreen;

boolean four = true;
int dots = 9;

void setup() {
  size(640, 480);
  frameRate(60);
  restart(four, dots);
}

public void restart(boolean four, int dots) {
  background(-1);
  pen = new Pen(dots, width/2, height/2);
  if (four) {
    pen1 = new Pen(dots, width/2, height/2);
    pen2 = new Pen(dots, width/2, height/2);
    pen3 = new Pen(dots, width/2, height/2);
  } else {
    pen1 = null;
    pen2 = null;
    pen3 = null;
  }
  saveScreen = null;
}

void draw()
{
  smooth();
  if(mousePressed) {
    if (mouseButton == RIGHT) {
      background(-1);
      saveScreen = get();
    } else {
      saveScreen = null;
    }
  } else if (saveScreen == null) {
    saveScreen = get();
  } else {
    image(saveScreen, 0, 0);
  }
  pen.draw(mouseX, mouseY);
  if (four) {
    pen1.draw(width - mouseX, mouseY);
    pen2.draw(mouseX, height - mouseY);
    pen3.draw(width - mouseX, height - mouseY);
  }
}


void keyPressed ()
{
  if (keyCode == /* KeyEvent.VK_M */ KEY_M) {
    four = !four;
    restart(four, dots);
  } else if (keyCode >= /* KeyEvent.VK_1 */ KEY_1 && keyCode <= /* KeyEvent.VK_9 */ KEY_9)
  {
    dots = 2* (keyCode - /* KeyEvent.VK_1 */ KEY_1) + 3;
    restart(four, dots);
  }
}


public class Pen {
  public final float [] coords;
  public final int count;
  public final int col;
  public Pen (final int count, final int startx, final int starty) {
    coords = new float [count * 2];
    this.count = count;
    col = 196 / count;
    for(int i=0;++i<count;) {
      coords[i] = startx;
      coords[i+count] = starty;
    }
  }
  
  public void draw(int mouseX, int mouseY) {
    coords[count]=mouseY;
    coords[0]=mouseX;
    stroke(0);
    for(int i=0;++i<count;) {
      float x = coords[i];
      float y = coords[i+count];
      coords[i]+=(coords[i-1]-coords[i])/i;
      coords[i+count]+=(coords[i+count - 1]-coords[i+count])/i;
      line(x, y,coords[i],coords[i+count]);
      // stroke(i* count * 2);
      stroke(i * (col + 1));
    }    
  }
}
