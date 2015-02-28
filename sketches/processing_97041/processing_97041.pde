
/** Luiz Ernesto Merkle <p>
 * CC BY-SA 2012
 */
/**
 * exemplo de utilização de matrizes
 */

int [][] lados = {
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
  {0, 1, 0, 1, 0, 1, 0, 1}, 
  {1, 0, 1, 0, 1, 0, 1, 0}, 
};

size(200, 200); 
for (int j=0; j<lados.length; j++)
  for (int i=0; i<lados[0].length ; i++)
  {
    if (lados[i][j]==0)
      fill(255, 255, 0);
    else
      fill(0, 255, 255);
    rect(j*20, i*20, 10, 10);
  }
