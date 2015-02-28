
//visualisation in 3D diagramm of future perfect conjugated verbs
//richard Monnier 2013
//controls :
                                       //mousePressed for rotateX and rotateY "
                                       //key 'r' for rotateZ : 90 °
                                       //key UP or key DOWN for translate -Z or +Z" 
/////////////////////////////////////////////////////////////////////////////////////
int diam = 500;
float mx = 0; float my = 0;
float rx = 0; float ry = 0; float rz = 0;
float tx = 0; float ty = 0; float tz = 0;
float w; float h;
PFont f; int texH = diam/16;
import processing.pdf.*;

void setup()             {
  size(650,650,P3D); rectMode(CENTER);
 background(250); fill(0); 
w = width/2;  h = height/2; 
f = createFont("lucida",28); textFont(f); textSize(texH);
}
void draw()                         {
tourner(rx,ry,rz,tx,ty,tz,mx,my);   
if(mousePressed == true)            {
  mx = mx+(pmouseX-mouseX); my = my-(pmouseY-mouseY);
    }
if(keyPressed ==true)               {
if(keyCode == UP)       {tz = tz+2; }
else if(keyCode == DOWN){tz = tz-2; }
else if(key =='r')      {rz = rz+ HALF_PI;}
else if (key == 's')                {
            saveFrame("coupeTore2.tif");
   exit(); }
                                    }
}
void tourner(float rixe,float rigr,float rzed,float tixe,float tigr,float tzed,float mixe,float mzed) {
background(250); translate(w,h+texH/2,tzed);
//translate(0,0,tzed); 
  rotateX(mzed/200); rotateY(mixe/200); rotateZ(rzed);
  pushMatrix();
      fill(200,0,0); textSize(texH);
text("Affirmation subjective",-diam/3,-diam/2-texH);                                            //affirmation subjective
text("Antériorité nécessaire",-diam/3,(diam/2)+texH) ;                                                //antériorité nécessaire
        translate(0,0,2);
textSize(12); text("Il aura fait beau aujourd'hui",texH-diam/4,-diam/2.5);
text("Rien n'aura eu lieu que le lieu",-diam/3,-diam/3);                    
text("Cette cause qu'il aura défendue toute sa vie",texH-diam/3,-diam/5-texH);
text("Il nous aura tout fait",-diam/3-texH,-diam/5);
text("quoiqu'il arrive, ça aura été une bonne expérience",-(diam/3)-(texH*2),-diam/7);
text("En cas de succès, le PSG aura sauvé sa saison",-(diam/3)-texH,diam/8);
text("Se conduire suivant la voie que nous auras tracée le législateur",-diam/2,diam/5.5);
text("Quand tu auras fini tes devoirs, tu pourras aller jouer",-diam/2,diam/4);
text("Suivant les résultats que nous aurons obtenus, nos jugerons si nous devons maintenir nos hypothèses",
-diam/1.9,diam/3);
  popMatrix();
  
  pushMatrix();
      rotateX(HALF_PI); rotateY(HALF_PI);                          
//fill(0,200,0,35);                            rect(0,0,diam,diam) ;
      fill(0,200,0); textSize(texH);
text("fait exceptionnel",-diam/3,-diam/2-(texH/2));
text("Atténuation d'un fait ",-diam/3,(diam/2)+texH);
      translate(0,0,2); textSize(12);
text("800000 personnes auront visité l'expo Claude Monet",-diam/3,-diam/2.5);
text("En moins d'un an, le Pakistan aura connu deux élections présidentielles",-diam/2.5,-diam/3.5);
text("Cette affaire aura marqué par sa rapidité",-diam/3,-diam/4.5);
text("Durant neuf mois, à coup de parodies, Dac aura préparé la libération des esprits par le rire",
-diam/2.5,-diam/5.5);
text("On s'étonne un peu à la lecture de ces lignes -l'auteur aura laissé filé sa plume",
-diam/2.5,diam/5.5);
text("Monsieur aura confondu",-diam/3,diam/3.5);
text("Vous vous serez trompé",-diam/4,diam/2.5);
   popMatrix();
  
   pushMatrix();
      rotateX(HALF_PI); rotateZ(-HALF_PI); 
//      fill(0,0,200,35);                  rect(0,0,diam,diam) ;
      fill(0,0,200); textSize(texH);
text("Constat résigné",-diam/3,diam/2+texH);
text("Expectative",-diam/3,-diam/2-(texH/2));
      textSize(12);
text("Nous allons mourir si vieux que nous aurons connu Napoléon",-diam/3,-diam/2.5);
text("Dans cinq ans j'aurai oublié des gestes d'elle",-diam/4,-diam/3.5);
text("Ma bouche et mes discours muets depuis huit jours",-diam/2.5,-diam/4.5);
text("L'auront pu préparer à ce triste discours",-diam/2.5,-diam/5.5);
text("Le tsunami aura mis 24 heures pour atteindre les côtes de l'Inde",-diam/3,diam/6);
text("Il n'aura pas fallu 10 secondes pour que les deux villages alsaciens soient dévastés par la tornade",
-diam/2,diam/4);
text("Il nous aura tout fait",-diam/4,diam/3);
popMatrix();
}

 




