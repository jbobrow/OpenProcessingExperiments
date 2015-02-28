
PShape network; //Nombra la variable de SVG

void setup() {
  size(480, 120);
  smooth();
  network = loadShape("network.svg"); //Dice cual es la variable
}

void draw() {
  background(0);
  shape(network, 30, 10); //Llama y modifica el "shape" vectorial
  shape(network, 180, 10, 280, 280);
}


