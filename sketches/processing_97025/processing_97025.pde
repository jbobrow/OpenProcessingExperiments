
/** alturas e vetores.pde<p>
  * Luiz Ernesto Merkle <p>
  * CC BY-SA 2012
  */
/**
  * exemplo de utilização de vetores
  */
  
int [] alturas = {
  145, 160, 170, 193, 165, 180
};
int [] larguras = {
  30, 35, 40, 34, 40, 39
};

background(180,80,150);
size(400, 200); 
for (int i=0; i<alturas.length ; i++)
  rect(i*45+45, 195, larguras[i], -alturas[i]);
