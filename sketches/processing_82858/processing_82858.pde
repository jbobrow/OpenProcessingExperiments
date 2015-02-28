
/** TiposBasicosdeVariaveis.pde<p>
  * Luiz Ernesto Merkle <p>
  * CC BY-SA 2012
  */ 
 /*  Licença: Este trabalho está licenciado sob uma Licença Creative Commons Atribuição  3.0 Não Adaptada. <p>
  *  Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by/3.0/.
  *  08 de dezembro de 2012 <p>
  */
/**
  * Variaveis podem ser inteiras, reais, caracteres, booleanas, bytes e cores, dentre outras. 
  */ 


size (200,200);  // especifica uma tela de saída de 200x200
// Há vários tipos de variáveis predefinidas em processing 

/**
boolean - Um valor que pode ser true ou false (um bit)<p>
byte    - um inteiro que pode variar de -128 a 127 (em 8bits)<p>
int     - um número inteiro (em 32 bits)<p>
long    - um número inteiro mais longo (em 64bits) <p>
float   - um número real (em 32bits)<p>
double  - um número real maior (em 64bits)<p>
char    - um caracter (em 8bits)<p>
color   - uma cor (em 32bits)<p>
*/ 


int x = 0; // números inteiros

float fx = 10.0f; // números com casas depois da virgula

double dy = 10.0000000000000009d;  // a diferença é pequena, mas a partir 
double dx = 10.0000000000000008d; // de uma certa casa, o computador arredonda

println((10.0-fx)*1000000000000000d); //imprime o valor 
println((10.0-dy)*1000000000000000d);
println((10.0-dx)*10E14d);



