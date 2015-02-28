
//Código original por Daniel Shiffman

class FlowField{
  //Um campo de fluxo é um array bidimensional de PVectors
  PVector[][] campo;
  int coluna,linha;
  int resolution; // tamanho de cada "célula" do campo de fluxo

  FlowField(int r){
    resolution = r;
    coluna = width/resolution;
    linha = height/resolution;
    campo = new PVector[coluna][linha];
    init();
  }

  void init(){
    //"reseed noise", gera um novo valor noise para obter um novo campo de fluxo.
    noiseSeed((int)random(10000));
    float xoff = 0;
    for(int i = 0; i<coluna; i++){
      float yoff = 0;
      for(int j = 0; j<linha; j++){
        //usa perlin noise to conseguir um angulo entre 0 e 2 PI
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        //transforma coordenada Polar para Cartesiana
        campo[i][j] = new PVector(cos(theta),sin(theta));
        yoff += 0.05;
      }
      xoff += 0.05;
    }
  }

  PVector lookup(PVector lookup) {
    int i = (int) constrain(lookup.x/resolution,0,coluna-1);
    int j = (int) constrain(lookup.y/resolution,0,linha-1);
    return campo[i][j].get();
  }
}




