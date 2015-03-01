
int counter;
int x=20;
int dx= 5;
int y=20;
int dy=4;
int u=20;
int v=20;
int du=4;
int dv=8;

void setup() {  //setup function called initially, only once
  size(400,400);
}

void draw() {  //draw function loops 
     fill(255,150,0)   
     ellipse(x,y,20,20)    
     x = x + dx;
     y=y+dy;
     fill(0,255,150)
     ellipse(u,v,20,20)
     u=u+du;
     v=v+dv;
if (x>400) {
    dx=-5;
    }
if (x<0) {
    dx=5;
    }
if (y>400) 
{dy= -4;
}

if (y<0) 
{dy=4;
}
if (v>400){dv=-5}
if (v<0){dv=5}
if (u>400){du=-4}
if (u<0) {du=4}

}
