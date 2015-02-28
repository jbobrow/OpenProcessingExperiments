
void setup(){
  size(600,600);
  smooth(); 
 colorMode(HSB,100); 
}

void draw(){
  background(255,0,100);
  drawGuy(100,100, mouseX-10,mouseX-25, 20, 0, 1);
  drawGuy(300,100, 20,mouseY+50, mouseX+35, 10, 4);
  drawGuy(500,100, mouseX+30,20, 50, 20, 2);
  drawGuy(100,300, 70,25, 20,mouseX-30, 8);
  drawGuy(300,300, 5,10, mouseY +40, 90, 5.5);
  drawGuy(500,300, mouseY+10,25, 20, 50, 12);
  drawGuy(100,500, mouseY-20,mouseX+25, 7, 60, .2);
  drawGuy(300,500, 10,mouseX-25, 12, 70, 20);
  drawGuy(500,500, 35,25, 100, 80, 100);
}

void drawGuy(int x,int y,int xoff, int yoff,int h, int c,float w)
{
  stroke(c,100,100);
  strokeWeight(w);
  line(x,y-yoff,x,y+yoff);
  line(x-xoff,y+(yoff+10),x,y+yoff);
  line(x+xoff,y+(yoff+10),x,y+yoff);
  line(x-xoff,y-(yoff-15),x,y-(yoff-5));
  line(x+xoff,y-(yoff-15),x,y-(yoff-5));
  ellipse(x,y-(yoff+10),h,h);
}

