
Rect a = new Rect(60,1.5); 
Rect b = new Rect(60,2); 
Rect c = new Rect(60,3); 
Rect d = new Rect(60,3.5); 
Rect e = new Rect(60,4); 
void setup() 
{
  size(400, 400, P3D);
  frameRate(30);
  noStroke();
}

void draw() { 
  a.update(); 
  fill(#2327D8);
  b.update();
  fill (0);
  c.update();
  fill (50,36,104);
  d.update();
  fill (#23D84E);
  e.update();
  fill(#D8AE23);
  
} 
 
class Rect { 
  float ypos,speed; 
  Rect (float y, float s) {  
    ypos = y; 
    speed = s; 
  } 
  void update() { 
    //rotateZ (frameCount *.01);
    ypos += speed; 
    if (ypos > height) { 
      ypos = 0; 
    } 
    rect(175,ypos,50,ypos);
   rect(0, ypos, 50, ypos);
   rect(350, ypos, 50, ypos);
  } 
}

