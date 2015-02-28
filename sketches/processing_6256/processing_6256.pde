
//l'étape suivante sera de régénérer les stars en dimensions et couleurs
//encore trop lourd en déplacement
//plus tard, naviguer entre les étoiles (mouse écarte)
class Star{
  float xtrand =random(width);
  float ytrand =random(height);
  float xpos, ypos;
 float radius; 
  float xspeed = 1.8;
  float yspeed = 1.2;
  int xdirection = 1;
  int ydirection = 1;
  color c  = color(random(100),80, 80,50);
 
 
  Star(int itaille){radius = itaille;
noise(radius);}
  void affiche( float xpos, float ypos){
pushMatrix();
translate( xtrand-=2,ytrand+=.4);
if(xtrand < 0-xpos-radius*4 ){xtrand=width+xpos+radius*4;ytrand = random(height/2);  c = color(random(100),80, 80,50);};//formulation + économique à trouver
if(ytrand > height+ypos+radius*4 ){ytrand=-radius*4;xtrand = random(width); c = color(random(100),80, 80,50);};
  
    for(int i=0; i<200; i++)
    { rotate(PI * 0.01);
      stroke(c);
      //strokeWeight(random(.8,1));
      line(xpos, ypos,radius,radius);}
popMatrix();
println(radius);
  } 
 }


