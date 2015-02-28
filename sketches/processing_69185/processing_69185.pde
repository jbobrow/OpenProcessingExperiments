
void setup (){
size(600,600);
background(255);
strokeWeight(8);
noLoop();
}

int a=100;
int d=25;
int c=75;

color r = #b31f11;
color b = #1a2f68;
color g = #267148;
color y = #d7a920;

void draw(){
fill(b);colin1(0,0);
fill(0);colin1(200,200);
fill(b);colin1(400,400);
fill(0);colin1(200,0);
fill(y);colin1(400,000);
fill(0);colin1(400,200);
fill(r);colin1(200,400);
fill(255);colin1(0,200);
fill(255);colin1(0,400);

fill (g);colinl1(0,0);
fill (g);colinl1(200,200);
fill (255);colinl1(400,400);
fill (b);colinl1(200,0);
fill (255);colinl1(400,000);
fill (255);colinl1(400,200);
fill (y);colinl1(200,400);
fill (255);colinl1(0,200);
fill (255);colinl1(0,400);

fill(255);colin2(100,100);
fill(y);colin2(300,100);
fill(r);colin2(500,100);
fill(255);colin2(100,300);
fill(y);colin2(300,300);
fill(255);colin2(500,300);
fill(b);colin2(100,500);
fill(b);colin2(300,500);
fill(y);colin2(500,500);

fill(b);colinl2(100,100);
fill(0);colinl2(300,100);
fill(y);colinl2(500,100);
fill(255);colinl2(100,300);
fill(0);colinl2(300,300);
fill(0);colinl2(500,300);
fill(255);colinl2(100,500);
fill(r);colinl2(300,500);
fill(b);colinl2(500,500);

fill(r);colin3(0,100);
fill(0);colin3(0,300);
fill(r);colin3(0,500);
fill(255);colin3(200,100);
fill(b);colin3(200,300);
fill(g);colin3(200,500);
fill(b);colin3(400,100);
fill(255);colin3(400,300);
fill(255);colin3(400,500);

fill(b);colinl3(0,100);
fill(255);colinl3(0,300);
fill(255);colinl3(0,500);
fill(0);colinl3(200,100);
fill(0);colinl3(200,300);
fill(r);colinl3(200,500);
fill(y);colinl3(400,100);
fill(0);colinl3(400,300);
fill(b);colinl3(400,500);

fill(y);colin4(100,0);
fill(255);colin4(300,0);
fill(b);colin4(500,0);
fill(0);colin4(100,200);
fill(r);colin4(300,200);
fill(255);colin4(500,200);
fill(255);colin4(100,400);
fill(0);colin4(300,400);
fill(g);colin4(500,400);

fill(b);colinl4(100,0);
fill(0);colinl4(300,0);
fill(y);colinl4(500,0);
fill(255);colinl4(100,200);
fill(0);colinl4(300,200);
fill(0);colinl4(500,200);
fill(255);colinl4(100,400);
fill(r);colinl4(300,400);
fill(b);colinl4(500,400);

fill(y);colinhr(0+d,200);
fill(0);colinhr(0+d,400);
fill(0);colinhr(200+d,0);
fill(y);colinhr(400+d,200);

fill(y);colinvr(0,400+d);
fill(b);colinvr(400,200+d);
fill(0);colinvr(400,0+d);

fill(0);colinhr1(300+d,c);
fill(r);colinhr1(500+d,200+c);
fill(g);colinhr1(100+d,400+c);

fill(y);colinvr1(100,400);
fill(0);colinvr1(500,000);
fill(b);colinvr1(500,200);

fill(y);colinhr2(0,300);
fill(y);colinhr2(400,300);
fill(0);colinhr2(0,500);

fill(0);colinvr2(400+c,100+d);
fill(g);colinvr2(400+c,300+d);
fill(r);colinvr2(0+c,300+d);

fill(r);colinhr3(500,300+c);
fill(g);colinhr3(100,500+c);

fill(0);colinvr3(500+c,100);
fill(r);colinvr3(100+c,300);
fill(g);colinvr3(500+c,300);

line (a,0,a,6*a);
line (2*a,0,2*a,6*a);
line (3*a,0,3*a,6*a);
line (4*a,0,4*a,6*a);
line (5*a,0,5*a,6*a);

line (0,a,6*a,a);
line (0,2*a,6*a,2*a);
line (0,3*a,6*a,3*a);
line (0,4*a,6*a,4*a);
line (0,5*a,6*a,5*a);

line (0,0,0,600);
line (0,0,600,0);
line (600,600,600,0);
line (0,600,600,600);

}

void colin1(int x,int y){
rect(x,y,d,d);
}

void colinl1(int x,int y){
rect(x+d,y+d,c,c);
}

void colin2(int x,int y){
rect(x,y,c,c);
}

void colinl2(int x,int y){
rect(x+c,y+c,d,d);
}

void colin3(int x,int y){
rect(x,y+d,c,c);
}

void colinl3(int x,int y){
rect(x+c,y,d,d);
}

void colin4(int x,int y){
rect(x+d,y,c,c);
}

void colinl4(int x,int y){
rect(x,y+c,d,d);
}

void colinhr (int x, int y){
rect(x,y,c,d);
}

void colinvr (int x, int y){
rect(x,y,d,c);
}

void colinhr1 (int x, int y){
rect(x,y,c,d);
}

void colinvr1 (int x, int y){
rect(x,y,d,c);
}

void colinhr2 (int x, int y){
rect(x,y,c,d);
}

void colinvr2 (int x, int y){
rect(x,y,d,c);
}

void colinhr3 (int x, int y){
rect(x,y,c,d);
}

void colinvr3 (int x, int y){
rect(x,y,d,c);
}

