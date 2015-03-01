
// Nomes : Giovani Bossoni , Rafael Garcia
//Dia : 13/10/2014
/*
Ada Lovelace nasceu no dia 10 de dezembro de 1815 em  Londres no
Reino Unido e sempre foi incentivada pela mae para desenvolver 
raciocinio logico e capacidade para soluÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§ao de problemas.
Nesta representaÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§ao mostramos junto a imagem 
de Ada Lovelace dois elementos que a consagraram
como brilhante matematica e escritora e tambem como a primeira
programadora da historia. A mÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â¡quina analÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â­tica de Babbage, considerado
por muitos como o primeiro computador de toda a histora,
para qual Ada publicou suas notas que mais tarde viriam
a ser reconhecidas como o primeiro software da historia,
e o codigo em si, representado por meio de cartoes perfurados
que era como se escrevia e compilava codigos na epoca.



*/



void setup(){
  size(500,500);
  background(255,255,255);
  
  // Carrega e posiciona a iamgem da Ada
  String url = "http://upload.wikimedia.org/wikipedia/commons/e/e7/Miniature_of_Ada_Byron";
  
  
  PImage imgAda = loadImage(url,"jpg");
  image(imgAda, 0,0, 300,400); // proporÃ�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â§Ã�ï¿½Ã¯Â¿Â½Ã�ï¿½Ã�Â£o de 800x600
  
  // desenho do cartao perfurado
  
  int cont = 0;
  
  
  while(cont < 10){
      fill(245,245,220);
      rect(cont*100,400,100,20);
      int cont2 = 0;
      noStroke();
      while(cont2 < 20){
        fill(0,0,0);
        ellipse(random(cont*100,cont*100 + 100),random(401,419),2,2); //random para colocar os pontos de forma aleatorias no cartao
        cont2++;
      
      }
      stroke(0);
      cont++;
  }
    
    
   //Desenho da maquina de charless babbge
    
    // retangulos pretos
    fill(0,0,0);
    rect(300,250,150,20);
    rect(325,80,100,20);
   
   // retangulos cinzas
    fill(190,190,190);
    rect(325,250,20,-150);
    rect(365,250,20,-150);
    rect(405,250,20,-150);
   
    // circulos amarelos
    fill(217,217,20);
    ellipse(350,70,20,20);
    ellipse(380,70,20,20);
    ellipse(410,70,20,20);
    
    // circulos marrons
    
    fill(184,155,51);
    ellipse(355,110,20,20);
    ellipse(355,150,20,20);
    ellipse(355,190,20,20);
    ellipse(355,230,20,20);
    
    ellipse(395,110,20,20);
    ellipse(395,150,20,20);
    ellipse(395,190,20,20);
    ellipse(395,230,20,20);
    
    // Texto
    
    textSize(25);
    text("Primeira Programadora",220,350);
    text("Da Historia",300,380);
}


