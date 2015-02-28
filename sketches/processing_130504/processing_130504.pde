
/*
    Copyright (C) 2012  Luiz Ernesto Merkle
 
 This sketch is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 This sketch is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

// cada elemento desta matriz representa um tipo 
// de desenho a ser realizado em um reticulado 
// Podem ser desenhados tantos quanto são os int
// Neste exemplo, são mostrados apenas tres tipos
int [][] prancha = {
  {
    1, 0, 1, 0
  }
  , 
  {
    0, 1, 0, 0
  }
  , 
  {
    1, 0, 2, 0
  }
  , 
  {
    1, 1, 2, 1
  }
  , 
  {
    0, 1, 0, 0
  }
  , 
  {
    1, 0, 2, 1
  }
};

// algumas variáveis são necessárias para se armazenar
// a largura e a altura das colunas
// O esboço é feito tal que ao se aumentar a matriz, se aumentam as colunas e linhas, automaticamente. 

int linhasp;      // numero de linhas da matriz prancha[][]
int colunasp;     // número de colunas da matriz prancha [][]
int larguracoluna; // largura das colunas
int alturalinha;  // altura das linhas 

void setup() {
  size(400, 400);
  background(0, 255, 255);
  // recuperam-se a largura e o comprimento da matriz
  linhasp = prancha.length;
  colunasp = prancha[0].length; 
  // calcula-se largura e altura de cada célula
  larguracoluna = width/colunasp;  // largura relativa ao tamanho da tela
  alturalinha = height/linhasp;    // altura relativa ao tamanho da tela 
  noLoop();
}

void draw() {
  // pecorre-se o reticulado, linha por linha
  for (int j = 0; j < colunasp; j++)
    // célula por célula
    for (int i = 0; i<linhasp; i++)
    {
      // em cada célula, consulta-se a matriz, 
      //e chama-se uma função específica  
      // cada case do switch desenha tudo que precisa ser desenhado em cada
      // célula e termina com break
      switch (prancha[i][j]) {
      case 0: 
        desenho0();
        break;
      case 1: 
        desenho1(j*larguracoluna, i*alturalinha, larguracoluna, alturalinha );
        break;
      case 2:
        desenho2(j*larguracoluna, i*alturalinha, larguracoluna, alturalinha); 
        // ainda não faz nada
        break; 
      default:;
      }
    }
}

// desenha um quadrado 
void desenho0() {
} // não faz nada

// desenha um quadrado e um triângulo magenta
void desenho1(int posx, int posy, int l, int h) {
  fill(255);
  stroke(150);
  rect(posx, posy, l, h);
  //noStroke();
  fill(255, 0, 255); 
  triangle (posx+l, posy, posx, posy+h, posx+l, posy+h);
}

void desenho2(int posx, int posy, int l, int h) {
  fill(255);
  stroke(150);
  rect(posx, posy, l, h);
}

