
void setup(){
   size(601,601);
   rectMode(CENTER);
   background(0);
}
int objeto1 = 0;
int cordenada1 = 0;
int cordenada2= 0;
int bal1x = 0;
int bal1y = 0;
int bal2x = 0;
int bal2y = 0;
int bal3x = 0;
int bal3y = 0;

int qd1 = 0;
int qd2 = 0;
int wd1 = 0;
int wd2 = 0;
int ed1 = 0;
int ed2 = 0;

int at1 = 0;
int at2 = 0;
int at3 = 0;

int x = 1;

int c1 = 0;
int v1 = 0;
int c2 = 0;
int v2 = 0;
int c3 = 0;
int v3 = 0;

int h = 0;
int h2 = 0;

int j = 0;
int j2 = 0;

int k = 0;
int k2 = 0;

int l = 0;
int l2 = 0;

int a1 = 0;
int v1 = 1;

int a2 = 0;
int v2 = 1;

int a3 = 0;
int v3 = 1;

int a4 = 0;
int v4 = 1;

int tempo = 0;
void draw(){
if(tempo > 0)
{
background(0);
textSize(20);
 text("AGUARDE.",251,101);
}
if(tempo > 200)
{
background(0);
textSize(20);
 text("AGUARDE..",251,101);
}
if(tempo > 400)
{
background(0);
textSize(20);
 text("AGUARDE...",251,101);
}
v1 = v1 - 1;
v2 = v2 - 1;
v3 = v3 + 1;
v4 = v4 + 1;
 
  a1 = -nv + 901 + v1;
 rect(a1,0,50,50);
 
 a2 = -nv + 1101 + v2;
 rect(0,a2,50,50);
 
 a3 = nv -1301 + v3;
 rect(a3,0,50,50);
 
 a4 = nv -1501 + v4;
 rect(0,a4,50,50);

 if(a1 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v1 = 1;
nv = nv + 10;
}

if(a2 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v2 = 1;
nv = nv + 10;
}

if(a3 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v3 = 1;
nv = nv + 10;
}

if(a4 == b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v4 = 1;
nv = nv + 10;
}

 if(a1 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v1 = 1;
nv = nv + 10;
}

if(a2 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v2 = 1;
nv = nv + 10;
}

if(a3 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v3 = 1;
nv = nv + 10;
}

if(a4 + 1== b)
{
rect(0,0,1000,1000);
bac = bac + 50;
v4 = 1;
nv = nv + 10;
}
if(tempo > 600)
{
background(0);
}
translate(301,301);

if(c1 < cordenada1)
{
  c1 = c1 +1;
}
if(c1 > cordenada1)
{
  c1 = c1 -1;
}
if(v1 < cordenada2)
{
  v1 = v1 +1;
}

if(v1 > cordenada2)
{
  v1 = v1 -1;
}

if(c2 < cordenada1)
{
  c2 = c2 +1;
}
if(c2 > cordenada1)
{
  c2 = c2 -1;
}
if(v2 < cordenada2)
{
  v2 = v2 +1;
}

if(v2 > cordenada2)
{
  v2 = v2 -1;
}

if(c3 < cordenada1)
{
  c3 = c3 +1;
}
if(c3 > cordenada1)
{
  c3 = c3 -1;
}
if(v3 < cordenada2)
{
  v3 = v3 +1;
}

if(v3 > cordenada2)
{
  v3 = v3 -1;
}

 if (keyPressed) {
    if (key == 'a' || key == 'A') {
cordenada1 = cordenada1 - 1;
    }
 }

 if (keyPressed) {
    if (key == 'w' || key == 'W') {
cordenada2 = cordenada2 - 1;
    }
 }

 if (keyPressed) {
    if (key == 'd' || key == 'D') {
cordenada1 = cordenada1 + 1;
    }
 }
 
  if (keyPressed) {
    if (key == 's' || key == 'S') {
cordenada2 = cordenada2 + 1;
    }
    
  }
  if (keyPressed) {
    if (key == 'r' || key == 'R') {
    x = 1;
    at1 = 0;
    at2 = 0;
    at3 = 0;
    
qd1 = 0;
qd2 = 0;
wd1 = 0;
wd2 = 0;
ed1 = 0;
ed2 = 0;
   }
  }
  if (keyPressed) {
    if (key == 'l' || key == 'L') {
    x = 2;
    at1 = 0;
    at2 = 0;
    at3 = 0;
    
qd1 = 0;
qd2 = 0;
wd1 = 0;
wd2 = 0;
ed1 = 0;
ed2 = 0;
   }
  }
  if (keyPressed) {
    if (key == 'k' || key == 'K') {
    x = 3;
    at1 = 0;
    at2 = 0;
    at3 = 0;
    
qd1 = 0;
qd2 = 0;
wd1 = 0;
wd2 = 0;
ed1 = 0;
ed2 = 0;
   }
  }
  if (keyPressed) {
    if (key == 'o' || key == 'O') {
    x = 4;
    
    at1 = 0;
    at2 = 0;
    at3 = 0;
    
qd1 = 0;
qd2 = 0;
wd1 = 0;
wd2 = 0;
ed1 = 0;
ed2 = 0;
   }
  }

  if(at1 == 1)
  {
  
    if(c1 < cordenada1)
{
  c1 = c1 -1;
}
if(c1 > cordenada1)
{
  c1 = c1 +1;
}
if(v1 < cordenada2)
{
  v1 = v1 -1;
}
if(v1 > cordenada2)
{
  v1 = v1 +1;
}

    
  rect(bal1x,bal1y,10,10);
  }
  
    if(at2 == 1)
  {

if(c2 < cordenada1)
{
  c2 = c2 -1;
}
if(c2 > cordenada1)
{
  c2 = c2 +1;
}
if(v2 < cordenada2)
{
  v2 = v2 -1;
}
if(v2 > cordenada2)
{
  v2 = v2 +1;
}
    
  rect(bal2x,bal2y,10,10);
  }
  
    if(at3 == 1)
  {

if(c3 < cordenada1)
{
  c3 = c3 -1;
}
if(c3 > cordenada1)
{
  c3 = c3 +1;
}
if(v3 < cordenada2)
{
  v3 = v3 -1;
}
if(v3 > cordenada2)
{
  v3 = v3 +1;
}
    
  rect(bal3x,bal3y,10,10);
  }   
  
  rect(cordenada1,cordenada2,100,100);
  ellipse(cordenada1,cordenada2, 75, 75);
      
    if(x == 1)
  {
bal1x = qd1 + c1 +100;
bal1y = qd2 + v1;
bal2x = wd1 + c2 +100;
bal2y = wd2 + v2;
bal3x = ed1 + c3 +100;
bal3y = ed2 + v3;
  rect(75 + cordenada1,cordenada2,75,10);
  }
  if(x == 2)
  {
bal1x = qd1 + c1;
bal1y = qd2 + v1 +100;
bal2x = wd1 + c2;
bal2y = wd2 + v2 +100;
bal3x = ed1 + c3;
bal3y = ed2 + v3 +100;
  rect(cordenada1,75 + cordenada2,10,75);
  }
  
    if(x == 3)
  {
bal1x = qd1 + c1 -100;
bal1y = qd2 + v1;
bal2x = wd1 + c2 -100;
bal2y = wd2 + v2;
bal3x = ed1 + c3 -100;
bal3y = ed2 + v3;
  rect(-75 + cordenada1,cordenada2,75,10);
  }
  
    if(x == 4)
  {
bal1x = qd1 + c1;
bal1y = qd2 + v1 -100;
bal2x = wd1 + c2;
bal2y = wd2 + v2 -100;
bal3x = ed1 + c3;
bal3y = ed2 + v3 -100;
  rect(cordenada1,-75 + cordenada2,10,75);
  }
  
if(x == 1)
{
qd1 = qd1 + at1;
qd2 = 0;
wd1 = wd1 + at2;
wd2 = 0;
ed1 = ed1 + at3;
ed2 = 0;
}

if(x == 2)
{
qd1 = 0;
qd2 = qd2 + at1;
wd1 = 0;
wd2 = wd2 + at2;
ed1 = 0;
ed2 = ed2 + at3;
}
if(x == 3)
{
qd1 = qd1 - at1;
qd2 = 0;
wd1 = wd1 - at2;
wd2 = 0;
ed1 = ed1 - at3;
ed2 = 0;
}

if(x == 4)
{
qd1 = 0;
qd2 = qd2 - at1;
wd1 = 0;
wd2 = wd2 - at2;
ed1 = 0;
ed2 = ed2 - at3;
}

if (keyPressed) {
    if (key == '1' || key == '1') {

at1 = 1;
   }
  }
  
if (keyPressed) {
    if (key == '2' || key == '2') {

at2 = 1;
   }
  }
if (keyPressed) {
    if (key == '3' || key == '3') {

at3 = 1;

   }
  }
if(tempo < 601)
{
tempo = tempo + 1;
at1 = 0;
at2 = 0;
at3 = 0;
}
if (keyPressed) {
    if (key == 'r' || key == 'R') {
tempo = 0;
at1 = 0;
at2 = 0;
at3 = 0;
qd1 = 0;
qd2 = 0;
wd1 = 0;
wd2 = 0;
ed1 = 0;
ed2 = 0;
   }
  }
   h = h - 1 + randon(200) + 801;
   h2 = h2 - 1 + randon(401) -500;
   
   
   rect(h,h2,50,50);
}
