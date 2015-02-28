
import java.util.ArrayList;
ArrayList  flames;
boolean isPressed = false;
int opacity = 40;
/**
 * Click and drag to strike!
 */
void setup()
{
  flames = new ArrayList();
  noCursor();
  size(300,300);
  frameRate(10);
  smooth();
}
void draw()
{
  background(0);
  fill(255,211,155);
  rect(mouseX-2,mouseY-20,4,40);
  fill(205,38,38);
  ellipse(mouseX,mouseY-20,6,6);
  for(int i = 0; i<flames.size();)
  {
    Flame aFlame = (Flame)flames.get(i);
    aFlame.burn();
    if(aFlame.height<2)
      flames.remove(i);
    else
      i++;
  }
  if(isPressed)
    flames.add(new Flame(mouseX,mouseY-20));
}
void mouseDragged()
{
  flames.add(new Flame(mouseX,mouseY-20));
}

void mousePressed()
{
  isPressed = true;
}

void mouseReleased()
{
  isPressed = false;
}




class Flame
{
  int x,y,height;
  Flame(int a, int b)
  {
    x=a;
    y=b;
    height=30;

  }
  void burn()
  {
    int endX=x + int(random(-(height/3),height/3));
    int endY=y-height;
    fill(255,0,0,opacity);
    stroke(255,0,0,opacity);

    bezier(x,y,x-height/2 ,y-height/3 ,x-height/4 ,y-2*height/3 ,endX,endY);
    bezier(x,y,x+height/2 ,y-height/3 ,x+height/4 ,y-2*height/3 ,endX,endY);
    fill(255,255,0,opacity);
    stroke(0,0,0,opacity);

    bezier(x,y,x-height/4 ,y-height/6 ,x-height/8 ,y-2*height/6 ,endX,endY+height/2);
    bezier(x,y,x+height/4 ,y-height/6 ,x+height/8 ,y-2*height/6 ,endX,endY+height/2);

    /*fill(0);
     stroke(0,0,0);
     
     bezier(x,y,x-height/6 ,y-height/9 ,x-height/12 ,y-2*height/9 ,x,endY+5*height/6);
     bezier(x,y,x+height/6 ,y-height/9 ,x+height/12 ,y-2*height/9 ,x,endY+6*height/6);*/
    if(height > 0 && random(1)<.7)
      height--;
  }
}

