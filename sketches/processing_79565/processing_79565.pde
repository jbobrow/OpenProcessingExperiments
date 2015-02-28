
int w=100;
color col=255;
float theta=0.1,t=0.1;
class Box
{
 float rx,ry,rz, targetx,targety,targetz;
 
Box()
{
 rx = 0; 
 ry = 0;
rz = 0;
targetx = 0;
targety = 0;
targetz = 0;
}

 

void update()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }
  
  void display()
{
  lights();
  stroke(255);
  pushMatrix();
  translate(10,35);
  directionalLight(0,102,255,1,0,0);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
} 
  
  
  void update2()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display2()
{
  stroke(255);
  pushMatrix();
  translate(22,-500);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(40,40,40);
  popMatrix();
} 


void update3()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display3()
{
  stroke(255);
  pushMatrix();
  translate(-100,500);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update4()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display4()
{
  stroke(255);
  pushMatrix();
  translate(500,-350);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update5()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display5()
{
  stroke(255);
  pushMatrix();
  translate(780,59);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update6()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display6()
{
  stroke(255);
  pushMatrix();
  translate(160,-350);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update7()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }
  
  void display7()
{
  stroke(255);
  pushMatrix();
  translate(-500,-230);
  directionalLight(65,113,25,1,255,25);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
} 
  
  
  void update8()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display8()
{
  stroke(255);
  pushMatrix();
  translate(800,800);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
} 


void update9()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display9()
{
  stroke(255);
  pushMatrix();
  translate(0,0);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update10()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display10()
{
  stroke(255);
  pushMatrix();
  translate(-800,-800);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update11()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display11()
{
  stroke(255);
  pushMatrix();
  translate(-400,-400);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update12()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display12()
{
  stroke(255);
  pushMatrix();
  translate(400,430);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update13()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }
  
  void display13()
{
  stroke(255);
  pushMatrix();
  translate(100,-170);
  directionalLight(65,113,25,1,255,25);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
} 
  
  
  void update14()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display14()
{
  stroke(255);
  pushMatrix();
  translate(-520,470);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(250,250,250);
  popMatrix();
} 


void update15()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display15()
{
  stroke(255);
  pushMatrix();
  translate(840,40);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(200,200,200);
  popMatrix();
}

void update16()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display16()
{
  stroke(255);
  pushMatrix();
  translate(590,-670);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(130,130,130);
  popMatrix();
}

void update17()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display17()
{
  stroke(255);
  pushMatrix();
  translate(-58,-40);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(200,200,200);
  popMatrix();
}

void update18()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display18()
{
  stroke(255);
  pushMatrix();
  translate(700,470);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update19()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display19()
{
  stroke(255);
  pushMatrix();
  translate(-80,270);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(100,100,100);
  popMatrix();
}

void update20()
{
  if(frameCount ` == 0)
  {
    int r_direction = int(random(0,6));
    switch(r_direction)
    {
     //0 = -x 90 degrees 
      case 0:
      targetx-=PI/2;
      break;
      case 1:
      targetx+=PI/2;
      break;
      
      case 2:
      targety-=PI/2;
      break;
      
      case 3:
      targety+=PI/2;
      break;
      
      case 4:
      targetz-=PI/2;
      break;
      
      case 5:
      targetz+=PI/2;
      break;
    }
  }
  rx+=  (targetx-rx)*0.05;
  ry+= (targety-ry)*0.05;
  rz+=  (targetz-rz)*0.05;
  }

void display20()
{
  stroke(255);
  pushMatrix();
  translate(-800,-270);
  rotateX(rx);
  rotateY(ry);
  rotateZ(rz);
  box(300,300,300);
  popMatrix();
}

} 
  
  


Box a;
Box b;
Box c;
Box d;
Box e;
Box f;

Box g;
Box h;
Box i;
Box j;
Box k;
Box l;

Box m;
Box n;
Box o;
Box p;
Box q;
Box r;
Box s;
Box u;

void setup()  //individually creates boxes that rotate in different directions
{
  size(800,800,P3D);
  background(0);
  fill(random(255),random(255),random(255),160);
  stroke(255,100,30);
a = new Box();
b = new Box();
c = new Box();
d = new Box();
e = new Box();
f = new Box();

g = new Box();
h = new Box();
i = new Box();
j = new Box();
k = new Box();
l = new Box();

m = new Box();
n = new Box();
o = new Box();
p = new Box();
q = new Box();
r = new Box();
s = new Box();
u = new Box();
}

void draw()  //draws the rotated boxes
{
  stroke(0,0,255);
  background(0);
   translate(width/2,height/2,-1000);
   //biggers
  rotateX(t);
  for(float x=0; x<2*PI; x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(600,0,0);
    box(map(200,0,height,1,280));
    popMatrix();
  }
   rotateY(PI);
    for(float x=0;x<2*PI; x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(600,0,0);
    box(map(200,0,height,1,280));
    popMatrix();
  }
 
  //smalls
  stroke(2,198,245);
    rotateX(t);
  for(float x=0;x<3*PI;x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(500,0,0);
    box(map(100,0,height,1,100));
    popMatrix();
  }
   rotateY(PI);
    for(float x=0;x<3*PI;x+=PI/int(map(100,0,width,1,200)))
  {
    rotateY(theta);
    rotate(x*2);
    pushMatrix();
    translate(500,0,0);
    box(map(100,0,height,1,100));
    popMatrix();
  }
  
a.update();
a.display();
b.update2();
b.display2();
c.update3();
c.display3();
d.update4();
d.display4();
e.update5();
e.display5();
f.update6();
f.display6();

g.update7();
g.display7();
h.update8();
h.display8();
i.update9();
i.display9();
j.update10();
j.display10();
k.update11();
k.display11();
l.update12();
l.display12();

m.update13();
m.display13();
n.update14();
n.display14();
o.update15();
o.display15();
p.update16();
p.display16();
q.update17();
q.display17();
r.update18();
r.display18();
s.update19();
s.display19();
u.update20();
u.display20();

  theta+=0.008;
  t+=0.01;
}
