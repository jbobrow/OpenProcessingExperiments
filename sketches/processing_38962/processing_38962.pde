
public class Peca {
  // Classe para armazenar informacao das pecas do jogo. 
  int posAtual;
  PImage imagem = new PImage();
  Boolean isBlack;

  public Peca( ) {
  }

  Peca(int posAtual, PImage img) {

    imagem = img;
    setPosicaoAtual(posAtual);
    isBlack=false;
  }

  PImage getImagem() {
    return imagem;
  }

  void  setIsBack() {
    isBlack = true;
  }

  boolean getIsBlack() {
    return isBlack;
  }

  void setPosicaoAtual(int pos) {
    this.posAtual = pos;
  }

  int getPosicaoAtual() {
    return posAtual;
  }
}


