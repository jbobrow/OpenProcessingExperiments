
//Click y arrastre de ratón para cambiar la tonalidad del cuadrado principal negro.



void setup() {
size(726,939);
background(241,242,234); //color para fondo blanco.
noStroke();
}

int value = RGB;

void draw() {
  fill(value);
  rect(208,51,320,311);
  fill(241,169,0); //para un color de relleno amarillo naranja.
  rect(54,415,130,205);
  fill(154,65,7); //para un color de relleno marron.
  rect(138,620, 80, 69);
  ellipse(264,573,102,102);
  fill(255,255,255);
  ellipse(264,573,69,69);
  fill(17,71,131); //para un color de relleno azul.
  beginShape(TRIANGLE_FAN);
  vertex(308, 675);
  vertex(528, 527); 
  vertex(490,855); 
  vertex(630, 743);
  vertex(528, 527); 
  endShape();
  fill(0,0,0); //para un color de relleno negro.
  beginShape(TRIANGLE_FAN);
  vertex(538, 819);
  vertex(566, 855); 
  vertex(678,707); 
  vertex(710, 743);
  vertex(566, 855); 
  endShape();
}
void mouseClicked() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void keyPressed() {
  if (value == 0) {
    value = 155;
  } else {
    value = 0;
  }
}

