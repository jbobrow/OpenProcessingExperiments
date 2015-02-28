
float x,y,vx,vy,rad,drag;
float a = 0;
float b = 0;
float c, d;
float va,vb,gravity;

Particle p;
Particle[] ps;
//array...

Outside q;
Outside[] qs;

Inside r;
Inside[] rs;

void setup()
{
 size(800,800); 
 x = random(width);
 y = random(height);
 vx = random(-1,1);
 vy = random(-1,1);
 rad = random(5,25);
 drag = .97;
 ellipseMode(CENTER);
 
 // construct the class...
 p = new Particle();
 q = new Outside();
 r = new Inside();
 //construct the array
 qs = new Outside[3000];
 ps =new Particle[3000];
 rs =new Inside[3000];
 
 //fill the array with particle objects
 for(int i = 0; i < ps.length; i++)
 {
   ps[i] = new Particle();
 }
  for(int i = 0; i < qs.length; i++)
 {
   qs[i] = new Outside();
 }
 for(int i = 0; i < rs.length; i++)
 {
   rs[i] = new Inside();
 }
 noStroke();
 smooth();
}


void draw()
{
background(0);
x+=vx;
y+=vy;

vx+=noise(x*.01,y*.01,frameCount*.01)-.5;
vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
vx*=drag;
vy*=drag;

//keep the object inbound.
//left bound
if(x < 500)
{
  vx*=-1;
x = 500;
}

//right bound
if(x > 800)
{
  vx = vx*-1;
x = 800;
}

//top
if(y < 0)
{
  vy*=-1;
y = 0;
}

//bottom
if(y > height)
{
  vy*=-1;
y = height;
}

fill(255);

pushMatrix();
translate(x,y);
rect(0,0,rad,rad);
popMatrix();

q.updat();
p.update();
q.displa();
p.display();
r.upda();
r.displai();

 for(int i = 0; i < ps.length; i++)
 {
    ps[i].update();
    ps[i].display(); 
 }
 for(int i = 0; i < qs.length; i++)
 {
    qs[i].updat();
    qs[i].displa();
 }
  for(int i = 0; i < rs.length; i++)
 {
    rs[i].upda();
    rs[i].displai();
 }
}

//end of draw..
void mouseReleased()
{
 for(int i = 0; i < ps.length; i++)
 {
   ps[i].reset();
 }
 for(int i = 0; i < qs.length; i++)
 {
   qs[i].rese();
 }
 for(int i = 0; i < rs.length; i++)
 {
   rs[i].res();
 }
}




class Particle
{
  //local to the the class
float x,y,vx,vy,rad,drag;

//constructor function
//must match the class name and is case sensitive...
Particle()
{
 x = random(width);
 y = random(height);
 vx = random(-1,1);
 vy = random(-1,1);
 rad = random(5,25);
 drag = .97;
}

// a function in a class is call a 'memeber' of the class..
//variables delcared in a class are 'fields' of a class.

void update()
{
  x+=vx;
y+=vy;

vx+=noise(x*.01,y*.01,frameCount*.01)-.5;
vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
vx*=drag;
vy*=drag;

//keep the object inbound.
//left bound
if(x < 0)
{
  vx*=-1;
x = 0;
}

//right bound
if(x > 300)
{
  vx = vx*-1;
x = 300;
}

//top
if(y < 00)
{
  vy*=-1;
y = 00;
}

//bottom
if(y > height)
{
  vy*=-1;
y = height;
}
}
// end of the update member function of the class...
void display()
{
  fill(2,255,41,100);
pushMatrix();
translate(x,y);
rect(0,0,rad,rad);
popMatrix();
  }

void reset()
{
x = mouseX+random(-10,10);
y = mouseY+random(-10,10);

}
}





class Outside
{
  //local to the the class
float x,y,vx,vy,rad,drag;

//constructor function
//must match the class name and is case sensitive...
Outside()
{
 x = random(width);
 y = random(height);
 vx = random(-1,1);
 vy = random(-1,1);
 rad = random(5,25);
 drag = .97;
}

// a function in a class is call a 'memeber' of the class..
//variables delcared in a class are 'fields' of a class.

void updat()
{
  x+=vx;
y+=vy;

vx+=noise(x*.01,y*.01,frameCount*.01)-.5;
vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
vx*=drag;
vy*=drag;

//keep the object inbound.
//left bound
if(x < 500)
{
  vx*=-1;
x = 500;
}

//right bound
if(x > 800)
{
  vx = vx*-1;
x = 800;
}

//top
if(y < 00)
{
  vy*=-1;
y =00;
}

//bottom
if(y > height)
{
  vy*=-1;
y = height;
}

}
// end of the update member function of the class...
void displa()
{
  fill(255,255,255,100);
pushMatrix();
translate(x,y);
rect(0,0,rad,rad);
popMatrix();
  }

void rese()
{
x = mouseX+random(-10,10);
y = mouseY+random(-10,10);

}


}


class Inside
{
  //local to the the class
float x,y,vx,vy,rad,drag;

//constructor function
//must match the class name and is case sensitive...
Inside()
{
 x = random(width);
 y = random(height);
 vx = random(-1,1);
 vy = random(-1,1);
 rad = random(5,25);
 drag = .97;
}

// a function in a class is call a 'memeber' of the class..
//variables delcared in a class are 'fields' of a class.

void upda()
{
  x+=vx;
y+=vy;

vx+=noise(x*.01,y*.01,frameCount*.01)-.5;
vy+=noise(frameCount*.01,x*.01,y*.01)-.5;
vx*=drag;
vy*=drag;

//keep the object inbound.
//left bound
if(x < 300)
{
  vx*=-1;
x = 300;
}

//right bound
if(x > 500)
{
  vx = vx*-1;
x = 500;
}

//top
if(y < 00)
{
  vy*=-1;
y = 00;
}

//bottom
if(y > height)
{
  vy*=-1;
y = height;
}

}
// end of the update member function of the class...
void displai()
{
  fill(0,255,255,100);
pushMatrix();
translate(x,y);
rect(0,0,rad,rad);
popMatrix();
  }

void res()
{
x = mouseX+random(-10,10);
y = mouseY+random(-10,10);

}


}
