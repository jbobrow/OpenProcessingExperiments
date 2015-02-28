
size(200,200);
background(116,116,114);

/*calçada*/
fill(206,206,202);
int x;
int y;
for(x=0;x<161;x=+x+10)
{
for(y=30;y<201;y=y+10)
{
rect(x,y,10,10);
}
}

/*grama*/
fill(57,247,100);
rect(0,40,160,160);

/*fonte*/
fill(242,242,213);
ellipse(80,120,50,50);
fill(148,241,252);
ellipse(80,120,40,40);
fill(242,242,213);
ellipse(80,120,15,15);

/*bancos*/
int z;
float w;
fill(160,55,19);
for(z=15;z<116;z=z+70)
{
rect(z,50,30,15);
}

for(w=77.5;w<178.5;w=w+70)
{
rect(130,w,15,30);
}

/*arbustos*/
float v;
float d;
fill(44,142,56);
for(v=65;v<136;v=v+70)
{
ellipse(v,57.5,10,10);
}
ellipse(135,127.5,10,10);
