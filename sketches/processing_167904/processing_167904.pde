
Table tabela;
PShape parana;
PShape municipio;
int linhas;

void setup() {
  size(760, 500);
  parana = loadShape("https://www.dropbox.com/s/hmewmj853u3273d/parana-municipios.svg?dl=0");
  tabela = loadTable("https://www.dropbox.com/s/kmx5rvlfvc6e252/parana-densidade2010.csv?dl=0", "header");  
  linhas = tabela.getRowCount();
  noLoop();
}

void draw() {
  background(150, 255, 150);

  //determina o máximo e o mínimo, segundo Fry
  float minimo = MAX_FLOAT;
  float maximo = MIN_FLOAT;
  for (int m = 0; m < linhas; m++) {
    float value = tabela.getFloat(m, 1);
    if (value > maximo) {
      maximo = value;
    }
    if (value < minimo) {
      minimo = value;
    }
  }

  //vai puxando os números e cada município
  for (int i = 0; i < linhas; i++) {
    float x = tabela.getFloat(i, 1);

    String nome = tabela.getString(i, 0);
    municipio = parana.getChild(nome);

    float valor = tabela.getFloat(i, 1);

      println(nome);

    municipio.disableStyle();

    //ajusta a escala de cores de acordo com os valores
    //é bom considerar se deixa o minimo ou zero
    int cor = round(map(valor, minimo, maximo, 0, 255));

    //pinta de acordo com o valor
    fill(cor);

    //querendo, dá pra sinalizar os maiores e menores com uma condição
    if (valor<3000) {
      noStroke();
    }
    else {
      stroke(255, 0, 0);
    }
    //finalmente chama o pedaço de svg do município
    shape(municipio, 20, 20);
  }
  println(minimo);
  println(maximo);
}


