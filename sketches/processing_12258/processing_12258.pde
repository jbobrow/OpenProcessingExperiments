
//program that makes random bird collages 



void setup(){//title page
  size(400,400);
smooth();
background(207,247,156);
String A1="Click to make your ";
String A2="bird collage";
PFont font;
font=loadFont("Times-Roman-12.vlw");
textFont(font);
fill(0);
text(A1,100,50);
text(A2,100,70);
textAlign(CENTER);


}

void draw()   //right mouse button actions

{
  frameRate(10);
  int c=int (random(60,255));//random color parameters for background and right mouse button
int d=int(random(80,255));
int e=int(random(80,255));
int g=int(random(0,350));//random coordinate parameters for image placements and right mouse button
int h=int(random(0,350));
int n=int(random(0,350));
int o=int(random(0,250));
int p=int(random(0,350));
int q=int(random(0,350));
int r=int(random(0,350));
int s=int(random(0,350));
int t=int(random(0,350));
int u=int(random(0,350));
int v=int(random(0,350));
int w=int(random(0,350));





if (mousePressed){
 background(c,d,e);//random background
PImage f;//image code
f = loadImage("woodpeckers.png");
image(f,g,h); 
PImage i;
i=loadImage("buntings.png");
image(i,s,t);
PImage j;
j=loadImage("owls.png");
image(j,u,v);
PImage k;
k=loadImage("falcons.png");
image(k,n,o);
PImage l;
l=loadImage("quails.png");
image(l,o,p);
PImage m;
m=loadImage("hummingbirds.png");
image(m,q,r);
}


  
  }
  

