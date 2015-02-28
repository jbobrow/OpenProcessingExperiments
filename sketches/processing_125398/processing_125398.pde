
int a = 180;
  int t = 80;
  int s = a;
  int d = 255;
  float mx = 0;
  float my = 0;
  int movex = 22;
  int movey = 10;
  int py;
  int c = 1;
  int b = 1;
void setup()
{
  size(800, 800);
  //background(245);
  frameRate(20);
  //smooth();
}
void draw()
{

  my = mouseY ;
  mx = mouseX;
  strokeWeight(3);
  background(245);
  
  for (int x = 0; x < width; x += 6){
    s +=b;
    if(s>255 || s<a){
      b = -b;
    } 
    d -=c;
    if(d>255 || d<a){
      c = -c;
    } 
    //top
    stroke(a,s,s,t);
    line(mx,my,x, 0);
    //right
    stroke(s,a+30,d,t);
    line(mx,my,width, x);
    //bottom
    stroke(s,a,d,t);
    
    line(mx,my,width-x, height);
    //left
    stroke(d,d,a,t);
    line(mx,my,0, height-x);
  }
  
}
