
size(500,500); // define o tamanho da janela
background(255); // define a cor de fundo
smooth(); // suaviza as formas


for ( int y = 1; y < 10; y++) // indica as repetições da variavel y 
{
    for (int x = 1; x < 4; x = x+1) // indica as repetições da variavel x gerando 3 quadrados com inicio em 0
    {
        noStroke(); // retira a linha de contorno das formas
        fill(216,13,108); // define a cor da forma
        rect ( x*50, y*50, 20,20); // construção dos quadrados repetindo com 50 de espaçamento em x e y
    }
    
}

for ( int y = 1; y < 10; y++) // indica as repetições da variavel y 
{
    for (int x = 7; x < 10; x = x+1) // indica as repetições da variavel x gerando 3 quadrados com inicio no 7ª
    {
        noStroke(); // retira a linha de contorno das formas
        fill(216,13,108); // define a cor da forma
        rect ( x*50, y*50, 20,20); // construção dos quadrados repetindo com 50 de espaçamento em x e y    
    }
    
}

for ( int y = 1; y < 10; y++) // indica as repetições da variavel y
{
    for (int x = 4; x < 7; x = x+1) // indica as repetições da variavel x gerando 3 quadrados com inicio no 4ª
    {
        noStroke(); // retira a linha de contorno das formas
        fill(13,216,150); // define a cor da forma
        rect ( x*50, y*50, 20,20); // construção dos quadrados repetindo com 50 de espaçamento em x e y     
    }
    
}
