
/** Desenhos.pde<p>
  * Luiz Ernesto Merkle <p>
  * CC BY-SA 2012
  */ 
 /*  Licença: Este trabalho está licenciado sob uma Licença Creative Commons Atribuição  3.0 Não Adaptada. <p>
  *  Para ver uma cópia desta licença, visite http://creativecommons.org/licenses/by/3.0/.
  *  08 de dezembro de 2012 <p>
  */
/**
  * Há vários comandos para desenhos: point(); line(); rect(); ellipse(); triangle(); quad();
  */
   
size (200,200);  // especifica uma tela de saída de 200x200

background(255); // branco no fundo 

point(10,10); // desenha um ponto

line(40, 40, 40, 60); // linha horizontal 

rect(140,40, 20,30); // desenha um retângulo de 20 por 30
                // que começa em 40.40
ellipse(150,150, 20,30); // desenha uma ellipes de 10 por 20
                // com centro em 150,150

triangle (0,170,30,200, 30, 170); // triangulo

quad(40,140, 40,160, 60,160, 100,100);// quadilátero 







