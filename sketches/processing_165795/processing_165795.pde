
/*
  Name: Ada Lovelace Day
  Author: Everton L Cardoso
          Vickie Costa Aranha
  Date: 13/10/2014
  Description: Representação feita em homenagem ao Ada Lovelace Day.
     
      Esta representação e uma homenagem ao Ada Lovelace Day, um dia reservado a se comemorar a inclusão das mulheres
    nas ares de ciência, tecnologia, engenharia e matemática que teve como pioneira Ada Lovelace, reconhecida como
    uma das primeiras matemáticas ,  e a responsável por escrever o primeiro algoritmo para ser processado por uma maquina.
      Usamos símbolos como uma flor e o próprio símbolo do feminismo ,  juntamente com uma representação da sigla 
    STEAM(science, technology, engineering and maths), sempre com predominância da cor rosa, para assim remeter a
    feminilidade,  mostrando que hoje e cada vez mais as mulheres possuem uma participação abrangente nestas áreas 
    de conhecimento.  
*/
       

size(800,600); 
background(255,240,245);
translate(width/2, height/2); /* Muda o ponto 0 para o centro da tela */

/* começa a desenha a flor */
pushMatrix(); /* faz com que a transfomção fique apenas dento deste bloco */
ellipseMode(CORNER); /* define onde é o ponto de alinhamento do circulo */  
fill(255,192,203);/* ´colore os desnhos */
rotate((2*-PI)/3); /* rotaciona a ellipse com os angulos de acordo com a tabela de radianos */
ellipse(100,-200,200,50);/* petala 02 */ 
popMatrix(); /* volta para as coordenadas default */

pushMatrix(); 
ellipseMode(CORNER);
fill(255,192,203); 
rotate(-PI/2);
ellipse(0,-225,200,50);/* petala 3 */
popMatrix();

pushMatrix();
ellipseMode(CORNER);
fill(255,192,203);
rotate(-PI/3);
ellipse(-100,-200,200,50);/* petala 04 */
popMatrix();

pushMatrix();
ellipseMode(CORNER);
fill(255,192,203);
rotate(-PI/6);
ellipse(-170,-120,200,50);/* petala 05 */
popMatrix();

pushMatrix();
ellipseMode(CORNER);
fill(255,192,203);
rotate((5*-PI)/6);
ellipse(170,-130,200,50);/* petala 01 */
popMatrix();


/* cria o circulo centro da flor */
ellipseMode(CENTER);
ellipse(-200,0,50,50);


String line = "STEM"; /* cria uma string para armazenar o texto */
textSize(160);
fill(255,105,180);
textLeading(10);
text(line, -200,90); /* escreve o texto armazenado na string, posicionando nas coordenadas requeridas */

pushMatrix();
rectMode(CENTER);
fill(255,20,147);
strokeWeight(1);
rect(260, 190, 65, 13, 11);

rectMode(CORNER);
fill(255,20,147);
strokeWeight(1);
rect(253, 120, 13, 100, 11);
popMatrix();


/* cria os circulos para o desenho do simbolo do feminismo */
pushMatrix();
strokeWeight(1);
ellipseMode(CENTER);
fill(255,20,147);
ellipse(260,120,100,100); /* circulo externo */
fill(255,240,245);
ellipse(260,120,80,80);/* circulo da parte interna */
popMatrix();
