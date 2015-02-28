
// Avaliação Computação 1 - Arquiterura e Urabanismo 
// Exercício 03 
// Desenvolva o esboço ao lado por meio de repetições e condidionais
size(200, 200);
for (int j=0; j<10; j++)
  for (int i=0; i<10; i++)
  {
    if (i<=j)
      fill(0);
    else
      fill(255);
    rect( i*20, j*20, 18, 18);
  }
