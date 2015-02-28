
  size (900,350);
  background (21,176,234); 

strokeWeight(3);

rect(260,210,420,6); //horizontal superior
rect(260,270,420,6);  // horizontal inferior

rect(295,210,5,88); // vertical 1
rect(537,210,5,88); // vertical 2
rect(650,210,5,88); // vertical 3

fill(21,234,72);  //cor chão
rect(0,300,900,450); //retângulo chão

strokeWeight(2);
fill(162,255,243); //cor janelas
rect(301,216,235,54); //janelas maiores
rect(543,216,106,54); //janelas menores

  strokeWeight(1); //linhas das janelas
  
for (int i = 542; i < 640; i = i+36) { //divisorias janelas menores
  line(i, 268, i, 215);
}

for (int i = 300; i < 525; i = i+30) { //divisorias janelas maiores
  line(i, 268, i, 215);
}








