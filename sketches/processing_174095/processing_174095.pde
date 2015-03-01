
void setup() {
  size(800, 600);
  background(0);
  noSmooth(); //Evita algusn artefatos
  poligonoRegular(5);
}

void poligonoRegular(int n) {
  ellipse(400, 300, 200, 200);                                           //Cria um círculo inicial
  fill(0);                                                               //, para ser "esculpida" por segmentos pretos gerados pelo 
  for (int i = 0; i < n; i++) {                                          //repetido uso 
    arc(400, 300, 200, 200, 0 + (2*PI/n)*i, 2*PI/n+ (2*PI/n)*i, CHORD);  //da função arc gerando segmentos de um círculo delimitados pelo argumento chord.
  }                                                                      //O valor 2*PI/n delimita o trecho da circunferência referente a um lado do polígono, e para se
}                                                                        //definir a outra corda do círculo que definirá os próximos lados, você deve repetir a ação n vezes, 
                                                                         //onde n é o número de lados do polígno a ser gerado, adicionando sempre 2*PI/n.
                                                                         
