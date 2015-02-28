
void setup()
{
  size(500,500);//canvas size
}
void draw()
{
  background(255);
  if(mousePressed) {
    fill(0,0,255);
  }else{
    fill(450,40,70,80);
  }
  translate(width/2,height/2); //moves from top of graph to bottom

  float sc = map(mouseX, 0,width, 1.0,0.01); //movement around centeral axis
  float ro = map(mouseY, 0,height, 0, HALF_PI);
  
  for(int i=1; i<=50 ; i++)
  {
    stroke(i*5);//how the object moves
    scale(sc);//how the object moves
    rotate(ro); //how the object moves
    
float th = 2.39997;
int n = 4;
int c = 40; //size of big circle
int d = 12; //size of mini circles
float r;
float a;
float x;
float y;

  r =c*sqrt(i);
  a =i*th;
  x =r*cos(a);
  y =r*sin(a);
 ellipse(x,y,d,d);
   if(mousePressed) {
    fill(100,50,60,42);
  }else{
    fill(150,40,440,80); //ellipse color
  }


}

}
