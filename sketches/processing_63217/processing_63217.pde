
void setup(){ // definição dos elementos estáticos
  
  size(500,500);// define a área de composição
  noLoop();// sem movimento
  smooth();// suaviza a composição
}
   
  void draw(){// definição dos elementos em animação
    
    background(0);// cor de fundo
    noStroke();// sem stroke
   
       
  float limiteHorizontal, limiteVertical; // variável para o limite horizontal e vertical

  limiteHorizontal = 100; // limite horizontal igual a 100
  limiteVertical = 200; // limite vertical igual a 200
    
    stroke(255,0,0); // cor do stroke
    strokeWeight(3);// stroke com espessura 3
    
   
   for (int i=0; i<100; i=i+1){// função em que a composição começa em 0 até 100 e o i é igual ao i anterior mais 1 
   
    float posX_1 = width/2;// variavel em que a largura é metade da largura da área de trabalho
    float posY_1 = height/2;// variavel em que a altura é metade da altura da área de trabalho
    float posX_2= random(width);// variavel em que a largura varia na largura total da área de trabalho
    float posY_2= random(height);//variavel em que a altura varia na altura total da área de trabalho
     
    line (posX_1, posY_1, posX_2, posY_2);// coordenadas das linhas
    ellipse(posX_1,posY_1, 5,5);// coordenadas das ellipses
    ellipse(posX_2,posY_2, 5,5);// coordenadas das ellipses
   }

      
   for (int i=0; i<100; i=i+1){ // função em que a composição começa em 0 até 100 e o i é igual ao i anterior mais 1
   
   fill(255);// preenchimento dos objectos a branco
   stroke(255);// cor do stroke
     float posX_1 = width/2;// variavel em que a largura é metade da largura da área de trabalho
    float posY_1 = height/2;// variavel em que a altura é metade da altura da área de trabalho
    float posX_2= random(width);// variavel em que a largura varia na largura total da área de trabalho
    float posY_2= random(height);//variavel em que a altura varia na altura total da área de trabalho
    
    line (posX_1, posY_1, posX_2, posY_2);// coordenadas das linhas
    fill(random(255), random(255), random(255));// preenchimento dos objectos com a gama cromática do RGB
    ellipse(posX_1,posY_1, 10,10);// coordenadas das ellipses
    ellipse(posX_2,posY_2, 10,10);// coordenadas das ellipses
    
   }
   }
  



