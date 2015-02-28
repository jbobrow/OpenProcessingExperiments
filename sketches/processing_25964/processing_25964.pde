
void setup()
{
  
size(400,400);
noStroke();
frameRate(60);

}

int centerx,centery,ax,ay,bx,by,cx,cy,pipsX,pipsY;
int triangle_scale=height/2;
int pip_scale=width/3;
boolean scale_up=false;


void draw()
{
  centerx= (width/2);
  centery=(height/3);
  ax=centerx;
  bx=centerx-triangle_scale;
  cx=centerx+triangle_scale;
  ay=centery-triangle_scale;
  by=centery+triangle_scale;
  cy=by;
  pipsX=centerx+pip_scale;
  pipsY=centery-pip_scale/2;
 

background(random(255),random(2),random(122));
fill(random(150),random(122),random(244));
triangle(ax^3/3*int(random(3)),ay,mouseX,mouseY*int(random(4)),cx,cy^2*int(random(3)));

if (scale_up) {triangle_scale=triangle_scale+2;}
else {triangle_scale=triangle_scale-2;}
if (triangle_scale<0) {scale_up=true;}
if (triangle_scale>centery+60) {scale_up=false;}
fill(triangle_scale);


ellipse(pipsX,ay,50,50);

fill(150,222,30);
ellipse(bx,pipsY,20,20);

fill(200,122,50);
ellipse(cx,pipsY,10,10);


ellipse(pipsY,cy,2,2);

fill(150,222,30);
ellipse(ax,pipsX+40,40,40);

fill(200,22,50);
ellipse(bx,pipsX^2/2+40,15,15);

fill(255,22,20);
ellipse(pipsY^2/2+40+int(random(10)),cx,15,15);

fill(220,22,20);
ellipse(pipsY^3/2+40,cx,1,1);

fill(220,112,150);
ellipse(pipsY^5/2+40,cx/2,30,30);

if (scale_up) {pip_scale=pip_scale+int(random(10))/2;}
else {pip_scale=pip_scale-int(random(2));}
if (pip_scale<0) {scale_up=true;}
if (pip_scale>pipsY) {scale_up=false;}
fill(pip_scale);   
ellipse(pipsX+random(20),pipsY-random(20),9,random(20));
}

