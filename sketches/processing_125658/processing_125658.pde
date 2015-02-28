
/* Mahara Zamban 1558633
Minha história da imagem é: Começar a trabalhar na Buscapé. Aprendi
muito e conheci muita gente legal lá, uma pena que eu tive que sair, 
mas a Navegg e a Buscapé são lugares maravilhosos pra se trabalhar
e aprender, espero conseguir voltar pra lá no futuro!
*/

void setup()
{
 size (600,400);
 background(#FFD500);
 teclado();
 logo();
 
} 

void logo()
{
 fill(0); 
 ellipse(200,215,80,80);
 ellipse(400,200,100,100);
 quad(200,175,400,150,400,250,200,255);
 fill(255);
 textSize(40);
 text("buscape",210,220);
 fill(#FF0004);
 stroke(#FF0004);
 quad(347,188,365,183,365,191,348,192);
  ellipse(350,190,5,5);
 ellipse(365,187,8,8);
}


void teclado ()//para o Welington 
{
  
  stroke(0);
  for (int y=1; y<600; y+=10)
     line(1,y,600,y); 

}

