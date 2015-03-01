
class spark
{
    int age = 0;

    float x, y, vx, vy;
    public spark(float xi, float yi, float vxi, float vyi)
    {
      x = xi;
      y = yi;
      vx = vxi;
      vy = vyi;
    }

   void draw()
   {
     stroke(255);
     line(x, y, x +vx, y+vy);
     x = x +vx;
     y = y +vy;
     vx *= frictionP;
     vy *= frictionP;
     age++;
   }

}

var spks = new ArrayList();
var lastx = null;
var lasty = null;
int sparkspstep = 3;
PGraphics cvs;
float frictionP = 0.5;

void setup() {
  size(640, 480);
  background(0);
  stroke(255);
  strokeWeight(3);
  cvs = createGraphics(width, height);
  cvs.stroke(255);
  cvs.strokeWeight(3);
}

int fingdown =0;

void draw()
{
   background(0);
   for(int i = spks.size()-1; i >= 0; i--)
   {
      var spk = spks.get(i);
      if(abs(spk.vx) < 0.001 && abs(spk.vy) < 0.001)
      {
         cvs.beginDraw();
         cvs.stroke(255);
         cvs.strokeWeight(3);
         cvs.line(spk.x, spk.y, spk.x, spk.y);
         cvs.endDraw();
         spks.remove(i);
      }
   }

   image(cvs,0,0);
   for(var spk:spks)
   {
     spk.draw();
   }
}
 
 
void mouseDragged()
{
    var x = mouseX;
    var y = mouseY;

    if (lastx == null)
    {
       lastx = x;
       lasty = y;
    }

    float dx = x - lastx;
    float dy = y - lasty;
    dx = dx*1.2;
    dy = dy*1.2;
    for(int i = 0; i < sparkspstep; i++)
    {
       dx += (random(4)-2);
        dy += (random(4)-2);
 
       spks.add(new spark(x,y,dx,dy));
    }

   cvs.beginDraw();
   cvs.line(x,y,lastx,lasty);
    
    lastx = x;
    lasty = y;
}



void mouseReleased()
{
  lastx = null;
  lasty = null;
}
 
void touchMove(TouchEvent touchEvent) {
  for (int i = 0; i < touchEvent.touches.length; i++) {

    var tch = touchEvent.touches[i];
    var x = tch.offsetX;
    var y = tch.offsetY;

    if (lastx == null)
    {
       lastx = x;
       lasty = y;
    }

    float dx = x - lastx;
    float dy = y - lasty;
    dx = dx*1.2;
    dy = dy*1.2;
    for(int i = 0; i < sparkspstep; i++)
    {
       dx += (random(4)-2);
        dy += (random(4)-2);
 
       spks.add(new spark(x,y,dx,dy));
    }

   cvs.beginDraw();
   cvs.line(x,y,lastx,lasty);
    
    lastx = x;
    lasty = y;
  }
}

void touchStart(TouchEvent te)
{
  fingdown ++;
  if(fingdown > 2)
  {
     cvs.beginDraw();
     cvs.background(0);
     cvs.endDraw();
     background(0);
  }
}

void touchEnd(TouchEvent touchEvent) {
  lastx = null;
  lasty = null;
  fingdown -=1;
  if(fingdown < 0) fingdown = 0;
}
