
PFont f;
PImage mapa;

String terminal;
String[] dados = {
  "BAIRRO ALTO  13  12  367  171", 
  "BARREIRINHA  18  31  267  85", 
  "BOA VISTA  16  38  285  123", 
  "BOQUEIRÃO  36  52  344  391", 
  "CABRAL  58  54  285  162", 
  "CAIUA  11  17  108  321", 
  "CAMPINA DO SIQUEIRA  38  46  172  235", 
  "CAMPO COMPRIDO  39  32  133  265", 
  "CAPÃO DA IMBUIA  39  31  357  226", 
  "CAPÃO RASO  40  57  202  368", 
  "CARMO  29  32  313  355", 
  "CENTENÁRIO  19  21  393  298", 
  "CIC  21  27  134  384", 
  "FAZENDINHA  30  38  145  323", 
  "GUADALUPE  52  68  260  210", 
  "HAUER  35  43  290  321", 
  "OFICINAS  15  14  365  262", 
  "PC. CARLOS GOMES  25  17  251  223", 
  "PC. RUI BARBOSA  102  79  234  228", 
  "PC. TIRADENTES  62  50  240  210", 
  "PINHEIRINHO  63  67  208  417", 
  "PORTÃO  57  68  189  304", 
  "SANTA CANDIDA  33  53  318  78", 
  "SANTA FELICIDADE  17  27  129  149", 
  "SANTOS ANDRADE  17  11  250  213", 
  "SITES  5  7  285  204", 
  "SÍTIO CERCADO  33  28  259  457"
};

int D2012, D2013, x, y;

void setup() {
  size(630, 675);
  //textAlign(CENTER);
  imageMode(CENTER);
  noStroke();

  mapa = loadImage("mapa.png");
  //dados = loadStrings("ocorrencias.txt");

  f = loadFont("AndaleMono-38.vlw");
  textFont(f);
}

void draw() {
  background(250);
  image(mapa, 430 / 2, height / 2);
  for (int i = 0; i < dados.length; i++) {
    fill(#E87575, 200);
    String[] coluna = split(dados[i], "  ");
    terminal = coluna[0];
    D2012 = int(coluna[1]);
    D2013 = int(coluna[2]);
    x = int(coluna[3]);
    y = int(coluna[4]);
    float dist = dist(mouseX, mouseY, x, y);

    if (dist <= 5) {
      ellipse(x, y, D2013, D2013);
      fill(0);
      textSize(16);
      text(D2013, mouseX, y - (D2013/2) - 5);
      textSize(30);
      text(terminal, width - 200, height - 30);


      fill(0, 100, 0);
      rect(width - 100, height - 250, 10, -D2013*5);
      fill(0, 0, 100);
      rect(width - 87, height - 250, 10, -D2012*5);
    }
    else {
      ellipse(x, y, 10, 10);
    }



    //println(terminal + " ("+ x + "," + y+ ")");
  }
}
void mouseReleased() {
  //trava = true;
}



