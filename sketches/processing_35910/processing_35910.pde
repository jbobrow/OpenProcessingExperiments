
class Bub {

  int posX;
  int posY;
  int posYD;
  int posYE; 
  int dim;
  int velocitat;
  int strkWeight;
  int colorPerimetre;
  int colorFill;
  
  Bub(int lPosX, int lPosY, int ldim) {
    posX = lPosX;
    posY = lPosY;
    posYD = lPosY;
    posYE = lPosY;
    dim = ldim;
    velocitat = round(random(4, 4));
//    beta = radians(0);
//    cosBeta = cos(beta);
//    sinBeta = sin(beta);
    strkWeight = 1;
    colorPerimetre = color(55,25,7,95);
    colorFill = color(45,15,5);    
  }

  void run() {
    update();
    render();
  }


  void update() {
    int direccio = (cosPhi > 0) ? 1 : -1;
    int top = (direccio > 0) ? 0 : pg.height-dim;
    
    if(posY > dim + direccio && posY < pg.height - dim + direccio){
      if(pix[round(posY - (dim+1) * direccio) * pg.width + round(posX)] == C_BACKGROUND){
        posY = round(posY - velocitat * direccio);
        posY = (direccio > 0) ? max(posY, dim) : min(posY, pg.height-dim);
      }
      
    }    
  }
  

  void render() {
    pg.ellipseMode(RADIUS);
    pg.strokeWeight(strkWeight); pg.stroke(colorPerimetre); pg.fill(colorFill);
    pg.noStroke();
    pg.ellipse( posX, posY, dim+0.5, dim);//*cosBeta - 4*sinBeta, 4*cosBeta - dim*sinBeta);
    //pg.ellipse( posX, posY+dim, dim, dim);
  }


}

