
void setup() {
  size(640, 360);
  background(255);
}

void draw() {
  stroke(255);
  strokeWeight(50);
  if (mousePressed == true) {
    if(mouseButton == LEFT) {
    stroke(0);
    strokeWeight(10);
    }
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}

//mouseX e mouseY dão, respectivamente, as coordenadas X e Y do mouse no frame atual
//do canvas, já pmouseX e pmouseY diferenciam-se por fornecerem as coordenadas
//do mouse no frame anterior ao de quando foram chamadas.

//Adicionei a possibilidade de "apagar" (pintar branco sobre background branco) a linha preta desenhada
//usando um ponto de strokeWeight maior, pois normalmente costuma-se apagar uma área maior que a das linhas
//desenhadas.


