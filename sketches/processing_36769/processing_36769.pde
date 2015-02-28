

//iniciar variaveis da cor uma vermelho, 
//uma para o verde e outra para o azul
float corR;
float corG;
float corB;

void setup(){
size(500,500);// este comando define a janela 
smooth();// graficos com anti-alissing

//desenhar a eliipse e quadrado a partir do centro
ellipseMode(CENTER);
rectMode(CENTER);

background(255);//cor fundo
}

void draw(){

      //atribuir valores random as variaveis de cor
   corR=random(255);
   corG=random(255);
   corB=random(255);
   float opacidade=random(100,255);
  
  
  
  
  /* condiçao que diz se o rato for presionadoa,
  desenha um quadrado onde o tamanho do quadradoe é igual 
  á difença entre a posiçao inicia do cursor e a posiçao actual 
  e as core ficam mais frias,
      
  "se nao", se nao for presionado a rato 
  desenha uma ellipse onde o tamanho da ellipse é igual 
  á difença entre a posiçao inicial do cursor e a posiçao actual */
  
  if (mousePressed == true ) {
    
 fill(0,corG,corB,opacidade);
  noStroke();
  rect(mouseX,mouseY,abs(mouseX-pmouseY),abs(mouseY-pmouseX));
} else {
   
  fill(corR,corG,0,opacidade);
  noStroke();
  ellipse(mouseX,mouseY,abs(mouseX-pmouseY),abs(mouseY-pmouseX));
}
} 

void keyPressed(){
 

 //condiçao, se premir a tecla "espaço" salva o frame numa imagem .jpg
  // e redesenha o background branco, 
  //subrepondo-se at tudo o que ja estava desenhado

        if (key == ' ')
        {    
      
         background(255);         
        }
     
 }

