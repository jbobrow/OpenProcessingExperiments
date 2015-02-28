
/* Nome: Lilian Caroline Cava
Data: 16/12/13
*/


/* As melhores coisas que aconteceram em 2013 para mim foram a formatura do tÃ©cnico e o show do aerosmith e whitesnake.
    A formatura do tÃ©cnico em eletrÃ´nica Ã³bvio por depois de longos quatro anos e meio e uma greve consegui me formar e pegar meu diploma. 
      O show do aerosmith foi muuuuito bom. Era meu sonho de vida ir neste show especificamente, e por alegria, ainda foi em Curitiba. 
        Depois de um dia todo na fila, com direito a ensolaÃ§Ã£o, pude finalmente conhecer a banda e ver o show da grade. \o/
          Whitesnake abriu o show do Aerosmith e achei que ia ser um show ruim, mas no fim eles sÃ£o demais tambÃ©m. 
            Com certeza isso tudo valeu o ano! :D
                                                     */

//  Variaveis que vÃ£o "movimentar" as palavras                                                  
float x = -50.0;
float y = 150.0;
float z = 300.0;

// FunÃ§Ã£o que gerarÃ¡ um parÃ¢metro de cor aleatÃ³rio, um nÃºmero entre 0 e 255
float cor ()
{
    float i;
    i  = random (255);
    return (i);
}

//FunÃ§Ã£o que vai gerar as linhas do capelo
void linhas (int a)
{
  line(150, 200, a, 250);
}

//Escreve Aerosmith
void aerosmith (float a)
{
  textSize(25);
  fill(252, a, 208);
  text("SHOW AEROSMITH!", 20, a);
}

//Escreve Whitesnake
void whitesnake (float a)
{
  textSize(25);
  fill(10, 252, a);
  text("SHOW WHITESNAKE!", 150, a);
}

//Escreve Formatura UTFPR!
void formatura (float a)
{
  textSize(25);
  fill(a, 100, 252);
  text("FORMATURA UTFPR!", 100, a);
}

//InicializaÃ§Ã£o
void setup () 
{
  size (400,400);
  smooth ();
}  

//Estrutura que se repetirÃ¡
void draw ()
{
  background(227, 228, 232);
  
  //Escreve as palavras para que fiquem por baixo
  aerosmith(x);
  whitesnake(y);
  formatura(z);
 
  // Desenha o capelo 
  fill (0);
  stroke(255);
  ellipse(200,190, 65, 50);
  quad(150, 200, 150, 150, 250,140, 250, 190);
  line(200, 180, 150, 200);
   
  // Desenha os fios soltos do capelo
  for (int i = 0; i <= 20; i+=2)
  {
    stroke(cor(), cor(), cor());
    linhas(150-i);
  }
  
  // Desenha o dipÄºoma
  fill(245, 230, 183);
  stroke(0);
  quad(180, 240, 250, 220, 260, 230, 190, 250);
  ellipse(185, 245, 12, 12);
  
  // Atualiza as variaveis para que as palavras se "movimentem"
  x+= 1;
  if (x > 450)
  {
    x = -50.0;
  }  
  
  y+= 1;
  if (y > 450)
  {
    y = -50.0;
  } 
  
  z+= 1;
  if (z > 450)
  {
    z = -50.0;
  } 
}  
