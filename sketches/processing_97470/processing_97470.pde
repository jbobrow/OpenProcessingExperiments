
// Cindy Feijó 2S2012
// Reforço 1 - original
// Usando cores de máxima e mínima
size (200,200);

background (148, 0, 211); //DarkViolet 

strokeWeight (3);

stroke (255, 99, 71); //Tomato

line (30,20, 140,20); // linha do topo

for (int x=20; x<120; x=x+10) { //condição de repetição das linhas
  line(30, x*3, 140, x*2); //linhas repetidas
}
