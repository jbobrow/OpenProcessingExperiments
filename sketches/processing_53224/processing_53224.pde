
/*
  Balls
  Author: Yen-Chia Hsu, CoDe Lab, Carnegie Mellon University, U.S.A.
*/

int bColor = 0; //background color
int screenWL = 600; //screen width and length
int numberB = 25; //number of balls
int alphaB = 200; //alpha value of the ball
float v_threshold_H = 6;
float v_threshold_L = 0.5;
Ball[] ball = new Ball[numberB];

void setup()
{
  size(600,600);
  background(bColor,bColor,bColor);
  smooth();
  noStroke();
  //initialize balls
  for(int i=0; i<numberB; i++)
  {
    int dia = int(random(30,200));
    ball[i] = new Ball(random(0+dia,screenWL-dia),random(0+dia,screenWL-dia),dia,random(-5,5),random(-5,5),alphaB,int(random(80,255)),int(random(80,255)),int(random(80,255)));
  }
  //check if balls overlap
  for(int i=0; i<numberB; i++)
  {
    for(int j=i; j<numberB; j++)
    {
      if(i!=j)
      {
        float distance = dist(ball[i].x,ball[i].y,ball[j].x,ball[j].y);
        if(distance<=(ball[i].d+ball[j].d)/2+1)
        {
          ball[i].d = floor(distance/2);
          ball[j].d = floor(distance/2);
        }
      }
    }
  }
}

void draw()
{
  //clean screen
  background(bColor,bColor,bColor);
  //collision
  for(int i=0; i<numberB; i++)
  {
    for(int j=i; j<numberB; j++)
    {
      if(i!=j)
      {
        float distance = dist(ball[i].x,ball[i].y,ball[j].x,ball[j].y);
        if(distance<=(ball[i].d+ball[j].d)/2)
        {
          //start vector
          PVector vi_s = new PVector(ball[i].vx, ball[i].vy);
          PVector vj_s = new PVector(ball[j].vx, ball[j].vy);
          
          //calculate the unit vector between two center points
          PVector c1 = new PVector(ball[j].x-ball[i].x, ball[j].y-ball[i].y);
          c1.normalize();
          
          //calculate the perpendicular vector of c1
          PVector c2 = new PVector(c1.y, -1*c1.x);
          
          //calculate the final vector after collision projected on c1
          //assume the mass is in proportion to the diameter
          float coef_i1 = (ball[i].d-ball[j].d)/(ball[i].d+ball[j].d);
          float coef_i2 = (2*ball[j].d)/(ball[i].d+ball[j].d);
          float coef_j1 = (2*ball[i].d)/(ball[i].d+ball[j].d);
          float coef_j2 = (ball[j].d-ball[i].d)/(ball[i].d+ball[j].d);       
          PVector vi_f_c1 = new PVector(coef_i1*vi_s.dot(c1)*c1.x+coef_i2*vj_s.dot(c1)*c1.x, coef_i1*vi_s.dot(c1)*c1.y+coef_i2*vj_s.dot(c1)*c1.y);
          PVector vj_f_c1 = new PVector(coef_j1*vi_s.dot(c1)*c1.x+coef_j2*vj_s.dot(c1)*c1.x, coef_j1*vi_s.dot(c1)*c1.y+coef_j2*vj_s.dot(c1)*c1.y);
          
          //calculate the final vector after collision projected on c2
          PVector vi_f_c2 = new PVector(vi_s.dot(c2)*c1.x, vi_s.dot(c2)*c1.y);
          PVector vj_f_c2 = new PVector(vj_s.dot(c2)*c1.x, vj_s.dot(c2)*c1.y);
          
          //calculate the final vector after collision
          PVector vi_f = new PVector(vi_f_c1.x+vi_f_c2.x, vi_f_c1.y+vi_f_c2.y);
          PVector vj_f = new PVector(vj_f_c1.x+vj_f_c2.x, vj_f_c1.y+vj_f_c2.y);
          
          //adjust velocity according to thresholds
          if(vi_f.x>v_threshold_H) vi_f.x=v_threshold_H;
          else if(vi_f.x<v_threshold_H*-1) vi_f.x=v_threshold_H*-1;
          if(vi_f.y>v_threshold_H) vi_f.y=v_threshold_H;
          else if(vi_f.y<v_threshold_H*-1) vi_f.y=v_threshold_H*-1;
          if(vj_f.x>v_threshold_H) vj_f.x=v_threshold_H;
          else if(vj_f.x<v_threshold_H*-1) vj_f.x=v_threshold_H*-1;
          if(vj_f.y>v_threshold_H) vj_f.y=v_threshold_H;
          else if(vj_f.y<v_threshold_H*-1) vj_f.y=v_threshold_H*-1;          
          if(vi_f.x<v_threshold_L && vi_f.x>0) vi_f.x=v_threshold_L;
          else if(vi_f.x>v_threshold_L*-1 && vi_f.x<0) vi_f.x=v_threshold_L*-1;
          if(vi_f.y<v_threshold_L && vi_f.y>0) vi_f.y=v_threshold_L;
          else if(vi_f.y>v_threshold_L*-1 && vi_f.y<0) vi_f.y=v_threshold_L*-1;
          if(vj_f.x<v_threshold_L && vj_f.x>0) vj_f.x=v_threshold_L;
          else if(vj_f.x>v_threshold_L*-1 && vj_f.x<0) vj_f.x=v_threshold_L*-1;
          if(vj_f.y<v_threshold_L && vj_f.y>0) vj_f.y=v_threshold_L;
          else if(vj_f.y>v_threshold_L*-1 && vj_f.y<0) vj_f.y=v_threshold_L*-1;

          //update the velocity          
          ball[i].vx = vi_f.x;
          ball[i].vy = vi_f.y;
          ball[j].vx = vj_f.x;
          ball[j].vy = vj_f.y;
          
          //pull out the balls to avoid overlaping
          float pullMag = abs(distance-(ball[i].d+ball[j].d)/2);
          ball[i].x -= pullMag*c1.x;
          ball[i].y -= pullMag*c1.y;
          ball[j].x += pullMag*c1.y;
          ball[j].y += pullMag*c1.y;
        }
      }
    }
  }
  //balls
  for(int i=0; i<numberB; i++)
  {
    //reset
    //reach boundary
    float nextX = ball[i].x+(ball[i].vx/abs(ball[i].vx))*ball[i].d/2;
    float nextY = ball[i].y+(ball[i].vy/abs(ball[i].vy))*ball[i].d/2;
    if(nextX>=screenWL || nextX<=0) ball[i].vx *= -1;
    if(nextY>=screenWL || nextY<=0) ball[i].vy *= -1;
    //update
    ball[i].x += ball[i].vx;
    ball[i].y += ball[i].vy;
    //render
    fill(ball[i].r,ball[i].g,ball[i].b,ball[i].a);
    ellipse(ball[i].x,ball[i].y,ball[i].d,ball[i].d);
  }  
}

class Ball
{
  float x,y,d,vx,vy;
  int a,r,g,b;
  //x: center X coordinate
  //y: center Y coordinate
  //d: diameter
  //vx: velocity of ball in x-axis
  //vy: velocity of ball in y-axis
  //a: ball color alpha
  //r: ball color R
  //g: ball color G
  //b: ball color B
  Ball (float x_,float y_,float d_,float vx_,float vy_,int a_,int r_,int g_,int b_)
  { x=x_; y=y_; d=d_; vx=vx_; vy=vy_; a=a_; r=r_; g=g_; b=g_; }
}               
