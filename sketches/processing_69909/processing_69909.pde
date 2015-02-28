
class Collina {
  
  int x;
  int y;
  int diamX;
  int diamY;
  color c;
  
  Collina(int x, int y, int diamX, int diamY, color c){
    this.x = x;
    this.y = y;
    this.diamX = diamX;
    this.diamY = diamY;
    this.c = c;
  }
  
 void display(){
    fill(this.c);
    stroke(0);
    ellipse(this.x,this.y,this.diamX,this.diamY);
  }
  
  
  
   //verifica se l'utente ha cliccato all'interno della collina 
  boolean isInsideCollina(int x, int y, int dimensioneFinestra) {
    
     if((x >= 0) && (y >= 0) && ((pow((x-this.x),2)/ pow((diamX/2),2))+(pow((y-this.y), 2)/pow((diamY/2),2))) <= 1){
        return true;
     } else {
        return false;
     }
  }
}

