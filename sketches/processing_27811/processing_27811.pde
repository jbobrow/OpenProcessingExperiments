

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioSample circ1;
AudioSample circ2;

int counter = 0;


int scx1 = -60;
int scy1 = -60;
int scx2 = -60;
int scy2 = -60;
int scx3 = -60;
int scy3 = -60;
int scx4 = -60;
int scy4 = -60;
int scx5 = -60;
int scy5 = -60;
int scx6 = -60;
int scy6 = -60;
int scx7 = -60;
int scy7 = -60;
int scx8 = -60;
int scy8 = -60;
int scx9 = -60;
int scy9 = -60;
int scx10 = -60;
int scy10 = -60;



int bcx1 = -60;
int bcy1 = -60;
int bcx2 = -60;
int bcy2 = -60;
int bcx3 = -60;
int bcy3 = -60;
int bcx4 = -60;
int bcy4 = -60;
int bcx5 = -60;
int bcy5 = -60;
int bcx6 = -60;
int bcy6 = -60;
int bcx7 = -60;
int bcy7 = -60;
int bcx8 = -60;
int bcy8 = -60;
int bcx9 = -60;
int bcy9 = -60;
int bcx10 = -60;
int bcy10 = -60;


float r = 1.0;
float angle = 0;
float speed = 0.07;

void setup()
{
size(500,500);
smooth();
ellipseMode(CENTER);



m = new Minim(this);
circ1 = m.loadSample("Circsmall.mp3");
circ2 = m.loadSample("Circbig.mp3");
}

void draw()
{
background(112,173,0);
stroke(255,234,0);
strokeWeight(5);
fill(0);
line(counter,-1,counter,501);

angle += speed;
float value = sin(angle);
float hulk = value * r;

counter = counter + 1;

if (counter > 501)
{
counter = 0;
}

noStroke();
fill(52,137,0);
ellipse(bcx1, bcy1, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx2, bcy2, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx3, bcy3, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx4, bcy4, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx5, bcy5, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx6, bcy6, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx7, bcy7, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx8, bcy8, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx9, bcy9, 60+(hulk*5), 60+(hulk*5));
ellipse(bcx10, bcy10, 60+(hulk*5), 60+(hulk*5));


fill(160,229,0);
ellipse(scx1, scy1, 20+(hulk*3), 20+(hulk*3));
ellipse(scx2, scy2, 20+(hulk*3), 20+(hulk*3));
ellipse(scx3, scy3, 20+(hulk*3), 20+(hulk*3));
ellipse(scx4, scy4, 20+(hulk*3), 20+(hulk*3));
ellipse(scx5, scy5, 20+(hulk*3), 20+(hulk*3));
ellipse(scx6, scy6, 20+(hulk*3), 20+(hulk*3));
ellipse(scx7, scy7, 20+(hulk*3), 20+(hulk*3));
ellipse(scx8, scy8, 20+(hulk*3), 20+(hulk*3));
ellipse(scx9, scy9, 20+(hulk*3), 20+(hulk*3));
ellipse(scx10, scy10, 20+(hulk*3), 20+(hulk*3));



if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1<0))
{scx1 = mouseX;
scy1 = mouseY;
mousePressed = false;} }

if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2<0))
{scx2 = mouseX;
scy2 = mouseY;
mousePressed = false;} }


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3<0))
{scx3 = mouseX;
scy3 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4<0))
{scx4 = mouseX;
scy4 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5<0))
{scx5 = mouseX;
scy5 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6<0))
{scx6 = mouseX;
scy6 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6>0) && (scx7<0))
{scx7 = mouseX;
scy7 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6>0) && (scx7>0) && (scx8<0))
{scx8 = mouseX;
scy8 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6>0) && (scx7>0) && (scx8>0) && (scx9<0))
{scx9 = mouseX;
scy9 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6>0) && (scx7>0) && (scx8>0) && (scx9>0) && (scx10<0))
{scx10 = mouseX;
scy10 = mouseY; 
mousePressed = false;}}

if (mousePressed == true)
{
if ((mouseButton == RIGHT) && (scx1>0) && (scx2>0) && (scx3>0) && (scx4>0) && (scx5>0) && (scx6>0) && (scx7>0) && (scx8>0) && (scx9>0) && (scx10>0))

{scx1 = -60;
scy1 = -60;
scx2 = -60;
scy2 = -60;
scx3 = -60;
scy3 = -60;
scx4 = -60;
scy4 = -60;
scx5 = -60;
scy5 = -60;
scx6 = -60;
scy6 = -60;
scx7 = -60;
scy7 = -60;
scx8 = -60;
scy8 = -60;
scx9 = -60;
scy9 = -60;
scx10 = -60;
scy10 = -60;
mousePressed = false;} }












if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1<0))
{bcx1 = mouseX;
bcy1 = mouseY;
mousePressed = false;} }

if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2<0))
{bcx2 = mouseX;
bcy2 = mouseY;
mousePressed = false;} }


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3<0))
{bcx3 = mouseX;
bcy3 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4<0))
{bcx4 = mouseX;
bcy4 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5<0))
{bcx5 = mouseX;
bcy5 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6<0))
{bcx6 = mouseX;
bcy6 = mouseY; 
mousePressed = false;}}

if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6>0) && (bcx7<0))
{bcx7 = mouseX;
bcy7 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6>0) && (bcx7>0) && (bcx8<0))
{bcx8 = mouseX;
bcy8 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6>0) && (bcx7>0) && (bcx8>0) && (bcx9<0))
{bcx9 = mouseX;
bcy9 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6>0) && (bcx7>0) && (bcx8>0) && (bcx9>0) && (bcx10<0))
{bcx10 = mouseX;
bcy10 = mouseY; 
mousePressed = false;}}


if (mousePressed == true)
{
if ((mouseButton == LEFT) && (bcx1>0) && (bcx2>0) && (bcx3>0) && (bcx4>0) && (bcx5>0) && (bcx6>0) && (bcx7>0) && (bcx8>0) && (bcx9>0) && (bcx10>0))

{bcx1 = -60;
bcy1 = -60;
bcx2 = -60;
bcy2 = -60;
bcx3 = -60;
bcy3 = -60;
bcx4 = -60;
bcy4 = -60;
bcx5 = -60;
bcy5 = -60;
bcx6 = -60;
bcy6 = -60;
bcx7 = -60;
bcy7 = -60;
bcx8 = -60;
bcy8 = -60;
bcx9 = -60;
bcy9 = -60;
bcx10 = -60;
bcy10 = -60;
mousePressed = false;} } 











if(scx1 == counter)
{circ1.trigger();}
if(scx2 == counter)
{circ1.trigger();}
if(scx3 == counter)
{circ1.trigger();}
if(scx4 == counter)
{circ1.trigger();}
if(scx5 == counter)
{circ1.trigger();}
if(scx6 == counter)
{circ1.trigger();}
if(scx7 == counter)
{circ1.trigger();}
if(scx8 == counter)
{circ1.trigger();}
if(scx9 == counter)
{circ1.trigger();}
if(scx10 == counter)
{circ1.trigger();}



if(counter == bcx1)
{circ2.trigger();}
if(counter == bcx2)
{circ2.trigger();}
if(counter == bcx3)
{circ2.trigger();}
if(counter == bcx4)
{circ2.trigger();}
if(counter == bcx5)
{circ2.trigger();}
if(counter == bcx6)
{circ2.trigger();}
if(counter == bcx7)
{circ2.trigger();}
if(counter == bcx8)
{circ2.trigger();}
if(counter == bcx9)
{circ2.trigger();}
if(counter == bcx10)
{circ2.trigger();}



}


void stop ()
{
circ1.close();
circ2.close();

m.stop();

super.stop();
} 

