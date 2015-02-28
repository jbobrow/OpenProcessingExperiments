
//Variable de couleur
int a;
//Rayon du cercle
int R;
//Centre du cercle
int xc;
int yc;
//angle qui détermine la position de l'arc
float angle1=mouseX;
 
void setup()
{
  strokeWeight(10);
  background(0);
  size (600,600);
  
  //on déclare les variables
  a=(#BC5252);
  R=height-250;
  xc=width/2;
  yc=height/2;
  frameRate(2800);
}
 
 
void draw()
{
 
   smooth();
   fill(a);
   
  
 //On definit l'arc.
   angle1=(angle1+TWO_PI)%TWO_PI;
    
 //On trace le premier arc.
   arc (xc-400,yc+400,R,R,(angle1+frameCount)%TWO_PI,(angle1+frameCount+PI/5000)%TWO_PI);
   arc (xc-400,yc-400,R,R,(angle1+frameCount)%TWO_PI,(angle1+frameCount+PI/5000)%TWO_PI);
   arc (xc+400,yc-400,R,R,(angle1+frameCount)%TWO_PI,(angle1+frameCount+PI/5000)%TWO_PI);
   arc (xc+400,yc+400,R,R,(angle1+frameCount)%TWO_PI,(angle1+frameCount+PI/5000)%TWO_PI);
 //On augmente le rayon de 2 a chaques frame. 
  R = R+2;
 
//Je creer deux boucles à deux conditions.
//La première, si le rayon R = 8000 ET si le trait est blanc alors.
 if (R == 900 & a == #BC5252) {
//On met le rayon à 0 et on change la couleur du trait en noir.  
  R = 0;
  a=(0);
  
 }
  
//La seconde, si le rayon R = 8000 ET si le trait est noir alors.
 if (R == 900 & a == 0) {
//On met le rayon à 0 et on change la couleur du trait en rouge.    
  R = 0;
  a=(#BC5252);
  
  stroke(0);
  strokeWeight(12);
  line(300,0,300,600);
  line(600,300,0,300);
  
  //fill(0);
  //noStroke();
  ellipse(300,300,520,520);
  }
 

}



