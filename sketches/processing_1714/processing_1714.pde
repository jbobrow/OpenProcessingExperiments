
boolean generate=false;
int flow=14;

void setup() {
  size(512,512);
  background(0);
  set(width/2,0,~0);
  noStroke();
  frameRate(10);
}

void draw() {
  if(generate) 
  {
    for(int i=0; i<flow; i++)
    {
      set((int)random(width/2-flow,width/2+flow),2,color(255));
    }
  }
  if(mousePressed && mouseButton==LEFT)
  {
    fill(255,0,0);
    rect(mouseX-10,mouseY-10,20,20);
  }
  if(mousePressed && mouseButton==RIGHT)
  {
    fill(0);
    rect(mouseX-10,mouseY-10,20,20);
  }
  for(int x=0; x<width; x++)
  {
    set(x,0,color(0));
  }
  for(int y=0; y<width; y++)
  {
    set(0,y,color(255));
  }
  for (int x=width+2; x>0; x--) {
    for(int y=height+2; y>0; y--)
    {
      if (color(get(x,y))==color(255)) 
      {
        if (color(get(x,y+1))==color(0)) {
          set(x,y+1,color(255)); 
          set(x,y,color(0));
        }
        else if (color(get(x-1,y+1))==color(0)) {
          set(x-1,y+1,color(255)); 
          set(x,y,color(0));
        }
        else if (color(get(x+1,y+1))==color(0)) {
          set(x+1,y+1,color(255)); 
          set(x,y,color(0));
        } 
      }        
    }
  }
}

void keyPressed()
{
  if(key=='g') generate=!generate;
  if(keyCode==UP) { 
    flow++; 
  }
  if(keyCode==DOWN) { 
    flow--; 
  }
}








