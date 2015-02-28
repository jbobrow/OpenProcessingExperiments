
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Name: Joia
// Version: 1.5
// Creation Date: August/September 2011
// Description: Code developed as an activity for classroom "Visualization Technics at Computer" at COPPE UFRJ(Universidade Federal do Rio de Janeiro)
// Authors: Marcos Ferreira de Carvalho, Marcos Paulo do Carmo and Paulo Frederico F. Monteiro Jr.
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
class clsJoia
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
{
  //Define as variáveis
  int posXInicial;
  int posYInicial;
  int numLinhas;
  int numColunas;
  int numDeslocamentoMovimento;
  int tamQuadradoTabuleiro;
  int maxJoias;
  int numJoias; // total of diferent jewels to generate 
  int intMaiorLinhaJoiaIgual;
  boolean bolJaGerouJoias;
  boolean bolJaDesenhouJoias;

  //Guardam as cores das jóias
  color colCorJoia1;
  color colCorJoia2;
  color colCorJoia3;
  color colCorJoia4;
  color colCorJoia5;
  color colCorJoia6;
  color colCorJoia7;
  color colCorJoia8;
  color colCorJoia9;  

  //Matrizes com as informações das jóias
  PVector[][] matrixPosJoia;
  int[][] matrizJoia;
  int[][] matrizJoiaIgual;

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  clsJoia (int pPosXInicial, int pPosYInicial, int pNumLinhas, int pNumColunas, int pTamQuadrado, int pDeslocamentoMovimento) {
    //Inicializa as variáveis
    this.posXInicial = pPosXInicial;
    this.posYInicial = pPosYInicial;
    this.numLinhas = pNumLinhas;
    this.numColunas = pNumColunas;
    this.numDeslocamentoMovimento = pDeslocamentoMovimento;
    this.tamQuadradoTabuleiro = pTamQuadrado;
    this.intMaiorLinhaJoiaIgual = -1;
    this.bolJaGerouJoias = false;
    this.bolJaDesenhouJoias = false;
    this.matrixPosJoia = new PVector[this.numColunas][this.numLinhas];
    this.matrizJoia = new int[this.numColunas][this.numLinhas];
    this.matrizJoiaIgual = new int[this.numColunas][this.numLinhas];
    this.colCorJoia1 = #FF0000;  //vermelho
    this.colCorJoia2 = #FFFF00;  //amarelo
    this.colCorJoia3 = #00FF00;  //verde
    this.colCorJoia4 = #00FFFF;  //ciano
    this.colCorJoia5 = #0000FF;  //azul
    this.colCorJoia6 = #909090;  //cinza
    this.colCorJoia7 = #FFFFFF;  //branco
    this.colCorJoia8 = #000000;  //preto
    this.colCorJoia9 = #996633;  //marrom
    this.maxJoias = 9;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void SetNumJoias(int pNumJoias) {
    this.numJoias = pNumJoias;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void GerarJoias() {
    //Gera as matrizes necessárias para as jóias
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {
        this.matrixPosJoia[indexColunas][indexLinhas] = new PVector(this.posXInicial + (indexColunas * this.tamQuadradoTabuleiro), this.posYInicial + (indexLinhas * this.tamQuadradoTabuleiro));
        this.matrizJoia[indexColunas][indexLinhas] = FGeraJoiaAleatoriamente();
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void DesenharJoias() {
    //Desenha as jóias
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {
        FDesenhaJoias(indexLinhas, indexColunas, this.matrizJoia, this.matrixPosJoia, this.tamQuadradoTabuleiro);
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void CascatearJoias() {
    //Realiza o movimento de cascata das jóias para cada coluna
    for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {

      //Percorre da penúltima linha até a primeira linha
      for (int indexLinhas = this.numLinhas - 2; indexLinhas >= 0; indexLinhas--) {

        //Verifica se a célula tem jóia e se a célula abaixo está vazia e move a célula com jóia para baixo
        if ( (this.matrizJoia[indexColunas][indexLinhas] != 0) && (this.matrizJoia[indexColunas][indexLinhas + 1] == 0) ) {
          this.matrixPosJoia[indexColunas][indexLinhas].y = this.matrixPosJoia[indexColunas][indexLinhas].y + this.numDeslocamentoMovimento;
          this.matrixPosJoia[indexColunas][indexLinhas + 1].y = this.matrixPosJoia[indexColunas][indexLinhas + 1].y - this.numDeslocamentoMovimento;

          //A cada ciclo de movimento troca o valor das jóias
          if ( abs(this.matrixPosJoia[indexColunas][indexLinhas + 1].y - this.matrixPosJoia[indexColunas][indexLinhas].y) == this.tamQuadradoTabuleiro) {
            this.TrocarJoiaMatriz(indexLinhas, indexColunas, indexLinhas + 1, indexColunas);
          }
        }

        //Verifica se é a primeira linha e se ela está vazia
        if ( (indexLinhas == 0) && (this.matrizJoia[indexColunas][indexLinhas] == 0) ) {
          //Gera uma nova jóia
          this.matrixPosJoia[indexColunas][indexLinhas] = new PVector(this.posXInicial + (indexColunas * this.tamQuadradoTabuleiro), this.posYInicial + (indexLinhas * this.tamQuadradoTabuleiro));
          this.matrizJoia[indexColunas][indexLinhas] = FGeraJoiaAleatoriamente();
        }
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void VerificarJoiasIguais() {
    //Declara as variáveis
    boolean flagAchouTres = false;
    this.intMaiorLinhaJoiaIgual = -1;

    //Verifica Joias iguais nas linhas
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < (this.numColunas-1); indexColunas++) {
        if (indexColunas < (this.numColunas-2)) {
          if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas+1][indexLinhas]) &&
            (this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas+2][indexLinhas]) &&
            (flagAchouTres == false)) {
            this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
            this.matrizJoiaIgual[indexColunas+1][indexLinhas] = 1;
            this.matrizJoiaIgual[indexColunas+2][indexLinhas] = 1;
            flagAchouTres = true;
            this.intMaiorLinhaJoiaIgual = this.intMaiorLinhaJoiaIgual < indexLinhas ? indexLinhas : this.intMaiorLinhaJoiaIgual;
            indexColunas++;
          }
          else if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas+1][indexLinhas]) &&
            (flagAchouTres == true)) {
            this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
            this.matrizJoiaIgual[indexColunas+1][indexLinhas] = 1;
          }
          else {
            flagAchouTres = false;
          }
        }
        else if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas+1][indexLinhas]) &&
          (flagAchouTres == true)) {
          this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
          this.matrizJoiaIgual[indexColunas+1][indexLinhas] = 1;
        }
        else {
          flagAchouTres = false;
        }
      }
      flagAchouTres = false;
    }

    //Verifica Joias iguais nas Colunas
    flagAchouTres = false;
    for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {
      for (int indexLinhas = 0; indexLinhas < (this.numLinhas-1); indexLinhas++) {
        if (indexLinhas < (this.numLinhas-2)) {
          if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas][indexLinhas+1]) &&
            (this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas][indexLinhas+2]) &&
            (flagAchouTres == false)) {
            this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
            this.matrizJoiaIgual[indexColunas][indexLinhas+1] = 1;
            this.matrizJoiaIgual[indexColunas][indexLinhas+2] = 1;
            this.intMaiorLinhaJoiaIgual = this.intMaiorLinhaJoiaIgual < (indexLinhas + 2) ? indexLinhas + 2 : this.intMaiorLinhaJoiaIgual;
            flagAchouTres = true;
            indexLinhas++;
          }
          else if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas][indexLinhas+1]) &&
            (flagAchouTres == true)) {
            this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
            this.matrizJoiaIgual[indexColunas][indexLinhas+1] = 1;
            this.intMaiorLinhaJoiaIgual = this.intMaiorLinhaJoiaIgual < (indexLinhas + 1) ? indexLinhas + 1 : this.intMaiorLinhaJoiaIgual;
          }
          else {
            flagAchouTres = false;
          }
        }
        else if ((this.matrizJoia[indexColunas][indexLinhas] == this.matrizJoia[indexColunas][indexLinhas+1]) &&
          (flagAchouTres == true)) {
          this.matrizJoiaIgual[indexColunas][indexLinhas] = 1;
          this.matrizJoiaIgual[indexColunas][indexLinhas+1] = 1;
          this.intMaiorLinhaJoiaIgual = this.intMaiorLinhaJoiaIgual < (indexLinhas + 1) ? indexLinhas + 1 : this.intMaiorLinhaJoiaIgual;
        }
        else {
          flagAchouTres = false;
        }
      }
      flagAchouTres = false;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FImprimeMatrizJoiasIguais() {
    //Imprime os valores das jóias iguais
    int intLinhaAtual = 0;
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {
        if (intLinhaAtual != indexLinhas) {
          intLinhaAtual = indexLinhas;
          println("");
        }
        print(this.matrizJoiaIgual[indexColunas][indexLinhas] + ";");
      }
    }
    println("");
    println("");
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FImprimeMatrizJoias() {
    //Imprime os valores das jóias
    int intLinhaAtual = 0;
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {
        if (intLinhaAtual != indexLinhas) {
          intLinhaAtual = indexLinhas;
          println("");
        }
        print(this.matrizJoia[indexColunas][indexLinhas] + ";");
      }
    }
    println("");
    println("");
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  int ApagarJoiasIguais() {
    //Declara as variáveis
    int intTotJoiasApagadas = 0;

    //Varre as matrizes apagando as jóias iguais
    for (int indexLinhas = 0; indexLinhas < this.numLinhas; indexLinhas++) {
      for (int indexColunas = 0; indexColunas < this.numColunas; indexColunas++) {

        //Verifica se a célula foi marcada para ser apagada
        if (this.matrizJoiaIgual[indexColunas][indexLinhas] == 1) {

          //Apaga a célula das matrizes
          this.matrizJoia[indexColunas][indexLinhas] = 0;
          this.matrizJoiaIgual[indexColunas][indexLinhas] = 0;
          intTotJoiasApagadas++;
        }
      }
    }
    return (intTotJoiasApagadas);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void TrocarJoiaMatriz(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    //Inicializa as variáveis
    int valorJoiaAux;
    PVector posJoiaAux = new PVector(0.0, 0.0);

    //Realiza a troca das posições das jóias
    posJoiaAux = this.matrixPosJoia[pColSel1][pLinhaSel1];
    this.matrixPosJoia[pColSel1][pLinhaSel1] = this.matrixPosJoia[pColSel2][pLinhaSel2];
    this.matrixPosJoia[pColSel2][pLinhaSel2] = posJoiaAux;

    //Realiza a troca dos valores das jóias
    valorJoiaAux = this.matrizJoia[pColSel1][pLinhaSel1];
    this.matrizJoia[pColSel1][pLinhaSel1] = this.matrizJoia[pColSel2][pLinhaSel2];
    this.matrizJoia[pColSel2][pLinhaSel2] = valorJoiaAux;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  int FGeraJoiaAleatoriamente() {
    //Gera uma nova jóia aleatoriamente
    //    int intResult = int(random(1,pmaxJoias + 1));
    int intResult = int(random(1, numJoias + 1));
    return (intResult);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void MoverJoias(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    //Verifica se o movimento é na vertical
    if (pLinhaSel1 != pLinhaSel2) {
      //Chama a função correspondente dependendo do sentido do movimento
      if (pLinhaSel1 < pLinhaSel2) {
        this.MoverJoia1ParaBaixoEJoia2ParaCima(pLinhaSel1, pColSel1, pLinhaSel2, pColSel2);
      }
      else {
        this.MoverJoia1ParaCimaEJoia2ParaBaixo(pLinhaSel1, pColSel1, pLinhaSel2, pColSel2);
      }
    }
    //Para os movimentos na horizontal
    else {
      //Chama a função correspondente dependendo do sentido do movimento
      if (pColSel1 < pColSel2) {
        this.MoverJoia1ParaDireitaEJoia2ParaEsquerda(pLinhaSel1, pColSel1, pLinhaSel2, pColSel2);
      }
      else {
        this.MoverJoia1ParaEsquerdaEJoia2ParaDireita(pLinhaSel1, pColSel1, pLinhaSel2, pColSel2);
      }
    }
  }  

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void MoverJoia1ParaBaixoEJoia2ParaCima(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    this.matrixPosJoia[pColSel1][pLinhaSel1].y = this.matrixPosJoia[pColSel1][pLinhaSel1].y + this.numDeslocamentoMovimento;
    this.matrixPosJoia[pColSel2][pLinhaSel2].y = this.matrixPosJoia[pColSel2][pLinhaSel2].y - this.numDeslocamentoMovimento;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void MoverJoia1ParaCimaEJoia2ParaBaixo(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    this.matrixPosJoia[pColSel1][pLinhaSel1].y = this.matrixPosJoia[pColSel1][pLinhaSel1].y - this.numDeslocamentoMovimento;
    this.matrixPosJoia[pColSel2][pLinhaSel2].y = this.matrixPosJoia[pColSel2][pLinhaSel2].y + this.numDeslocamentoMovimento;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void MoverJoia1ParaDireitaEJoia2ParaEsquerda(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    this.matrixPosJoia[pColSel1][pLinhaSel1].x = this.matrixPosJoia[pColSel1][pLinhaSel1].x + this.numDeslocamentoMovimento;
    this.matrixPosJoia[pColSel2][pLinhaSel2].x = this.matrixPosJoia[pColSel2][pLinhaSel2].x - this.numDeslocamentoMovimento;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void MoverJoia1ParaEsquerdaEJoia2ParaDireita(int pLinhaSel1, int pColSel1, int pLinhaSel2, int pColSel2) {
    this.matrixPosJoia[pColSel1][pLinhaSel1].x = this.matrixPosJoia[pColSel1][pLinhaSel1].x - this.numDeslocamentoMovimento;
    this.matrixPosJoia[pColSel2][pLinhaSel2].x = this.matrixPosJoia[pColSel2][pLinhaSel2].x + this.numDeslocamentoMovimento;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoias (int pLinha, int pColuna, int[][] pMatrizJoia, PVector[][] pMatrizPosJoia, int pTamQuadrado) {
    //Insere a figura correspondente ao valor contido no vetor
    switch(pMatrizJoia[pColuna][pLinha]) {
    case 1:
      FDesenhaJoia01(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 2:
      FDesenhaJoia02(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 3:
      FDesenhaJoia03(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 4:
      FDesenhaJoia04(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 5:
      FDesenhaJoia05(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 6:
      FDesenhaJoia06(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 7:
      FDesenhaJoia07(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 8:
      FDesenhaJoia08(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    case 9:
      FDesenhaJoia09(pMatrizPosJoia[pColuna][pLinha].x, pMatrizPosJoia[pColuna][pLinha].y, pTamQuadrado);
      break;
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia01(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia1);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia02(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia2);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia03(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia3);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia04(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia4);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia05(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia5);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia06(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia6);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia07(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia7);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia08(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia8);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void FDesenhaJoia09(float pPosX, float pPosY, int pTamLadoQuadrado) {
    fill (this.colCorJoia9);
    ellipse((pPosX + pTamLadoQuadrado/4), (pPosY + pTamLadoQuadrado/4), pTamLadoQuadrado/2, pTamLadoQuadrado/2);
  }
}


