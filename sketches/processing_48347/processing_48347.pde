
void setup()
{
  size(400,400);
  background(0);
  colorMode(HSB,100);
}

int x;


void draw()
{

  noLoop();
  for(int x=0;x <=width;x=x+10)
{
   
     int t=int(random(height));//height of the rectangles
     int c=int(random(100));//color
     int a=int(random(20,100));//alpha(transparency)
     int w=int(random(30));//width of the rectangles
 
     fill(c,100,100,a);
     rect(x,0,w,t); 
     rect(0,x,t,w);
     rect(x,height,w,-t);
     fill(c,100,100);
     rect(width,x,-t,w);
}
}

void mousePressed()
{
   //saveFrame("line composition-####.PNG");
   background(0);
   loop();
}

