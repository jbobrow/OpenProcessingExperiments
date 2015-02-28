
size(700,700); // tamanho da janela
background(#8DCCED);// cor de fundo

noStroke(); // sem contorno
smooth();// definição do contorno

float step = width/ 15;
float stepY = height/ 15;

println(step); 

// numero de quadrados na horizontal e na vertical
for ( int y = 1; y < 15; y =  y+1) {

    for (int x = 1; x < 15; x = x+1) {
  
        noStroke();// sem contorno
        rect ( x* step, y* stepY,20 ,20); // desenhar os quadrados com valores gerados
    fill (#0A3562);   // preenchimento dos quadrados 
    }
    
}


