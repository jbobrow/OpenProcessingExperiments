
//Monyse Takaki
//Forma a ser usada no trabalho de conclusão
  size (600, 600);
  background (0);
  fill (193, 27, 105, 90); //O terceiro elemento define a transparência
  stroke (193, 27, 105, 90);
  strokeCap (ROUND); //Forma do traçado
  smooth (); //Suaviza os traçados
  //Círculos centrais
  for (int x = 150; x<550; x=x+150){
  ellipse (x, 300, 300, 300);
  }
  //Círculos do topo
  for (int x= 225; x<=375; x=x+150){
  ellipse (x, 175, 300, 300);
  }
  //Círculos inferiores
  for (int x = 225; x<=375; x=x+150){
    ellipse (x, 435, 300, 300);
  }
