
/**Ana Paula Moreto Silvestre*/


size(400,400); //janela 400x400
background(#0D0C0C); //cor do fundo
fill(12,7,41); //cor de preenchimento
rect(0,0,500,250); //retangulo, posiçao-tamanho)
fill(164,160,191);
ellipse(300,100,200,50); //nuvem
fill(164,160,191);
noStroke();
ellipse(390,120,150,50); //ditancia(direita/esq),(norte/sul), x,altura
ellipse(40, 60, 70,50);
ellipse(60,70, 60,40);

stroke(0,0,0);
fill(229,213,213);
rect(30,150,50,150); //prédio 1
int x=15;
int y=35;
int w=160;
fill(154,207,234);
rect(y,w,x,x); //janela
rect(y,w+20,x,x); //janela
rect(y,w+40,x,x); //janela
rect(y,w+60,x,x); //janela
rect(y,w+80,x,x); //janela
rect(y,w+100,x,x); //janela
int z=60;
rect(z,w,x,x); //janela
rect(z,w+20,x,x); //janela
rect(z,w+40,x,x); //janela
rect(z,w+60,x,x); //janela
rect(z,w+80,x,x); //janela
rect(z,w+100,x,x); //janela

fill(186,191,127);
rect(90, 200, 40, 80); //prédio 2
fill(206,50,10);
int q=90;
int e=210;
int r=7;
int t=40;
rect(q,e,t,r);

fill(255,255,255);
int u=95;
int i=220;
int o=10;
rect(u,i,o,o); //janela prédio 2
rect(u,i+15,o,o);
rect(u,i+30,o,o);
int a=110;
rect(a,i,o,o);
rect(a,i+15,o,o);
rect(a,i+30,o,o);


fill(240,233,184);

stroke(175,175,170);

strokeWeight(5);
line(170,250,0,400); //y,x, y,x)
line(230,250,400,400);
line(200, 400, 200, 360);
line(200, 340, 200, 320);
line(200, 300, 200, 290);
line(200, 270, 200, 265);
line(200, 250, 200, 250);


stroke(218,232,240);
fill(255,255,255);
ellipse(200,100, 120, 120); //lua


stroke(111,61,22); //árvore
strokeWeight(5);
line(280, 220, 280, 270);
noStroke();
fill(78,183,78, 175);
ellipse(280, 205, 40, 30);
ellipse(280, 205, 50, 40);


stroke(111,61,22); //árvore
strokeWeight(5);
line(330, 250, 330, 300);
noStroke();
fill(78,183,78, 175);
ellipse(330, 230, 50, 40);
ellipse(330, 230, 60, 50);


stroke(111,61,22); //árvore
strokeWeight(5);
line(370, 280, 370, 350);
noStroke();
fill(78,183,78, 175);
ellipse(370, 260, 60, 50);
ellipse(370, 260, 70, 60);

stroke(245,223,111);
strokeWeight(2);
point(50,30); //estrela
point(100,50);
point(130, 20);
point(270, 60);
point(340, 50);
point(370, 55);
