
size(200,200);

background(255);
stroke(0);

/*grama*/
fill(44,142,56);
rect(0,180,200,20);


/*prédio*/
fill(103 ,23,3);
rect(60,30,80,160);

/*porta*/
fill(123,134,126);
rect (75,160,50,30);
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
fill(80,120,56);
ellipse(27.5,145,50,50);

/*arvore2*/
   fill(160,55,19);
 rect (160,150,5,30);
 fill( 80,120,56);
 ellipse(160,145,40,40);
