
//Variable de couleur
int a;
//Rayon du cercle
float R;
//Centre du cercle
int xc;
int yc;
//angle qui détermine la position de l'arc
float angle1=random(0, PI);


void setup()
{
 //Epaisseur des traits 
  strokeWeight(0.5);
 //Couleur de fond 
  background(0);
 //Taille du sketch 
  size (800,800);
  //on déclare les variables
  a=(255);
  R=height-50;
  xc=width/2;
  yc=height/2;
  frameRate(160);
}
void draw()
{
 //Pour adoucir les trait.
   smooth();
 
 //Pour la couleur des arcs.
   fill(a);
 
 //On definit l'arc.
   angle1=(angle1+TWO_PI)%TWO_PI;
   
 //On trace le premier arc.
   arc (xc,yc,R,R,(angle1+frameCount)%TWO_PI,(angle1+frameCount+PI/1000)%TWO_PI);

 //On retreci la taille du rayon à chaque frame.  
   R = R - 0.3;
   
}


//Ainsi ob peut fabriqué un disque de scie circulaire ! N'est-ce pas MARVELOUS?

