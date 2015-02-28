
class Ball{
  float taille;
  float transp = random(10);
 float x = xpos+random(-100,100);
 float y = ypos+random(-200,200);
  Ball(int itaille){taille = itaille;}
  void affiche( float x, float y){
    xpos = xpos + ( xspeed * xdirection );
    ypos = ypos + ( yspeed * ydirection );
    if (xpos > width-taille/2 || xpos < taille/2) {
      xdirection *= -1;
    }
    if (ypos > height-taille/2 || ypos < taille/2) {
      ydirection *= -1;
    }
  translate(random(width*.618), random(height*.618));
  color r  = color(random(100), 50, 50,40);
    for(int i=0; i<300; i++)
    {
      rotate(PI * 0.00667);
      stroke(r);//incrémenter r
      line(xpos,ypos,-500,-500);
    }
    println(xpos);
      fill(0);
      noStroke();
  }
 }


