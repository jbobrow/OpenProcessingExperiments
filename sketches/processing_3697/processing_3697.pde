
// Atuas domestiques, Pol Guezennec, 2009.
//"Atuas domestiques" are part of my artwork since 1990, first they were real oil painting on canvas.
// About "Atuas domestiques" history see http://pol.guezennec.free.fr/archive/ATUAS.HTM 
size(800,600);
background(255,255,255);
smooth();
noStroke();


int largeurutile = width-30;
int hauteurutile = height-30;


  float vr = random(0, 255);

  int vro = int(vr);

println("rouge :"+vro);

  float vg = random(0, 255);
  int vgr = int(vg);
  println("vert :"+vgr);

  float vb = random(0, 255);
  int vbl = int(vb);
  println("bleu :"+vbl);

float plancherh = height/11;

float plafondh = hauteurutile-50;

float h = random(plancherh,plafondh);


float plancherw = h*0.618;

float plafondw =h*1.618;

float w = random(plancherw,plafondw);


float partagew = largeurutile-w;
float posx = random(20,partagew);


float partagey = hauteurutile-h;
float posy = random(50,partagey);


fill(vro-100,vgr-100,vbl-100);
rect(posx,posy+3,w,h);
float value = w+h;
filter(BLUR,8);

fill(vro,vgr,vbl);

rect(posx,posy,w,h); 


float rr = random(-66,66);
println("rr :"+rr);
float ron = vro+rr;
println("r ="+ron);
float rg = random(-66,66);
println("rg :"+rg);
float grn = vgr+rg;
println("g ="+grn);
float rb = random(-66,66);
println("rb :"+rb);
float bln = vbl+rb;
println("b ="+bln);

stroke(ron,grn,bln);

float x = posx+2;  
float i = ceil(x);  
float plus = random(1,4);

for (  i = posy; i <= posy+h ; i = i+4){
  line(posx, i, posx+w-2, i);
}


fill(36);
float ryg ;
if (w > h) { ryg = h/10;}
else {ryg = w/9;}

float posxog = posx+w*0.25;
float posyog = posy+(h/2)-ryg/2;
noStroke();
ellipse(posxog,posyog,ryg,ryg);


fill(36);
float ryd;
if (w > h) { ryd = h/10;}
else {ryd = w/9;}
float posxod = posx+w*0.75;
float posyod = posy+(h/2)-ryd/2;
noStroke();
ellipse(posxod,posyod,ryd,ryd);



