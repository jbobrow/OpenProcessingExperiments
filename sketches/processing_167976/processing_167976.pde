
float r;
float g;
float b;

float wid;

float hei;

int go=1;
int up=1;



void setup()
{ size(500,500);
background(#F01364);
smooth();
}

void draw() {
noStroke();
r= random(255);
g=random(255);
b=random(255);

wid=(width/10);
hei=(height/10);

fill(r,g,b);
 rect(go,up,wid,hei);
 
 go=(go+width/10);
 
 if(go> width) { go=0;
 up=up+height/10;
 }
 
 
 }
