
PFont myFont;
void setup() {
size(900,700);
background(13,29,90);
//texto:
myFont= createFont ("ScriptS-48.vlw",48);
textFont(myFont);
textAlign(CENTER,700);
//fundo estrelado::
for (int j =0; j<700; j=j+5){
  float i= random (900);
  point (i,j);
}
}
int s; int azul;
void draw() {
 azul= 255- mouseX/6;
  background(100,100,azul);
//lua:
s++;
fill (random(252,255),random(250,228), random (146,75));
ellipse (s,50,40,40);
noStroke();
fill (100,100,azul);
ellipse (s+10,40,40,40);
//fundo estrelado:
stroke(244,250,187);
for (int j =0; j<400; j=j+5){
  float i= random (900);
  point (i,j);
}
 //estrelas que aparecem:
strokeWeight(2);
 stroke(240,237,160);
    point(random(0,900),random(0,400));
//horizonte:
noStroke();
fill(29,42,77);
quad(0,400,900,400,900,700,0,700);
//pirâmide:
//primeiro triangulo:
stroke(237,227,227);
fill(252,248,207);
triangle (60,400,420,145,420,420);
//detalhe do primeiro triangulo:
int x= 420;
int y=145;
int a=60;
int b=400;
line (x,y+15,a+15,b);
line (x,y+30,a+30,b+1);
line (x,y+45,a+45,b+2);
line (x,y+60,a+60,b+3);
line(x,y+75,a+75,b+4);
line (x,y+90,a+90,b+5);
line(x,y+107,a+110,b+6);
line(x,y+130,a+130,b+7);
line(x,y+150,a+150,b+8);
line(x,y+170,a+170,b+9);
line(x,y+190,a+190,b+10);
line(x,y+210,a+210,b+11);
line(x,y+225,a+225,b+12);
line(x,y+240,a+260,b+13);
line(x,y+255,a+295,b+15);
line(a+310,b+15,x-20,y+15);
line(a+290,b+13,x-40,y+30);
line(a+270,b+12,x-60,y+45);
line(a+250,b+11,x-80,y+60);
line(a+225,b+10,x-100,y+75);
line(a+200,b+9,x-120,y+90);
line(a+180,b+8,x-140,y+105);
line(a+155,b+7,x-170,y+120);
line(a+120,b+6,x-190,y+135);
line(a+100,b+5,x-210,y+150);
line(a+90,b+4,x-230,y+165);
line(a+60,b+3,x-250,y+180);
line(a+45,b+2,x-270,y+195);
line(a+30,b+1,x-290,y+210);
line(a+15,b,x-319,y+225);
//segundo triangulo:
fill(227,205,149);
triangle (420,145,420,420,680,400);
//prédio fundo:
//estrututa :
stroke(237,227,227);
fill(237,233,196);
quad (538,260,680,400,900,420,900,220);
quad (600,260,600,200,740,190,745,240);
triangle(600,200,740,190,660,180);
//janelas
stroke(151,154,162);
quad(610,270,610,310,620,308,620,268);
quad(610+12,270,610+12,310,620+12,308,620+12,268);
quad(610+50,270,610+50,310,620+50,308,620+50,268);
quad(610+50+12,270,610+50+12,310,620+50+12,308,620+50+12,268);
quad(610+100,270,610+100,310,620+100,308,620+100,268);
quad(610+100+12,270,610+100+12,310,620+100+12,308,620+100+12,268);
quad(610+150,270,610+150,310,620+150,308,620+150,268);
quad(610+150+12,270,610+150+12,310,620+150+12,308,620+150+12,268);
quad(610+200,270,610+200,310,620+200,308,620+200,268);
quad(610+200+12,270,610+200+12,310,620+200+12,308,620+200+12,268);
quad(610+250,270,610+250,310,620+250,308,620+250,268);
quad(610+250+12,270,610+250+12,310,620+250+12,308,620+250+12,268);
if(mouseY>500) {
  stroke (255);
  rect(620,220,20,20);
  rect(620+40,220-5,20,20);
  rect(620+80,220-10,20,20);
 triangle (610,200,730,190,660,185);
}
//chão que reflete
noStroke();
fill(107,114,134);
triangle(60,400,420,420,420,650);
triangle(420,420,420,650,680,400);
//texto:
fill(238,245,195);
text("Louvre",700,650);
}

