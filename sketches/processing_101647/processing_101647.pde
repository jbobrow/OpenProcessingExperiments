
size(600,600); // dimensões do desenho

background(100,150,255); // fundo azul (céu)

fill(255,255,255); // preenchimento elipse 1
stroke(255,255,255); // cor da linha

ellipse(150,420,100,100); //elipse 1

arc(440,365,150,50,0,PI); // "bacia"

rect(230,250,20,400); // predio 1

fill(#5D5555); //preencher perspectiva
stroke(#5D5555); // cor da linha
rect(250,255,5,400); // perspectiva 1
triangle(250,250,255,255,250,255); //perspectiva 1

fill(255,255,255); // preenchimento elipse 1
stroke(255,255,255); // cor da linha

rect(260,250,20,400); // predio 2
fill(#5D5555); // preencher perspectiva 
stroke(#5D5555); // cor da linha
rect(280,255,5,400); // perspectiva 2
triangle(280,250,285,255,280,285); //perspectiva 2

stroke(#5D5555); // cor da linha
strokeWeight(2); // espessura da linha

int y; // variavel y (linhas entre os prédios)
y=255;           
line(251,y,258,y);
y=322;
line(251,y,258,y);
y=330;
line(251,y,258,y);
y=328;
line(251,y,258,y);
y=332;
line(251,y,258,y);
y=334;
line(251,y,258,y);

stroke(50,200,0);

fill(50,150,0); // preenchimento verde do gramado
rect(0,400,600,200); // gramado

stroke(#5D5555); // cor da linha
strokeWeight(2); // espessura da linha

fill(200,200,255); // preenchimento da base
rect(50,390,500,20); // base

int x; // verticais da base
x=100;
line(x,390,x,410);
x=150;
line(x,390,x,410);
x=200;
line(x,390,x,410);
x=250;
line(x,390,x,410);
x=300;
line(x,390,x,410);
x=350;
line(x,390,x,410);
x=400;
line(x,390,x,410);
x=450;
line(x,390,x,410);
x=500;
line(x,390,x,410);
