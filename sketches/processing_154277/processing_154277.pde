
//Nancy Wang nancyw
//copyright notice
size(400,400);
float wd=300;
float ht=300;
float x=200;
float y=200;
stroke(100,100,100);
fill(100,50,250);
ellipse (x,y,wd,ht);
stroke (100,100,0);
strokeWeight (3);
fill(100,250,0);
rectMode (CENTER);
rect(x,y,wd*.7,ht*.7);
stroke(250,0,0);
strokeWeight(7);
fill(255,80,0);
quad(x*.7,y*.7,x*1.3,y*.7,x*1.2,y*1.3,x*.8,y*1.3);
stroke(0,0,0);
fill(255,255,255);
strokeWeight(8);
ellipse(x,y,wd*.2,ht*.2);
stroke(200,0,255);
strokeWeight(10);
point(200,200);



