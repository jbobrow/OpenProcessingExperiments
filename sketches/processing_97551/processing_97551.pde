
//Cindy Feijó, 2S2012
//Reforço 5 - original
//usando azul e branco

size(200,200);
background(0,0,255); //fundo azul

int x=150;
int y=10;
   
for(x=120; x<200;x+=10){ // condição para repetição
smooth ();
stroke (255); //linhas brancas
strokeWeight (3);

line(10,10,-x+200,y); //sequência da direita
line(x,y,190,10); //sequência da esquerda
y+=24; // variação do y (comprimento)
}
