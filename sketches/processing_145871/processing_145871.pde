
// @autor Jorge Luiz

int t; // variável base para o tamanho das formas

void setup()
{
  // tamanho gerado aleatoriamente em um intervalo razoável
  t = (int)random(40,200);

  // javascript export não suporta variáveis
  size(800,800); // originalmente t*4
  
  // mantém o programa interessante
  background(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
}

void draw()
{
  // adaptado para export para sempre centralizar as formas
  rectMode(CENTER);
  rect(width/2, height/2, t, t);

  ellipse(width/2, height/2-t, t, t);

  triangle(width/2, height/2 + t/2,
           width/2 - t/2, height/2 + 3*t/2,
           width/2 + t/2, height/2 + 3*t/2);
}

// código original com tudo em função de t:
// http://pastebin.com/FUnZVrYc


