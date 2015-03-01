
int num = 500;
Ball[] ball_array = new Ball[num];
 
class Ball
{
  
 float x,y;
 float vx,vy;
 float diam;
 float drag;
 
Ball()
{
x = random(width);
y = random(height);
diam = 5;
drag = .9;
vy = random(-5,5);
vx = random(-5,5);
 
}
 
void update()
{
x+=vx*drag;
y+=vy*drag;
 
}
 
void display()
{
pushMatrix();
fill(255);
ellipse(x,y,diam,diam);
translate(x,y);
popMatrix();
}
 

}
 
 
 
void setup()
{
size(500,500);
 
for(int i=0; i<num; i++)
  {
    ball_array[i] = new Ball(); 
  }
}
 
 
void draw()
{
background(0);
 
  for(int i=0; i<num; i++)
  {
   ball_array[i].update();
   ball_array[i].display();
      
  }
  
  
for(int i = 0; i<num; i++)
{
 for(int j = i+1; j<num; j++)
 {
   
  float x3 = ball_array[i].x;
  float y3 = ball_array[i].y;
  float x4 = ball_array[j].x;
  float y4 = ball_array[j].y;

   
  if(dist(x3,y3,x4,y4) < 40)
  {
    stroke(110,245,44);
    line (x3,y3,x4,y4);
  }
  if(dist(x3,y3,x4,y4) < 60)
  {
    stroke(209,20,164,100);
    line (x3,y3,x4,y4);
  }
  
  if(dist(x3,y3,x4,y4) < 80)
  {
    stroke(45,88,237,80);
    line (x3,y3,x4,y4);
  }
 
 }
 
}

noFill();
stroke(0);
ellipse((width/2),(height/2),495,495);
ellipse((width/2),(height/2),496,496);
ellipse((width/2),(height/2),497,497);
ellipse((width/2),(height/2),498,498);
ellipse((width/2),(height/2),499,499);
ellipse((width/2),(height/2),501,501);
ellipse((width/2),(height/2),502,502);
ellipse((width/2),(height/2),503,503);
ellipse((width/2),(height/2),504,504);
ellipse((width/2),(height/2),505,505);
ellipse((width/2),(height/2),506,506);
ellipse((width/2),(height/2),507,507);
ellipse((width/2),(height/2),508,508);
ellipse((width/2),(height/2),509,509);
ellipse((width/2),(height/2),510,510);
ellipse((width/2),(height/2),511,511);
ellipse((width/2),(height/2),512,512);
ellipse((width/2),(height/2),513,513);
ellipse((width/2),(height/2),514,514);
ellipse((width/2),(height/2),515,515);
ellipse((width/2),(height/2),516,516);
ellipse((width/2),(height/2),517,517);
}

