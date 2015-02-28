
float a,b,c,d,e;
PFont f;

void setup(){
size(640,520);
background(255);
smooth();
frameRate(20);
f = createFont("BlairMdITCTT-Medium-16",16,true);
}

void draw(){
background(0);
noStroke();
a+=0.05;
b+=0.1;
c+=0.025;
d+=0.12;
e+=0.03;
textFont(f);
fill(255);
text("Modelo Heliocéntrico "+int(frameCount/25+2),width/3+15,43);
PVector sol=new PVector(width/2,height/2);
PVector mercurio=new PVector(60*cos(c),60*sin(c));
PVector venus=new PVector(80*cos(d),80*sin(d));
PVector martes=new PVector(180*cos(e),180*sin(e));
PVector tierra=new PVector(130*cos(a),130*sin(a));
PVector luna=new PVector(35*cos(b),35*sin(b));
fill(255,239,0);
ellipse(sol.x,sol.y,40,40);
fill(140,67,143);
mercurio.add(sol);
ellipse(mercurio.x,mercurio.y,9,9);
fill(249,186,145);
venus.add(sol);
ellipse(venus.x,venus.y,12,12);
fill(0,0,255,160);
tierra.add(sol);
ellipse(tierra.x,tierra.y,20,20);
luna.add(tierra);
fill(255,150);
ellipse(luna.x,luna.y,13,13);
fill(14,232,73,60);
martes.add(sol);
ellipse(martes.x,martes.y,24,24);

stroke(255);
strokeWeight(0.75);
noFill();
ellipse(width/2,height/2,160,160);
ellipse(width/2,height/2,120,120);
ellipse(width/2,height/2,260,260);
ellipse(width/2,height/2,360,360);
}


