
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;
int radius;
int c=125;
float r = 0;

void setup()
{
  radius = 20;
  size(600,600);
  background(0);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
}
  
void draw()
{
  if (xpos.size() % 7 == 0) {
    background(255);
  }
  if (xpos.size() % 7 != 0) {
    background(r);
  }
  for (int i = 1; i < xpos.size() ; i++)
  {   
    if (xpos.size() % 2 != 0) {     
      fill(155,255,200);
      if ((xpos.size()>=5)&&(xpos.size()<=10)) {
        fill(255);
      }
      if ((xpos.size()>=11)&&(xpos.size()<=15)) {
        fill(0,0,255);
      }
      ellipse(xpos.get(i),ypos.get(i),radius*2,radius*2);
      xpos.set(i,xpos.get(i)+xvelocity.get(i));
      ypos.set(i,ypos.get(i)+yvelocity.get(i));
     if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
      xpos.set(i,0);
    }
    if (ypos.get(i) > height)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0)
    {
      ypos.set(i,height);
    } 
    }
    else if (xpos.size() % 2 == 0) {
      rectMode(CENTER);
      fill(155,255,200);
      if ((xpos.size()>=5)&&(xpos.size()<=10)) {
        fill(255);
      }
      if ((xpos.size()>=11)&&(xpos.size()<=15)) {
        fill(0,0,255);
      }
      rect(xpos.get(i),ypos.get(i),radius*2,radius*2);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,ypos.get(i)+yvelocity.get(i));
    if (xpos.get(i) > width)
    {
      xpos.set(i,0);
    }
    if (xpos.get(i) < 0)
    {
      xpos.set(i,0);
    }
    if (ypos.get(i) > height)
    {
      ypos.set(i,0);
    }
    if (ypos.get(i) < 0)
    {
      ypos.set(i,height);
    }
  }
  if (xpos.size() > 2) {
    stroke(random(255),random(255),random(255));
    strokeWeight(random(1,6));
    line(xpos.get(i-1),ypos.get(i-1),xpos.get(i),ypos.get(i));
  }  
  if (xpos.size()>15) {
    setup();
    }
 
  }
}
void mouseClicked()
{
  
  xpos.add(mouseX);
  ypos.add(mouseY);
  xvelocity.add(0,1);
  yvelocity.add(0,0);
  xvelocity.add(1,-1);
  yvelocity.add(1,1);
  xvelocity.add(2,1);
  yvelocity.add(2,2);
  xvelocity.add(3,-1);
  yvelocity.add(3,3);
  xvelocity.add(4,-1);
  yvelocity.add(4,0);
  xvelocity.add(5,1);
  yvelocity.add(5,-1);
  xvelocity.add(6,1);
  yvelocity.add(6,-2);
  xvelocity.add(7,1);
  yvelocity.add(7,-3);
  xvelocity.add(xpos.size()-1,int(random(-5,5)));
  yvelocity.add(ypos.size()-1,int(random(-5,5)));  
}

void keyPressed() {
  if (key == 'r') {
    r = random(255);
  }
} 
