
/**Luiz Ernesto Merkle <p>
 * CC BY-SA 2012
 */
/**
 * exemplo de utilização de vetores bidimensionais
 */

int [][] lados = {
  {
    145, 30
  }
  , 
  {
    160, 35
  }
  , {
    170, 40
  }
  , {
    193, 34
  }
  , {
    165, 40
  }
  , { 
    180, 39
  }
};

size(400, 200); 
background(255,0,200);
for (int i=0; i<lados.length ; i++)
  rect(i*45+45, 195, lados[i][1], -lados[i][0]);
