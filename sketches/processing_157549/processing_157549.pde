
//Crea una red de rectÃ¡ngulos de diferentes tamaÃ±os y proporciones
//Aplica aleatoriamente colores de una paleta
//Los colores proceden de Desert Color Theme, by arshok in Kuler: https://kuler.adobe.com/Desert-color-theme-2805697/

float x = 0;
color[] molones = { #C74029, #FAE8CD, #128085, #385052, #F0AD44};
//Definimos un array de colores (la paleta que vamos a usar)

void setup(){
    size(600, 400);
    rectMode(CENTER);
    smooth();
    noStroke();
    background(molones[1]);//elegimos el primer color de la paleta como fondo
}

void draw(){
    while (x<width) {
      float y=0;
      while (y<height) {
        float w=random(5, 25);
        float h=random(5, 25);
        fill(50, 60);
        //gris transparente
        rect(x+12, y+12, w, h);
        //crea rectÃ¡ngulos grises idÃ©nticos a los de color, como sombra
        fill(molones[int(random (5))]);
        //elige aleatoriamente un color de la paleta
        rect(x+10, y+10, w, h);
        //rectÃ¡ngulos de color
        y+=15;
      }
      x+=15;
    }
}
