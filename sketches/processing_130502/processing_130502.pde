
// luiz ernesto merkle
// CC-SA 3.0 
// Controla um um evento, tornando-o ligado e desligado com o clique do mouse 
boolean condicaoForma;
boolean condicaoCor;

void setup() {
  size(200, 200);
  condicaoForma = false;
  condicaoCor = false; 
  rectMode(CENTER);
  noStroke();
  colorMode(HSB);
}

void draw() {
  if (condicaoCor == true)
    fill(random(255), 255, 255);
  else
    fill(255);

  if (condicaoForma == true)
    rect(mouseX, mouseY, 10, 10);
  else
    ellipse(mouseX, mouseY, 10, 10);
}

void mousePressed()
{
  if (condicaoCor==true)
    condicaoCor=false;
  else
    condicaoCor=true;
}

