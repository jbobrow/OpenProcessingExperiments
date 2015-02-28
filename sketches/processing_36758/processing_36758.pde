


void setup() {
  size(500, 500);//tamanho da janela
  background(255);//cor do fundo
  smooth(); //suavizaçao das formas
}

void draw() {
  stroke(0);//contorno
  
  /*a grossura do contorno é igual a difença entre a posiçao inicial
  horizontal do cursor e a posiçao horizontal actual*/
  strokeWeight(abs(pmouseX - mouseX));
  
  
   /*desenha uma ellipse onde o posiçao da ellipse é igual aos
   valores de posiaço do rato no  frame anterior*/
  ellipse(pmouseX, pmouseY, 10, 10);
  
  //condiçao, se premir a tecla "espaço" salva o frame numa imagem .jpg
  // e redesenha o background branco, subrepondo-se at tudo o que ja estava desenhado
  if(keyPressed) {
        if (key == ' ')
        {    
        
         background(255);         
        }
}
}

