
//Exercici 3: cursor
float llargadaLinia, midaElipse, midaElipse2, diferenciaElipse;
color colorStroke, colorA, colorB, interA, interB, interC;
void setup() {
  size(255, 255);
  llargadaLinia = 30;
  colorStroke = color(255);
  colorA = color(#797CF5);
  colorB = color(#A9F2A9);
  interA = lerpColor(colorA, colorB, 0.2);
  interB = lerpColor(colorA, colorB, 0.5);
  interC = lerpColor(colorA, colorB, 0.8);
}
void draw() {
  background(#B0AEB7);
  fill(mouseX);
  strokeWeight(3);
  //canvia mida esferes
  midaElipse = mouseY*0.6;
  midaElipse2 = mouseY * 0.2;


  //linies
  line(mouseX-llargadaLinia, mouseY-llargadaLinia, 
  mouseX+llargadaLinia, mouseY+llargadaLinia);

  line(mouseX+llargadaLinia, mouseY-llargadaLinia, 
  mouseX-llargadaLinia, mouseY+llargadaLinia);
  //rodones
  ellipse(mouseX, mouseY, midaElipse, midaElipse);
  noStroke();
  fill(interA+mouseX);
  ellipse(mouseX, mouseY, midaElipse-midaElipse*0.20, midaElipse-midaElipse*0.20);
  fill(interB+mouseX);
  ellipse(mouseX, mouseY, midaElipse-midaElipse*0.40, midaElipse-midaElipse*0.40);
  fill(interC+mouseX);
  ellipse(mouseX, mouseY, midaElipse-midaElipse*0.80, midaElipse-midaElipse*0.80);
  //rodones petites
  strokeWeight(3);
  stroke(colorStroke);
  fill(interA+mouseX);
  ellipse(mouseX-llargadaLinia, mouseY-llargadaLinia, midaElipse2, midaElipse2);
  ellipse(mouseX+llargadaLinia, mouseY-llargadaLinia, midaElipse2, midaElipse2);
}

