
Comet[] marble = new Comet[20];
 
void setup()
{
  size(1000, 1000);
  smooth();
  for (int i=0; i<marble.length; i++)
  {
    float x = random(50, width-50);
    float y = random(50, height-50);
    float xv = random(8)-random(8);
    float yv = random(8)-random(8);
    marble[i] = new Comet(x, y, xv, yv); 
  }
}
void draw()
{
  //background(10,60,10,200); 
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  for (int i=0; i<marble.length; i++)
  {
    marble[i].display();
    marble[i].update();
  }
}
 
class Comet
{
  float xx, yy, xxv, yyv, a,b,c;

 
  Comet(float x, float y, float xv, float yv)
  {
    xx = x;
    yy = y;
    xxv = xv;
    yyv = yv;
      a=random(255);
    b=random(255);
      c=random(255);
    
  }
 
  void update()
  {
    xx+=xxv;
    yy+=yyv;
    //if ((xx>1000) || (xx<0)) {xxv=-xxv;} 
    //if ((yy>1000) || (yy<0)) {yyv=-yyv;} 
    float d=dist(xx,yy,500,500);
    float force=10/(d^2);
    float dir=atan2((500-yy),(500-xx));
    xxv+=cos(dir)*force;
    yyv+=sin(dir)*force;
          
    
  }
  void display()
  {
    //stroke(50);
    fill(a,b,c);
    ellipse(xx, yy, 20, 20);
  }
}






