


class Balle
{
  //DECLARATIONS DES VARIABLES
  float x,y,angle,dx,dy;//dx,dy contiennent le decalage relatif a l'angle de tir
  PImage balle;


  //**********************************************************************************************
  // PLACE
  // Positionne la tourelle au bon endroit sur le warthog.
  // Place les balles a la meme position que le warthog, afin qu'elles partent au bon 
  // endroit sur la tourelle.
  //**********************************************************************************************

  void place(Warthog warthog) 
  {
    angle = warthog.angleTourelle;

    dx = (mouseX+random(30)-5-warthog.tx);
    dy = (mouseY+random(30)-5-warthog.ty);
    float module = sqrt(dx*dx+dy*dy);
    dx = dx/module;
    dy = dy/module;

    x = warthog.tx + dx*15;
    y = warthog.ty + dy*15;
    balle = loadImage("balle.png");
  }



  //**********************************************************************************************
  // DRAW
  //**********************************************************************************************

  void draw()
  {
    pushMatrix();

    x += dx * 15;
    y += dy * 15;

    //Dessinne la balle
    translate(x,y);
    rotate(angle+PI/2);
    scale(0.7);
    image(balle,-30,0);

    popMatrix();
  }
}


