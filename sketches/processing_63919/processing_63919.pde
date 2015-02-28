
class bottone{
  int x;
  int y;
  int larghezza;
  int altezza;
  String testo;
  boolean cliccato;
  
  bottone(int x,int y, int larghezza, int altezza, String testo){
   this.x=x;
   this.y=y;
   this.larghezza=larghezza;
   this.altezza=altezza; 
   this.testo=testo;
   cliccato=false;
  }
  boolean contains(int posX, int posY){
    if(posX>x && posX<x+larghezza && posY>y && posY<y+altezza)
      return true;
    else
      return false;
  }
  void disegna(){
    if(cliccato)
      fill(200,10,20);
    else
      fill(100,100,100);
    rect(x,y,larghezza,altezza);
    fill(0);
    text(testo,x+5,y+5,x+larghezza-5,y+altezza-5);
  }
  void cliccato(){
    cliccato=true;
  }
  void noCliccato(){
    cliccato=false;
  }
  
  
}

