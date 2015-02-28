
size(200,200);

background(255);
stroke(0);

/*grama*/
fill(44,142,56);
rect(0,180,200,20);

/*solll de ovo*/
fill(255,245,36);
ellipse(160,35,60,60);

/*prédio*/
fill(216,179,142);
rect(60,20,80,160);

/*retangulo kitch*/
fill(160,55,19);
rect(90,30,20,140);

int x;
int y;

/*repetição de janelas*/
fill(164,213,242);
for(x=65;x<136;x=x+50)
{
for(y=35;y<126;y=y+30)
{
rect(x,y,20,20);
}
}

/*arvore*/
fill(160,55,19);
rect(25,160,5,20);
fill(44,142,56);
ellipse(27.5,145,30,30);
