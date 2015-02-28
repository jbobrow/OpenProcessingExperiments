

void setup(){

size (500,500); // este comando define a janela 
smooth(); // este comando faz com que os graficos fiquem desenhados com anti-alissing
  
 
};

void draw (){

  noStroke();
fill (0,0,0,10);

  
///------------------aqui ciclo o desemho das linhas
for (int i =0; i <10; i =i+1){

strokeWeight (mouseY/4); //grossura do contorno e iggual a posiçao 
//vertical do cursor na janela a dividir po 4


// a cor da linha apesar se ser aleatoria vai depender...
//...no que toca ao valor dos veremelhos da posiçao do cursor
stroke (mouseX, random (255), random (255));


// linha, o primeiro ponto é na posiçao actual do cursor e a segundo...
//...ponto é aleatorio
line ( mouseX, mouseY, random(800), random(800));



} 
//condiçao, se premir a tecla "espaço" salva o frame numa imagem .jpg
  // e redesenha o background branco, 
  //subrepondo-se at tudo o que ja estava desenhado
   if(keyPressed) {
        if (key == ' ')
        {    
        
         background(255);         
        }
}

};




