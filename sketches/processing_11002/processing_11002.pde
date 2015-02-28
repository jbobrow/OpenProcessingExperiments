
class Punkt{
  Point p; // farbiger Punkt
  Point v; // Bewegungsvektor der Punkte  
  
  
  // Punkte werden festgelegt
  public Punkt(int x, int y, int vx, int vy, int r, int g, int b){
    p=new Point(x,y);
    v=new Point(vx,vy);
  }
  
  // Punkte werden gezeichnet
  public void draw(){
    p.x+=v.x; /// Bewegung der Punkte durch Bewegungsvektor
    p.y+=v.y; // Bewegung der Punkte durch Bewegungsvektor
    strokeWeight(random (35)); // Größe der Punkte wird über Rand festgelegt (zufäälig von 0 bis 25)
    stroke(r,g,b); // Farbe der Punkt wird über Random festgelegt
    point(p.x,p.y); // Punkt wird gezeichnet
    if (p.y > height || p.y < 0) punkte.remove(this); // Punkte über dem Rand werden gelöscht
    if (p.x > width  || p.x < 0) punkte.remove(this);
    if (v.x == 0 && v.y == 0) punkte.remove(this); // entfernt Vektoren mit (0/0)

  }
  
}

