
class Caja extends Rectangle{
  color relleno, borde;
  int anchoborde;
  float peso;
  
  
  Caja(int tempx, int tempy, int tempwidth, int tempheight, float temppeso){
    super(tempx,tempy,tempwidth,tempheight);
    relleno = color(#955F24);
    borde =color(#5F3C16);
    anchoborde=2;
    peso=temppeso;
    
  }
  
  void Actualiza(int tempx, int tempy){
    this.setLocation(tempx,tempy);
  }
  
  void Dibuja(){
    fill(relleno);
    stroke(borde);
    strokeWeight(anchoborde);
    rect(x,y,width,height);  
    stroke(0);
    strokeWeight(1);
    for(int i=width/4; i<width; i += width/4) line (x+i,y+(anchoborde/2),x+i,y+height-(anchoborde/2));
  }
  
  void Copia(Caja destino){
    destino.setBounds(x,y,width,height);
  }  
  
  void Dimension(int tempwidth, int tempheight, float temppeso){
    this.resize(tempwidth, tempheight);    
    peso=temppeso;
  }
  
  
}

