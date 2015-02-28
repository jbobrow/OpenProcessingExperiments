
//Joe L. Rotating Cube CP1 mods 14-15
float x = 0;
float y = 0;
int size1 = 50;
int move1 = 300;
int move2 = 300;
void setup()
{
  size(600,600,P3D);
  

}
void draw()
{
  pointLight(77,206,27,0,0,200);
  cube();
  }
void cube()
{
  background(197);
  
 //pointLight
  translate(move1,move2,0);
  if(keyPressed==true && key=='1')
  {
    move1=move1-3;
  }
  if(keyPressed==true && key=='3')
  {
    move1=move1+3;
  }
  if(keyPressed==true && key=='2')
  {
    move2=move2+3;
  }
  if(keyPressed==true && key=='5')
  {
    move2=move2-3;
  }
  rotateX(x);
  if(keyPressed==true && key=='w')
  {
    x=x+.05;
  }
  if(keyPressed==true && key=='s')
  {
    x=x-.05;
  }
  rotateY(y);
  if(keyPressed==true && key=='a')
  {
    y=y-.05;
  }
  if(keyPressed==true && key=='d')
  {
    y=y+.05;
  }
  
  box(size1);
  if(keyPressed==true && key=='+')
  {
    size1=size1+1;
  }
  
  if(keyPressed==true && key=='-')
  {
    size1=size1-1;
 
  }
  
  
  noStroke();
  
  translate(-100,-100,0);
  sphere(50);
  translate(200,200,0);
  sphere(50);
  translate(-200,0,0);
  sphere(50);
  translate(200,-200,0);
  sphere(50);
  translate(0,100,0);
  sphere(50);
  translate(-200,0,0);
  sphere(50);
  translate(0,0,-100);
  sphere(50);
  translate(0,0,200);
  sphere(50);
  translate(100,-100,0);
  sphere(50);
  translate(100,100,0);
  sphere(50);
  translate(-100,100,0);
  sphere(50);
  translate(-100,0,0);
  sphere(50);
  translate(200,0,0);
  sphere(50);
  translate(-100,-100,0);
  sphere(50);
  translate(100,100,0);
  sphere(50);
  translate(-200,0,0);
  sphere(50);
  translate(0,-200,0);
  sphere(50);
  translate(200,0,0);
  sphere(50);
  translate(-100,0,-100);
  sphere(50);
  translate(0,0,-100);
  sphere(50);
  translate(-100,0,0);
  sphere(50);
  translate(200,0,0);
  sphere(50);
  translate(0,100,0);
  sphere(50);
  translate(-100,100,0);
  sphere(50);
  translate(-100,0,0);
  sphere(50);
  translate(200,0,0);
  sphere(50);
  translate(-100,-100,0);
  sphere(50);
  translate(0,100,100);
  sphere(50);
}
