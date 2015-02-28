
//Aluna: Caroline Alves da Silva
//Curso: BSI
//Turma: S73-1-2014
//Período: 1
//Instituição: UTFPR

/*Inspirado na canção "Pela Internet" do cantor e compositor Gilberto Gil, o trabalho tenta mostrar através de figuras geométricas simples a composição de uma web page do cantor tal qual ele se refere no trecho da música que diz "Criar meu web site,
Fazer minha home-page". Nessa web page são encontrados elementos como: agenda de shows, fotos e play list para que as tietes (fãs) do Gilberto possam acompanhar seu trabalho. A agenda do show contém datas e locais para o mês de maio do ano de 2014 retirados do site oficial (http://www.gilbertogil.com.br) do músico. O código foi desenvolvido ao som de GG. */


void setup () {
  //Definições da página
  size(600,500);
  background(255, 204, 0);
  
                          //MONITOR
  rectMode(CORNER);
  fill(210,211,213);
  rect(100,50,400,310,10); //TODO: suavizar borda
  
  fill(254,254,254);
  rect(125,75,350,240);
  
  fill(210,211,213);
  quad(100,360, 500, 360, 550, 450, 50, 450);
  noStroke();
  fill(191,193,195);
  quad(110,380, 490, 380, 520, 440, 80, 440);
  
  //Barra de endereços
  stroke(0);
  fill(254,254,254);
  rect(128,78,250,15,1);//endereço
  rect(380,78,93,15,1);//pesquisar
  fill(75,75,77); 
  text("http://www.gilbertogil.com.br", 130,90);
  fill(150,152,154); 
  text("pesquisar", 382,90);
  
  fill(254,254,254);
  rect(128,100,345,212);
  
  fill(75,75,77); 
  textSize(16);
  text("Gilberto Gil", 250,125); //nome
  
                     //AGENDA DE SHOWS
  fill(254,254,254);
  rect(132,135,100,140);
  rect(135,140,94,20); //Header
  rect(135,162,30,20); //bloco data
  rect(135,184,30,20); //bloco data
  rect(135,206,30,20); //bloco data
  rect(135,228,30,20); //bloco data
  rect(135,250,30,20); //bloco data
  
  fill(75,75,77);
  textSize(12);
  text("Agenda: Maio", 141,154); // Tí­tulo do Header
  textSize(10);
  text("17/18", 136,175); //data
  text("Salvador/BA", 170,175); //local
  text("21/22", 136,199); //data
  text("Recife/PE", 170,199); //local
  text("23", 140,220); //data
  text("Natal/RN", 170,220); //local
             
                          //FOTOS
  fill(254,254,254);
  rect(240,135,60,68);
  rect(240,207,60,68);
  
  ellipseMode(CORNER);
  fill(75,75,77);
  ellipse(243,140,54,54);
  
  triangle(270, 210, 298, 260, 243, 260);
  
  //PLAY LIST
  textSize(12);
  text("Ouça minha playlist:", 315,145);
  textSize(10);
  text("1 - Pela Internet", 310,160);
  text("2 - Vamos Fugir", 310,172);
  text("3 - Se Eu Quiser Falar Com Deus", 310,184);
  text("4 - Entre Os Ateus", 310,196);
  text("5 - Feliz Por Um Triz", 310,208);
  text("6 - Minha Princesa", 310,220);
  text("7 - Filhos de Gandhi", 310,232);
  text("8 - Fogo Líquido", 310,244);
  text("9 - Planeta Dos Macacos", 310,256);
  text("10 - Feiticeira", 310,268);
  text("11 - Andar Com Fé", 310,280);
  //Logo do monitor

  
                          //Tietes
 // Ellipses das cabeças
 ellipseMode (CORNER);    
 noStroke(); 
 fill(75,75,77);                        
 ellipse(-20, 410, 60, 60);                     
 ellipse(60, 410, 60, 60);                       
 ellipse(140, 410, 60, 60); 
 ellipse(220, 410, 60, 60);                      
 ellipse(300, 410, 60, 60);                                             
 ellipse(380, 410, 60, 60);                      
 ellipse(460, 410, 60, 60);                                              
 ellipse(540, 410, 60, 60);
 
 // Retângulos dos troncos
 
 rectMode (CORNER);                         
 fill(75,75,77);                        
 rect(-20, 470, 60, 30);                                            
 rect(60, 470, 60, 30);                                           
 rect(140, 470, 60, 30);                                               
 rect(220, 470, 60, 30);                                          
 rect(300, 470, 60, 30);                                          
 rect(380, 470, 60, 30);                                          
 rect(460, 470, 60, 30);                                         
 rect(540, 470, 60, 30);
 
  //Lines Braços
 stroke(75,75,77); 
 strokeWeight(15);
 line(30,480,70,420);
 line(30,420,70,480);
 line(110,480,150,420);
 line(150,480,110,420);
 line(190,480,230,420);
 line(230,480,190,420);
 line(270,480,310,420);
 line(350,480,390,420);
 line(310,480,270,420);
 line(390,480,350,420);
 line(430,480,470,420);
 line(470,480,430,420);
 line(510,480,550,420);
 line(550,480,510,420);
 line(590,480,630,420);

}

void draw() {
}
