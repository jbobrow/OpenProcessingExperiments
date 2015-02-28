
Boule rouge;
float size ;
float xpos, ypos;    
float xspeed = 2.8;
float yspeed = 2.2;
int xdirection = 1;
int ydirection = 1;

void setup(){
  size(1200,800);
  ellipseMode(CENTER);
  background(0);
  rouge = new Boule(50);
  xpos = width/2;
  ypos = height/2;
}
void draw(){
  background(0);
  rouge.affiche(0, 0);
}
class Boule{
  int taille;
  int transp = 20;
  Boule(int itaille)
  {
    taille = itaille;
  }
  void affiche(float x, float y)
  {
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    if (xpos > width-taille/2 || xpos < taille/2) {
      xdirection *= -1;
    }
    if (ypos > height-taille/2 || ypos < taille/2) {
      ydirection *= -1;
    }
    translate(width/2, height/4);
    for(int i=0; i<300; i++)
    {
      rotate(PI * 0.00667);
      stroke(random(200,255),random(50),random(100),random(30,40));
      line(xpos,ypos,-height,-height);
    }
      fill(0);
      noStroke();
ellipse(xpos, ypos, ypos,ypos);
ellipse(-ypos, -xpos, xpos,xpos);
  }

}


