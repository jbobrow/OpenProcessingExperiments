
class Ball{
  
  Rectangle r; // rechteckige "Unterkonstruktion" für die Fußbaelle
  Point v; // Bewegungsvektor der Baelle
  
  
  
  int RADIUS=6; // Groeße des Rechtecks (von der Groeße des Fußball-Bildes abhaengig)
  
  
  
  // "Ball" wird definiet
  public Ball(int x, int y, int vx, int vy){
    r=new Rectangle(x,y,RADIUS,RADIUS);
    v=new Point(vx,vy);
  }
  
  // Ball wird gezeichnet
  public void draw(){
    r.x+=v.x; // Ball bewegt sich mittels Bewegungsvektor v
    r.y+=v.y; // Ball bewegt sich mittels Bewegungsvektor v
    rect(r.x,r.y,r.width,r.height); // Rechteck wird gezeichnet
    if (r.x < 0+RADIUS|| r.x > width-RADIUS) v.x=-v.x; // Baelle prallen an der Seite ab
    if (r.y > height-RADIUS) baelle.remove(this); // Baelle werden am unteren Rand geloescht
    if (r.y > height-RADIUS) punkte = 0; // setzt die Punkte wieder auf null wenn ein Ball unten ankommt 
    imageMode(CENTER); // Fußballbild wird mittig ausgerichtet
    image(ball, r.x, r.y); //Fußballbild wird gezeichnet
  }
  
  // Kollisionserkennung
  public void kollision(Rectangle brett){ 
    if (r.intersects(brett)) baelle.remove(this); // Ball wird bei Kollision mit "Torwart" geloescht
    if (r.intersects(brett)) punkte += 1; // bei Kollision wird ein Punkt addiert
    if (punkte > highscore) highscore = punkte; // der hoechste Punktestand wird als highscore gespeichert
  }
}

