
public abstract class Animaciones{

  private int  pagina, tipo, estilo;
  private float posX, posY;

  private PFont fuenteUno, fuenteDos, fuenteTres, fuenteCuatro;

  private String linea;
  private boolean activar;

  Animaciones(int tPosX, int tPosY, int tPagina, int tTipo, int tEstilo, String tLinea){
    posX=tPosX;
    posY=tPosY;
    pagina=tPagina;
    tipo=tTipo;
    linea=tLinea;
    estilo=tEstilo;
    fuenteUno=loadFont("Helvetica-28.vlw");
    fuenteDos=loadFont("Helvetica-24.vlw");
    fuenteTres=loadFont("Helvetica-21.vlw");
    fuenteCuatro = loadFont("HelvNueOutline-28.vlw");
    activar=false;
   


  }

  public void pintar(){

    if(pagina==1){
      textFont(fuenteUno);
      if(estilo==1){
    textFont(fuenteCuatro);
    fill(181,35,35);
    }else{
    fill(255);
    }
    }
    if(pagina==2){
      textFont(fuenteDos);
    }
    if(pagina==3 || pagina==4){
      fill(255);
      textFont(fuenteTres,21);
    }
    
  }
  public abstract boolean getFin();

  public int getPagina(){
    return pagina;
  }
  public int getTipo(){
  return tipo;
  }

  public abstract void animar();
  public abstract void agregarElementos();
  
  
  

  public boolean confirmarClick(){
    
    if(mouseX>posX && mouseX<(posX+(15*(linea.length()))) && mouseY<posY && mouseY>posY-20){
      if(activar == false){
      activar=true;
      }else{
      activar=false;
      }
      agregarElementos();
      

 
  }
  return activar;
  }



}


