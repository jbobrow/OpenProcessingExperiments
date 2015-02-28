
class Marciano{
  //atributos
  boolean vivo;
  int Posx;
  int Posy;
  PImage dibujo;
  int tam;
  String nombre;

  //constructor
  Marciano(int x, int y, PImage foto, int t, String nom){
    this.Posx = x;    
    this.Posy = y;
    this.dibujo = foto;
    this.tam = t;
    this.nombre = nom;
    this.vivo = true;
  }
  //metodos
  public void pintar(){
    if (this.vivo == true ){
      image(this.dibujo,this.Posx,this.Posy,this.tam,this.tam*1.36);
    }
  }
  
  public void miDibujo(int x, int y){
    
  }
  
  public String darNombre(){
    return this.nombre;
  }
  public int darPosX(){
    if(this.vivo == true){
      return this.Posx;
    }
    else{
      return 0;
    }
  }

  public void Fvivo (){
    if(this.vivo ==true){
      this.vivo =false;
    }
    else{
      this.vivo = true;
    }
  }
  
  public boolean estaVivo(){
    return this.vivo;
  }

  public int over(int x, int y){
    int respuesta=0;
    if (this.vivo == true){
      if((x>=this.Posx) && (x<=(this.Posx+(this.tam/1)))){//verticales
        if((y>=this.Posy)&&(y<=(this.Posy+(this.tam*1.36)/1))){//horizontal
          //mostrar nombre
          respuesta = 1;
          this.vivo=false;
          return respuesta;
        }
      }
    }
    return respuesta;
  }
  public void moverHor(int direccion){
    if(this.Posx <= width-tam && direccion > 0)
      this.Posx = this.Posx+(2*direccion);    
    if(this.Posx >= 0 && direccion < 0)
      this.Posx = this.Posx+(2*direccion);
  }
 public void moverVer(int direccion){
    if(this.Posy <= height-40-(tam*1.36) && direccion > 0)
      this.Posy = this.Posy+(2*direccion);    
    if(this.Posy >= 0 && direccion < 0)
      this.Posy = this.Posy+(2*direccion);
  }
 public void huir(int pas){
   int cenX = int(this.Posx + (tam/2));
   int cenY = int(this.Posy + ((tam*1.36)/2));
   int disX = mouseX - cenX;
   int disY = mouseY - cenY;
//primer radio  
   if(abs(disX) <= 20 && abs(disY) <= 20){
     if(disX < 0)
       moverHor(pas);
     else
       moverHor(pas*-1);
     if(disY < 0)
      moverVer(pas);
     else
      moverVer(pas*-1);   
    return;  
   }
//segundo radio
   if(abs(disX) <= 40 && abs(disY) <= 40){
     if(disX < 0)
       moverHor(int(pas*0.5));
     else
       moverHor(int(pas*-0.5));
     if(disY < 0)
      moverVer(int(pas*0.5));
     else
      moverVer(int(pas*-0.5));     
   }  
 }
 
 public void temblar(int pas){
   int marD;
     marD = int(random(0,100));
    if(marD<=25)
      this.moverHor(pas);
    if(marD>25 && marD<=50)
      this.moverHor(pas*-1);
    if(marD>50 && marD<=75)
      this.moverVer(pas*-1);
    if(marD>75)
      this.moverVer(pas);
 }

}

