
class Particule
{

  // position particule
  float x;
  float y;

  // diametre particule
  float d;

  // couleur
  color c;

  // vitesse
  float vx, vy;

  int _alpha;


  // constructeur
  Particule()
  {
    this.x = random(width);
    this.y = random(height);
    this.d = random(200);
    this.c = color(random(255));
    
    
    
  }


  // autre constructeur (avec toujours le m√™me nom!!!)
  Particule(float x_, float y_, float d_, float Vitesse)
  {
    this.x = x_;
    this.y = y_;
    this.d = d_;
   // this.c = color(random(255), random(255), random(255), random(200,255));
   // this.c = color(random(255), random(255), random(255), random(200,230));
    this.c = color(255, 255, 255, random(20,230));
  
    // je map d enntre 0 et 100 et je reporte sur l'intervalle 155 et 0
    //this.c = color( map(d, 0, 100, 180, 0) );

    this.vx = random(-Vitesse,Vitesse);
    this.vy = random(-Vitesse,Vitesse);;
    
}




  // autre constructeur (avec toujours le m√™me nom!!!)
  Particule(float x_, float y_, float d_, float vx_, float vy_ )
  {
    this.x = x_;
    this.y = y_;
    this.d = d_;
   // this.c = color(random(255), random(255), random(255), random(200,255));
    this.c = color(random(255), random(255), random(255), random(200,230));
    //this.c = color(255, 255, 255, random(20,230));
  
    // je map d enntre 0 et 100 et je reporte sur l'intervalle 155 et 0
    //this.c = color( map(d, 0, 100, 180, 0) );

    this.vx = vx_;
    this.vy = vy_;
    
    
    
}









  // fonction pour limiter
  void collide() {


    if (x + (d/2)> width )
    {
      x = width - d/2;
      vx = -vx;
    }

    if (x  - d/2 < 0 )
    {
      x = d/2;
      vx = -vx;
    }

    if (y + (d/2)> height )
    {
      y = height - d/2;
      vy = -vy;
    }

    if (y  - d/2 < 0 )
    {
      y = d/2;
      vy = -vy;
    }
  }




  // changer les membres x et y qui vont √™tre consommer dans draw()
  void move()
  {
    x += vx;
    y += vy;
    // cet ajout permet d'acc√©l√©rer la particule   (force)
    //vy += 0.2;
  }
  
  
  


  // fonction calculer la distance
  float distance(Particule p) {

    return dist(this.x, this.y, p.x, p.y);
  }



  // draw
  void draw()
  {

    // couleur la variable
    fill(c);

    // ellipse est une fonction de Papplet
    ellipse(this.x, this.y, this.d, this.d);
    
  }
};



