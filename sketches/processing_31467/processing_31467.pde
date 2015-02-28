
CT _t1;
int Y_AXIS = 1;
int X_AXIS = 2;
float xgive=70;
float ygive=70;
float deptlimit;
int vis;
void setup()
{
  vis =-1;
  size(450,450);
  _t1 = new CT(color(random(100,255),random(100,255),random(100,255),20),width/2,height/2,100);
  color c1 = color(47, 176, 91);
  color c2 = color(10, 45, 255);
  setGradient(0, 0, width, height, c1, c2, Y_AXIS);
  deptlimit = 80;
}
void draw()
{
  if (vis ==1)
  {
     background(0,0,0); 
  }
  _t1.update();
  _t1.display();
}

class CT
{
  float x;
  float y;
  float angle;
  color c;
  float r;
  float R; 
  float i;
  boolean visable;
  boolean createchild;
  CT rec1,rec2,rec3;
  CT(color tempC, float tempX, float tempY,float tempR)
  {
    c=tempC;
    x=tempX;
    y=tempY;
    r=tempR;
    R=r;
    angle=0;
    i=0;
    visable=false;
    createchild = (r>deptlimit &&  x<width+xgive  && x>0-xgive && y<height+ygive  && y>0-ygive);
    if (createchild)
    {
      rec1 = new CT(color(random(180,190),random(180,185),98,20),x+cos(PI/4)*(3*R),y+sin(PI/4)*(3*R),r-10);;
      rec2 = new CT(color(random(47,51),random(176,180),91,20),x+cos(PI/4+2*PI/3)*(3*R),y+sin(PI/4+2*PI/3)*(3*R),R-10);;
      rec3 = new CT(color(186,random(100,104),random(49,53),20),x+cos(PI/4+4*PI/3)*(3*R),y+sin(PI/4+4*PI/3)*(3*R),R-10);;
    }
  }
  void display()
  {
    noFill();
    strokeWeight(3);
    if (i>r*2-1 && createchild)
    {
      noFill(); 
      rec1.display();
       rec2.display();
       rec3.display();
       
    }
    if (i>r*2-1 && createchild)
    {
       rec1.update();
       rec2.update();
       rec3.update();
    }
    noFill();
    stroke(205,208,0,50);
    if (vis ==1)
    {
      stroke(205,208,0,80);
    }
    bezier(x, y, x+cos(angle)*r,y+sin(angle)*r, x+cos(angle+4*PI/3)*r,y+sin(angle+4*PI/3)*r, x+cos(PI/4)*(R+i),y+sin(PI/4)*(R+i));
    bezier(x, y, x+cos(angle+2*PI/3)*r,y+sin(angle+2*PI/3)*r, x+cos(angle)*r,y+sin(angle)*r, x+cos(PI/4+2*PI/3)*(R+i),y+sin(PI/4+2*PI/3)*(R+i));
    bezier(x, y, x+cos(angle+4*PI/3)*r,y+sin(angle+4*PI/3)*r, x+cos(angle+2*PI/3)*r,y+sin(angle+2*PI/3)*r, x+cos(PI/4+4*PI/3)*(R+i),y+sin(PI/4+4*PI/3)*(R+i));
    fill(c);
    strokeWeight(0);
    stroke(0,0,0,50);
    triangle(x+cos(angle)*r,y+sin(angle)*r,x+cos(angle+2*PI/3)*r,y+sin(angle+2*PI/3)*r,x+cos(angle+4*PI/3)*r,y+sin(angle+4*PI/3)*r);
    
}
  void update()
  {
    angle=angle+2*PI/180;
    if (i<R*2)
    {
     i=i+2;
    }
    visable=true;
    if (vis==1)
    {
    r=constrain(r+random(-5,5),R-7,R+7);
    }
    else
    {
      r=R;
    }
  }
}

void mouseClicked()
{
  vis=vis*-1;
  if (vis==-1)
  {
   color c1 = color(47, 176, 91);
  color c2 = color(10, 45, 255);
  setGradient(0, 0, width, height, c1, c2, Y_AXIS); 
  }
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
  // calculate differences between color components 
  float deltaR = red(c2)-red(c1);
  float deltaG = green(c2)-green(c1);
  float deltaB = blue(c2)-blue(c1);

  // choose axis
  if(axis == Y_AXIS){
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h)) 
          );
        set(i, j, c);
      }
    }  
  } 
 
  else if(axis == X_AXIS){
    // column 
    for (int i=y; i<=(y+h); i++){
      // row
      for (int j = x; j<=(x+w); j++){
        color c = color(
        (red(c1)+(j-x)*(deltaR/h)),
        (green(c1)+(j-x)*(deltaG/h)),
        (blue(c1)+(j-x)*(deltaB/h)) 
          );
        set(j, i, c);
      }
    }  
  }
}
  void reset()
  {
   // Finish the movie if space bar is pressed
    color c1 = color(47, 176, 91);
    color c2 = color(10, 45, 255);
    setGradient(0, 0, width, height, c1, c2, Y_AXIS);
    _t1 = new CT(color(random(100,255),random(100,255),random(100,255),20),width/2,height/2,100); 
  }
  void keyPressed() {
  if (key == ' ') {
    reset();
  }
  if (key == '+')
  {
    deptlimit=(deptlimit/10+1)*10;
    CT tempt1=_t1;
    reset();
    //_t1=tempt1;
  }
  if (key == '-')
  {
    deptlimit=(deptlimit/10-1)*10;
    CT tempt1=_t1;
    reset();
    //_t1=tempt1;
  }
  }



