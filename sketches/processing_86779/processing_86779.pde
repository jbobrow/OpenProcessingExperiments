
Conos [] c;

void setup()
{
  size(470,470);
  fill(255,200,8);
  smooth();
  stroke(240);
  c = new Conos [1000];
  for(int i=0; i<1000; i++)
  {
    c [i] = new Conos(random(-width,width*2),random(-height,height*2),(int)random(1,10));
 /* 
    c[i].x = random(-width,width*2);
    c[i].y = random(-height,height*2);
    c[i].d = (int)random(10,90);
    c[i].v = (int)random(1,10);
*/
    c[i].colour=255;
    c[i].borde=#0000ff;
    
    
    if(i<50){
       c[i].colour=#ff0000; 
    }else{
      c[i].colour=255;
    }
  }
    c[88].colour=#00ff00;
}

void draw()
{
  background(0);
  for(int i=0; i<c.length; i++)
  {
    c[i].move();
    c[i].show();
  }
}

class Conos
{
  float x, y;
  int d, v;
  int colour;
  int borde;
  
  void show()
  {
    fill(colour,250);
    stroke(borde);
    triangle(5,55,26,10,55,55);
    /* (int)random(10,110,55,20,110,110),*/
  }
 
  void move()
  {
    x += ( mouseX - width/2 ) * 0.01 * v;
   y += ( mouseY - height/2 ) * 0.01 * v; 
  }
  Conos(float xPos, float yPos, int vel){
    x = xPos;
    y = yPos;
    v = vel;
  }
}

