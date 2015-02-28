
//Jordan Leung, 4,5, Computer Programming

void setup()
{
size(600,600,P3D);
frameRate(10);
}
int p=51;
void draw()
{
 mouseDragged();
  background(0);
 int num=1;
  lights();
  while(num<p)
  {
  float x= .001;
  float y= .001;
 int siz= int (random(5,50));
  int transX= int (random(0,600));
  int transY= int (random(0,600));
  int col= int (random(0,255));
  int coll= int (random(0,255));
  noStroke();
  translate(transX,transY,0);
 
  fill(col,255-col,255-col,coll);
  sphere(siz);
  
  
  translate(-transX,-transY,0); 
  translate(transY,transX,0);
  rotateX(y);
  rotateY(x);
  fill(random(255),random(255),random(255),coll);
  box(50);
  
  rotateY(-x);
  rotateY(-y);
  translate(-transY,-transX,0);
  num++;
  x=x+.01;
  y=y+.01;

  }
  
}

void keyPressed()
{
  if(key=='w')
  {
    p=p+1;
  }
  if(key=='s')
  {
    p= p-1;
  }
  if(p<0)
  {
    p=0;
  }
}
