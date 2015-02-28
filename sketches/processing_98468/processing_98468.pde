
//Arquitetura e Urbanismo | UTFPR
//Disciplina | Computação
//Professor | Luiz Ernesto Merkle  
//Aluna | Giovanna Dalla Costa Cruzato
//Trabalho de Conclusão de Disciplina
//Projeto | Centro Cultural composto por dois módulos principais.
//O primeiro módulo | módulo de acesso| faz refência as origens da Arquitetura. Composto pelo entrelaçamento de materiais de tom 'terra' 
//-como palha, barro e madeira- o módulo remete as moradias primitivas e seu desenvolvimento inicial.
//Para contrapor com o primeiro módulo e dialogar com vários períodos da história da arquitetura, o segundo módulo foi baseado na Arquitetura High-Tech| 
//Movimento pós-modernista que não busca esconder a estrutura da construção, como antes era feito, mas sim mostrá-la como definidora da forma do edifício.


PFont fonte;
void setup() {       //Utilização do void setup 200 x 200 pixels
  size(200, 200);
  background(#1E1C76);
  fonte = createFont("verdana", 7);     //Criação da Fonte
  textFont(fonte);       //Espeficação de uso para escrita
  noLoop();
  fill(#EDE078);    //Reflexo da Luz artificial no vidro
  rect(30, 30, 118, 118);
  stroke(200, 30, 30);
  strokeWeight(3);
  line(10, 130, 100, 150); //Rampa de acesso ao segundo módulo. 
  line(10, 152, 100, 170);//Rampa de acesso ao andar subterrâneo.
}
void draw() { //Utilização do void draw
  for (int r =30;r<150;r=r+13) {
    stroke(#3E3C3B);
    strokeWeight(2);
    line(20, r, 180, r);//Estrutura metálica do segundo módulo
    line(r, 20, r, 180);//Estrutura metálica do segundo módulo
    fill(#7F9080);
    noStroke();
    rect(149, r, 31, 13);//Parte de Concreto do segundo módulo|Espaço destinado a atividades que exigem maior concentração, ou menor incidência de luz.
    stroke(#552709);
    line(r-48, 95, r-48, 150);//Materias rústicos entrelaçados do módulo de acesso
    line(r*r/85/4, 95, r*r/85/4+25, 150);//Materias rústicos entrelaçados do módulo de acesso
    line(5, r*r/85/4+100, 110, r*r/85/4+100);//Materias rústicos entrelaçados do módulo de acesso
    noStroke();
    fill(#EDE078, 80);
    rect(0, 150, 200, 50);//Vidro que permite ao frequentador do centro cultural ou a quem passa por fora do local, visualizar a estrutura da construção.
    fill(#14831C);
    triangle(-10, 150, 110, 150, 0, 200);//Tapete de grama que leva ao primeiro módulo|vegetação natural para não contrastar com os materiais naturais da construção
    fill(#7F9080);
    triangle(110, 150, 200, 200, 200, 150);//Faixa de Concreto que dá sequencia visual ao módulo high-tech.
    textAlign(RIGHT);
    text("GIOVANNA DALLACRUZ. 2013", width-19, height-1);//Assinatura
  }
}
