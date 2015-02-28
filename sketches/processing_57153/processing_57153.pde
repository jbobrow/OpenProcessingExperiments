
class Ball{
  int x=width/2;
  int y=450;
  int ySpeed=30;
  int xSpeed=0;
  double c=0;
  boolean d=false;
  Ball(int x, int y){
    this.x=x;
    this.y=y;
  
    xSpeed=(int)random(8)-4;
    ySpeed=(int)random(10)+20;  
  }
  void draw()
  { 
     y-=ySpeed;
     ySpeed-=1;
     x+=xSpeed;
     
     c+=2.5;
     
     if(ySpeed>0)
       fill(0,255,0);
     else
       fill(255,0,0);
     fill(0,0,(int)c+150); //overrides red n green
     
     int rWidth=(int)c/10; //normally 10  
     rect(x-rWidth/2,y-rWidth/2,rWidth,rWidth);
     if(y>height||d==true)
     { 
         score+=10; 
         balls.remove(this);
     }
     //fill(255,255,255);
     //text(""+c,x,y);
  }
}


