
class Ball{
 int raggio;
 color colore;
 
  Ball(int c, int canale){
    this.raggio=10;
    switch(canale){
      case 0:
        this.colore=color(c,0,0);
        break;
      case 1:
        this.colore=color(0,c,0);  
        break;
      case 2:
        this.colore=color(0,0,c);
        break;
    }
  }

  void display(int verso){
    ellipseMode(CENTER);
    noStroke();
    fill((colore));
    raggio=raggio+20 * verso;
    ellipse(width/2, height/2, raggio, raggio);
  }



}


