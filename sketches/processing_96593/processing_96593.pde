
// autor: Luiz Ernesto Merkle
// contexto: Computação 1 
// curso: Arquitetura e Urbanismo 
// licença: gpl 3 
// ano: 2013 
// motivação: exercícios de Forma 1 em Computação 1

// Este debuxo ilustra como fazer um módulo 4x4. 
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
    2, 1, 0, 0
  }
  , 
  {
    1, 0, 2, 0
  }
  , 
  {
    1, 1, 0, 1
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
  noStroke();
  smooth();
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
        // 
      break;
      case 1: 
       fill(100);
       rect(j*larguracoluna, i*alturalinha, larguracoluna, alturalinha );
        break;
      case 2:
      fill(255,0,0); 
       ellipse(j*larguracoluna+larguracoluna/2, i*alturalinha+alturalinha/2, larguracoluna, alturalinha); 
        // ainda não faz nada
        break; 
      default:;
      }
    }
}
