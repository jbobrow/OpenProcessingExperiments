
class Particule
{
  float posX = 0;
  float posY = 0;
  float vx = 0;
  float vy = 0;
  /*
  float attraction = 0.05; // force d'attraction
  int ChampsAtt = 250 ;
  int repulsionX = 200 ; int repulsionY = 200 ;
  float comportement = 0.5 ;
  */
  color coul ; 
  int transp, e ; 
  float gravY, gravX;
  Particule ( color couleur, int transparence, int epaisseur, float graviteX, float graviteY ) 
  {
    coul = couleur  ; transp = transparence ; e = epaisseur ;
    gravY = graviteY ; gravX = graviteX ;
    
  } 
  
  void actualisation(int chps, int repX, int repY, float att, float comp)
  {
    
    float vent = (mouseX-(width/2)) / 4000.0 ;
    float chute = (mouseY -  (height/3)  ) / 2000.0 ;
    float dx = mouseX - posX;
    float dy = mouseY - posY;
    float dist = sqrt(dx*dx + dy*dy);
    if(dist < chps) // champs d'attraction
    {
      float tx = mouseX - dx / dist * repX;
      float ty = mouseY - dy / dist * repY;
      vx += (tx - posX) * att;
      vy += (ty - posY) * att;
    }
    vx += random(-comp, comp);
    vy += random(-comp, comp);
    vy += gravY - chute;
    vx += vent ;
    vx *= 0.95;
    vy *= 0.95;
    posX += vx;
    posY += vy;
    //...........collision sur les parroies..........
    if (posX > width)   { posX = 0 ;   }
    if (posX < 0)       { posX = width;         }
    if (posY > height)  { posY = 0;    }
    if (posY < 0)       { posY = height;        }
  }
  
  void affichage()
  {
    stroke(coul, transp); strokeWeight (e) ;
    point(posX,posY) ;
  }
}


