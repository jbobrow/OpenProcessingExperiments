
int red=100;
int green=70;
int blue=70;
int px;
float h;
 void setup() {
size(450,650);
frameRate(15);
px =0;
}
void draw() {
background(blue,green,red);    
if(blue<12)blue+=3;
if(green<102)green+=2;
if(red<175)red+=2;

if (mouseY>450){//cidade mais escura
 fill (40);
 stroke (40);
 rect (0,310,50,180);
 rect (50,335,50,180);
 rect (100,320,60,200);
 rect (120,320,20,190);
 rect (200,340,20,210)
 rect (290,300,50,200);
 rect (330,320,30,190);
 rect (350,315,60,150);
 rect (410,330,50,180);
 }
 
 if (mouseY>350){//cidade media
 fill (90);
 stroke (90);
 rect (0,400,50,180);
 rect (30,385,60,180);
 rect (61,440,30,200);
 rect (95,420,60,190);
 rect (160,380,40,210)
 rect (300,380,30,200);
 rect (330,360,30,190);
 rect (350,405,60,150);
 rect (410,390,50,180);
 }
if (mouseY>200){ //cidade clara
 fill (120);
 stroke (120);
 rect (0,450,30,180);
 rect (30,475,30,180);
 rect (61,430,30,200);
 rect (95,440,50,190);
 rect (160,420,70,210);
 rect (350,420,20,190);
 rect (370,465,60,150);
 rect (410,430,40,180);
 }
 px+=1;
noStroke ();
fill (228,153,50);
ellipse (px,150,80,80);//sol

 fill(255,70);//nuvens
  ellipse(h-70,40,120,30);
  ellipse(h-30,50,150,40);          
  ellipse(h-90,290,90,50);
  ellipse(h-80,330,200,40);
  ellipse(h+90,210,120,50);        
  ellipse(h+150,180,90,30);
   h+=2;
   if(h<0){
   h=width;  }
 
 fill (40,75,96);  
rect (123,415,202,35);//base
int x;// armação
stroke(130);
strokeWeight (3);
for (x=123; x<336; x=x+67)
line (x,415,x,450);

//triangulos de vidro - cima
stroke(130);
int x;
for (x=158;x<336;x=x+67)
triangle (x-35,415,x,360,x+33,415);//primeira
for (x=158;x<336;x=x+67)//terceira
triangle (x-35,305,x,250,x+33,305);
for (x=158;x<336;x=x+67)//quinta
triangle (x-35,195,x,140,x+33,195);

int x;
for (x=191;x<306;x=x+67)//segunda
triangle (x-35,360,x,305,x+33,360);
for (x=191;x<306;x=x+67)//quarta
triangle (x-35,250,x,195,x+33,250);
for (x=191;x<306;x=x+67)//sexta
triangle (x-35,140,x,85,x+33,140);

//triangulos de vidro - baixo
for (x=191;x<306;x=x+67)//primeira
triangle (x-35,360,x,415,x+33,360);
for (x=191;x<306;x=x+67)//terceira
triangle (x-35,250,x,305,x+33,250);
for (x=191;x<306;x=x+67)//quinta
triangle (x-35,140,x,195,x+33,140);
for (x=158;x<336;x=x+67)//sexta
triangle (x-35,85,x,140,x+33,85);
for (x=158;x<336;x=x+67)//segunda
triangle (x-35,305,x,360,x+33,305);
for (x=158;x<336;x=x+67)//quarta
triangle (x-35,195,x,250,x+33,195);

strokeWeight (1);
stroke (249,233,200);
fill (249,233,200);
rect (93,450,260,180); // retangulo base

fill (136,185,45);//grama
stroke (136,185,45);
rect (0,590,450,30);

fill (245,221,169); // barras e colunas
stroke(245,221,169);
rect (93,475,260,5);
rect (93,547,260,33);

stroke (245,221,169);
fill (245,221,169);
rect (191,430,8,100);
rect (246,430,8,100);
rect (189,580,70,50);
rect (90,430,8,200);
rect (348,430,8,200);

fill (245,221,169);//triangulos das colunas
stroke (245,221,169);
triangle (203,527,189,527,196,508);
triangle (258,527,244,527,251,508);

rect (189,527,13,20);// retangulos das colunas
rect (244,527,13,20);
stroke (180);// rua
fill (180);
rect (0,620,450,30);
int x;
fill(255,255,0);
for (x=5; x<450; x=x+60)
rect (x,630,45,8);
if (mouseX>225) {
 fill (40,75,96);

int x; // janelas-esquerda
stroke (170);
for (x=99; x<185; x=x+13)
rect (x,455,8,16);
for (x=99; x<185; x=x+13)
rect (x,484,8,16);
for (x=99; x<185; x=x+13)
rect (x,505,8,16);
for (x=99; x<185; x=x+13)
rect (x,526,8,16);
for (x=99; x<185; x=x+13)
rect (x,553,8,16);
for (x=206; x<240; x=x+13)// janelas-centro
rect (x,455,8,16);
for (x=206; x<240; x=x+13)
rect (x,484,8,16);
for (x=206; x<240; x=x+13)
rect (x,505,8,16);
for (x=206; x<240; x=x+13)
rect (x,526,8,16);
for (x=261; x<350; x=x+13)//janelas-direita
rect (x,455,8,16);
for (x=261; x<350; x=x+13)
rect (x,484,8,16);
for (x=261; x<350; x=x+13)
rect (x,505,8,16);
for (x=261; x<350; x=x+13)
rect (x,526,8,16);
for (x=261; x<350; x=x+13)
rect (x,553,8,16);
}
else {
  fill (241,219,65);
  int x; // janelas-esquerda
stroke (170);
for (x=99; x<185; x=x+13)
rect (x,455,8,16);
for (x=99; x<185; x=x+13)
rect (x,484,8,16);
for (x=99; x<185; x=x+13)
rect (x,505,8,16);
for (x=99; x<185; x=x+13)
rect (x,526,8,16);
for (x=99; x<185; x=x+13)
rect (x,553,8,16);
for (x=206; x<240; x=x+13)// janelas-centro
rect (x,455,8,16);
for (x=206; x<240; x=x+13)
rect (x,484,8,16);
for (x=206; x<240; x=x+13)
rect (x,505,8,16);
for (x=206; x<240; x=x+13)
rect (x,526,8,16);
for (x=261; x<350; x=x+13)//janelas-direita
rect (x,455,8,16);
for (x=261; x<350; x=x+13)
rect (x,484,8,16);
for (x=261; x<350; x=x+13)
rect (x,505,8,16);
for (x=261; x<350; x=x+13)
rect (x,526,8,16);
for (x=261; x<350; x=x+13)
rect (x,553,8,16);
}
stroke (0);// vitrines
fill (220,226,241);
for (x=99; x<280; x=x+160)
rect (x,581,89,33);

fill (0);
rect (99,614,89,6);
rect (259,614,89,6);
rect (99,581,89,3);
rect (259,581,89,3);

int x;
for (x=99; x<188; x=x+15)
line (x,581,x,614);
for (x=259; x<347; x=x+15)
line (x,581,x,614);

fill(54,54,54);
stroke (54,54,54);
arc (224,570,29,30, PI, TWO_PI);
rect (209,570,29,50);
}
