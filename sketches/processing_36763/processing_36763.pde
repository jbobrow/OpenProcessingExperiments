


void setup() {
   size(500, 500);//tamanho da janela
  background(255);//cor do fundo
  smooth();//suavizaçao das formas
}

void draw() {
  
  
/*condiçao que diz que se o rato estiver a ser presionado cor 
preenchimento dos objectos vai ser aleatoria*/
if (mousePressed == true) {
   
  fill(random(200),random(200),random(200));//cor preenchimento dos objectos
  }
  
  /*desenha uma ellipse onde o tamanho da ellipse é igual 
      á difença entre a posiçao inicial
  do cursor e a posiçao actual*/
  ellipse(pmouseX, pmouseY, abs(pmouseX - mouseX), abs(pmouseX - mouseX));



    //condiçao, se premir a tecla "espaço" salva o frame numa imagem .jpg
  // e redesenha o background branco, 
  //subrepondo-se at tudo o que ja estava desenhado
  if(keyPressed) {
        if (key == ' ')
        {    
      
         background(255);     
     
     
        }
  }
         

 
}





