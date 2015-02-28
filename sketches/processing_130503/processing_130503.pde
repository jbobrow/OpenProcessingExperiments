
//luiz ernesto merkl
// cc-sa
// condicionais - eventos

boolean condicaoForma;

void setup() {
  size(200, 200);
  condicaoForma = true;
  rectMode(CENTER);
  noStroke();
}

void draw() {
  if (condicaoForma)
  { 
    fill(0);
    rect(mouseX, mouseY, 10, 10);
    rect(width-mouseX, mouseY, 10, 10);
    rect(mouseX, height -mouseY, 10, 10);
    rect(width-mouseX, height-mouseY, 10, 10);
  }
  else
  {
    fill(255);
    ellipse(mouseX, mouseY, 10, 10);
    ellipse(width-mouseX, mouseY, 10, 10);
    ellipse(mouseX, height -mouseY, 10, 10);
    ellipse(width-mouseX, height-mouseY, 10, 10);
  }
}

void mousePressed()
{
  if (condicaoForma=false)
    condicaoForma=true;
  else
    condicaoForma=false;
}

