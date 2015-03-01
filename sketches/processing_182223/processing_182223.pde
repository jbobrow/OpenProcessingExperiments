
// fonctionne avec un clavier qwerty
  // touches activées : 
     // qwert
    // asdfg
    // 'c' image en entier 
    // 'n' reset 

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioSample cham;
AudioSample drom;

String legende = "chameau épileptique !";
int x=400;
int ximg= 440;

void setup() {
  size(1000, 400);
  noStroke();
  background(255);
  


 minim = new Minim(this);
cham = minim.loadSample("cham.mp3");
 

}
 

void draw () {

PImage picto;
picto = loadImage("picto.png");
image(picto,ximg,height/2-80);

 PFont police;
  police = loadFont("FuturaStd-Heavy-48.vlw");
textFont(police,20);
 fill(random(255),random(255),random(255));
text(legende, x, 280);
println(x);



  //clavier

 if(key == 'q') {
   PImage q;
q = loadImage("q.jpg");
 tint(random(255),random(255),random(255));
image(q,0,0);
x=10000;
ximg=10000;

 }
 
 
 if(key == 'w') {
   PImage w;
w = loadImage("w.jpg");
tint(random(255),random(255),random(255));
image(w,200,0);
x = 10000;
ximg=10000;

 }
 
  if(key == 'e') {
   PImage e;
e = loadImage("e.jpg");
tint(random(255),random(255),random(255));
image(e,400,0);

 }
 
   if(key == 'r') {
   PImage r;
r = loadImage("r.jpg");
tint(random(255),random(255),random(255));
image(r,600,0);

 }
 
   if(key == 't') {
   PImage t;
t = loadImage("t.jpg");
tint(random(255),random(255),random(255));
image(t,800,0);

 }
 
 if(key == 'a') {
   PImage a;
a = loadImage("a.jpg");
tint(random(255),random(255),random(255));
image(a,0,200);

 }
 
 
  if(key == 's') {
   PImage s;
s = loadImage("s.jpg");
tint(random(255),random(255),random(255));
image(s,200,200);

 }


  if(key == 'd') {
   PImage d;
d = loadImage("d.jpg");
tint(random(255),random(255),random(255));
image(d,400,200);

 }

 if(key == 'f') {
   PImage f;
f = loadImage("f.jpg");
tint(random(255),random(255),random(255));
image(f,600,200);
 }

if(key == 'g') {
   PImage g;
g = loadImage("g.jpg");
tint(random(255),random(255),random(255));
image(g,800,200);
 }

if(key == 'c') {
PImage chameau;
chameau = loadImage("chameau.jpg");
tint(random(255),random(255),random(255));
image(chameau,0,0);
cham.trigger();
}


}

void keyReleased()
{
 if (key=='n') setup();
 
}


void stop()
{
minim.stop();
//cham.close();
//super.stop();
}

void keyPressed(){
  x = 10000;
  ximg=10000;

  
}


