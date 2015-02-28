
void setup() {
  
size (650,314); 

}

void draw() {
  
background (204,226,234);  
fill (126,126,126); // chão
noStroke(); 
rect (0,267,700,320);

fill (193,193,193); // predio de tras
noStroke();
rect (257,193,130,74);

fill (170,170,170); // janelas de tras
int z;
int w;
for (z=267;z<=377;z=z+10)
for (w=205;w<267;w=w+25)
rect (z,w,7,8);

fill (211,240,174,90); // vidro verde de tras
noStroke();
rect (257,172,130,21);
  
fill (224,222,222); // base opaca moderna
noStroke();
rect (51,260,68,27);

fill (201,216,184,200); // base transparente
noStroke();
rect (119,260,108,27);
  
fill(206); //cobertura
noStroke();
quad(20,110,450,110,420,140,90,140);

noStroke();
beginShape();
curveVertex(45,100-mouseX/25);
curveVertex(85, 110+mouseX/25);
curveVertex(125,100);
curveVertex(145,110-mouseX/25);
curveVertex(165,110);
curveVertex(205,110-mouseX/25);
curveVertex(245, 110);
curveVertex(285, 110);
curveVertex(305,100+mouseX/25);
curveVertex(325,110-mouseX/25);
curveVertex(365, 110);
curveVertex(385,110+mouseX/25);
curveVertex(405,100);
endShape();
  
fill (255,255,255); // pilares predio novo
noStroke();  
int x;
for (x=40; x<300; x=x+20)
rect (x,115,2,172);

fill(255); // pilares de tras
stroke(255);
strokeWeight(1);
line(85,152,85,135);
line(105,152,105,135);
line(125,152,125,135);
line(145,152,145,135);
line(165,152,165,135);
line(185,152,185,135);
line(205,152,205,135);
line(225,152,225,135);
line(245,152,245,135);
line(265,152,265,135);

stroke(255); // pilares predio velho
strokeWeight(1);
line(375,155,375,128);
line(405,155,405,128);
line(370,155,370,128);
line(397,155,397,128);

fill (211,240,174,90); //vidro verde
rect (40,152,240,105);

fill (255); // vigas
noStroke();
int y;
for (y=152; y<=257; y=y+21)
rect (35,y,252,2);

fill (224,222,222); // predio velho
noStroke();
rect (345,160,260,127);

fill (246,245,190); // janelas de cima
int l;
int m;
for (l=359;l<=590;l=l+16)
for (m=165;m<177;m=m+25)
rect (l,m,7,12);

fill (170,170,170); // janelas do meio 1
int a;
int b;
for (a=359;a<=590;a=a+16)
for (b=197;b<209;b=b+25)
rect (a,b,7,12);

fill (170,170,170); // janelas do meio 2
int c;
int d;
for (c=359;c<=590;c=c+16)
for (d=229;d<241;d=d+25)
rect (c,d,7,12);

fill (246,245,190); // janelas de baixo 1
int e;
int f;
for (e=359;e<=464;e=e+16)
for (f=261;f<274;f=f+25)
rect (e,f,9,13);

fill (246,245,190); // janelas de baixo 2
int g;
int h;
for (g=485;g<=590;g=g+16)
for (h=261;h<274;h=h+25)
rect (g,h,9,13);
rect (469,265,11,18);
fill(246,245,190,0);

stroke (170,170,170); // rect do meio - predio velho
strokeWeight(1);
quad(466,160,466,287,483,287,483,160);

fill(104,118,106); //telhado velho da esquerda
noStroke();
quad(345,160,465,160,455,155,355,155);

fill(104,118,106); // telhado velho da direita
noStroke();
quad(483,160,605,160,595,155,493,155);

fill(104,118,106); // cupula velha
noStroke();
quad(459,160,489,160,489,152,459,152);
ellipse(474,152,26,12);

stroke(0); // antena
strokeWeight(1);
line(474,146,474,70);

strokeWeight(1.8);
point(474,143);
point(474,70);

}
