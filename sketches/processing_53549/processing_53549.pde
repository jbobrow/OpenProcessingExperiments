
public class bote {
  int x, y, t, w, h;
  boolean selected=false;
  PImage botona;
  PImage botond;
  
  int numero;
    public bote(int _x, int _y, int _numero) {
    x=_x;
    y=_y;
    t=25;    
    w=x+t;
    h=y+t;
    numero=_numero;
    botona = loadImage("botea.jpg");
    botond = loadImage("boted.jpg");
  }
  void dibujar() {
    s.fill(255);
   if(s.mouseX>x&&s.mouseX<x+t&&s.mouseY>y&&s.mouseY<y+t||selected){    
     s.image(botona,x,y);
    if(s.mousePressed){
      selected=true;
    }
    
    }
   else{
    s.image(botond, x, y); 
   }
   if(selected){
     pin.seleccionado(false);
     ell.seleccionado(false);
     pintar();
     
    }/*
    for (int i=0;i<tools.size();i++) {
      if (tools.get(i)!=this) tools.get(i).seleccionado(false);
    }*/
    
  }
  void pintar() {
 println(activo());   
    if(mousePressed){
      
      background(fondo);
      estado.grabar();
    }
  }
  void seleccionado(boolean valor) {
    selected=valor;
  }
  boolean activo() {
    return selected;
  }
  int darNumero() {
    return numero;
  }
}


