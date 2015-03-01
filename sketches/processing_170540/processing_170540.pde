
float time = 0.0;
float increment = 0.01;
int w = 32;
int h = 24;
Box[][] boxes;

void setup()
{
  size(640,480);
  boxes = new Box[w][h];
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      boxes[x][y] = new Box(x,y);
    }
  }
}

void draw()
{
  update();
  background(200);
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      boxes[x][y].display();
    }
  }
}

void update()
{
  time+=increment;
  for(int x=0;x<w;x++){
    for(int y=0;y<h;y++){
      boxes[x][y].update(time);
    }
  }
}



class Box
{
  int px, py;
  float nx, ny;
  int w = 20;
  
 Box(int xm, int ym){
  px = (xm*w);
  py = (ym*w);
  nx = 0.0;
  ny = 0.0;
 }
 
 void display(){
   rect(px,py,nx*w,ny*w);
 }
 
 void update(float t)
 {
   nx = noise(t+px);
   ny = noise(t+py);
 }
}
