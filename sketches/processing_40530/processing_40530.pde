
class Capa {
  PGraphics g;
  List<Visualizable> elementos=new ArrayList<Visualizable>();


  void beginDraw(){
  
    g.beginDraw();
     g.colorMode(HSB, 100);
    g.smooth();

  }
  void endDraw(){
    g.endDraw();
  }
  
  boolean addElemento(Visualizable v){
    if(elementos.contains(v)){
      return true;
    }
    elementos.add(v);
    return false;
  
  }
  
  void reset(Visualizable select){
    for(Visualizable v:elementos)
    if(!select.equals(v)) v.reset(this);
    else v.repinta(this);
  }
  
}

