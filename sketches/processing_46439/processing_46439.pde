
boolean[] keys = new boolean[526];
 
PImage Level;
PImage Levelcol;
PImage SpriteLemming;
PImage SpriteLemmingback;
 
color rouge = color(255, 0, 0);
int startx;
int starty;
Lemming Lemming1 = new Lemming(219, 79, color(100));
//////////////////////////////////////////////////////////////////////////////
void setup()
{
  smooth(); //Lissage des dessins
  size(698, 348); //Taille de la fenêtre
  boolean[] keys = new boolean[526]; //Pour multiplekeys
  //Chargement du sprite de lemming et du level
  SpriteLemming = loadImage("lemming.png");
  SpriteLemmingback = loadImage("lemmingback.png");
  Level = loadImage("Level1.png");
  Levelcol = loadImage("Level1-col.png");
  Lemming1.x=219; Lemming1.y=79;
  
}
//Déclaration et création de plusieurs instances de l'objet Lemming
 
//////////////////////////////////////////////////////////////////////////////
//stuff to do:
//             coder la sortie du niveau histoire de pouvoir le finir ^^ => seconde carte de collision ?
// OK Merci bounch     donner un mouvement circulaire au curseur: pour pouvoir l'orienter sur 360°
// OK          augmenter la superficie de l'impact
//             permettre la sortie du joueur = reset de la partie
//             permettre plusieurs instances de joueurs dans le niveau
//             mise en applet java
//             mise en réseau
//black=16777216
 
void draw()
{    
  background(Level);
 
  frameRate(120);
  //rect(0, 0, 698, 348);
   //On dessine un fond noir
  //noStroke(); //On supprime le contour

  loadPixels();

  Lemming1.refresh();
  print("("+Lemming1.x+":"+Lemming1.y+"):("+(Lemming1.x+75)+":"+(Lemming1.aim)+")@"+((int(color(getpixel((Lemming1.x+75), (int(Lemming1.aim)))))))+" Bullet="+Lemming1.bullet[1]+":"+Lemming1.bullet[2]+")"+"Lemming1.aimx="+(Lemming1.aimx-Lemming1.x)+"Lemming1.aimy="+(Lemming1.aimy-Lemming1.y));
  if (getpixel(Lemming1.x+75, Lemming1.aim) == #000000) println("black");
  else println();
  println ("mouseX="+mouseX+"mouseY="+mouseY);
 
/*  if (!Lemming1.falling())
  {*/ //Gestion des mouvements
    if (checkKey(RIGHT))
    {
      Lemming1.aimside=1;
      if (Lemming1.x<width-19)                                                     //si pas au bord de l'écran
      {
        Lemming1.refresh();                                                //maj des collisions
        if (getpixel(Lemming1.x+14, Lemming1.y+18) == #000000)                                 //si épaule droite sur du noir
        {
          if (getpixel(Lemming1.x+16, Lemming1.y+30) == #000000) Lemming1.move(2, 0);                //alors si pied sur du noir bouge
          else if (getpixel(Lemming1.x+16, Lemming1.y+30) != #000000) Lemming1.move( 2, -1 );
        }
      }       //sinon si pied sur du !noir bouge
      else Lemming1.move(0, 0);
    }                                          //sinon ne bouge pas
 
    if (checkKey(LEFT ))
    {
      Lemming1.aimside=-1;
      if (Lemming1.x>2)                                                              //si pas au bord de l'écran
      {
        Lemming1.refresh();                                                //maj des collisions
        if (getpixel(Lemming1.x+7, Lemming1.y+18) == #000000)                                 //si épaule gauche sur du noir
        {
          if (getpixel(Lemming1.x+5, Lemming1.y+30) == #000000) Lemming1.move(-2, 0);                //alors si pied sur du noir bouge
          else if (getpixel(Lemming1.x+5, Lemming1.y+30) != #000000) Lemming1.move(-2, -1);
        }
      }       //sinon si pied sur du !noir bouge
      else Lemming1.move(0, 0);
    }                                          //sinon ne bouge pas
 
    if (checkKey(DOWN ))
    {
      if (Lemming1.aim<1.35) Lemming1.aim=Lemming1.aim+0.03;
    }
 
    if (checkKey(UP ))
    {
      if (Lemming1.aim>-1.35) Lemming1.aim=Lemming1.aim-0.03;
    }
    //aim=mouseY;
    if (!Lemming1.falling())
    {if (checkKey(' '))      if (Lemming1.y>-1 && pixels[Lemming1.x+Lemming1.y*width] == #000000) Lemming1.move( 0, -20);
    else Lemming1.move(0, 0);}
 
    if (checkKey('V'))
    {
      if (Lemming1.bullet[0]==0)
      {
        startx=Lemming1.x+10;
        starty=Lemming1.y+17;
        Lemming1.bullet[0]=1;
        Lemming1.bullet[1]=startx+Lemming1.aimside;
        Lemming1.bullet[2]=starty;
        Lemming1.bulletaim=(Lemming1.x-(starty+19))/64;
        Lemming1.bulletside=Lemming1.aimside;
      }
    }
    if (checkKey('R')) setup();
     
    if (Lemming1.falling()) if (Lemming1.y<314) Lemming1.move(0, 3); else {Lemming1.x=219;Lemming1.y=79;}/*
  }
  else if (Lemming1.falling()) Lemming1.move(0, 4);*/
 
  //Gestion des balles
  if (Lemming1.bullet[0]==1)
  {//[x+75,aim]-[x+11,y+18]=vecteur du tir=64,32
    //bulletaim=(aim-(y+18))/64;
    if (Lemming1.bulletside==1)
    {
      if (Lemming1.bullet[1]>startx+1)
      {
        if ( ((getpixel(Lemming1.bullet[1]+2, Lemming1.bullet[2]+1) == #000000) || (getpixel(Lemming1.bullet[1]+1, Lemming1.bullet[2]+1*Lemming1.bulletaim) == #FFFFFF)) && ((Lemming1.bullet[1]<697)&&(Lemming1.bullet[1]>1)&&(Lemming1.bullet[2]<347)&&(Lemming1.bullet[2]>1)))
        {
          Lemming1.bullet[1]=Lemming1.bullet[1]+1;  //bullet[2]=bullet[2]+2*bulletaim;
          Lemming1.bullet[2]=Lemming1.bullet[2]+1*tan(Lemming1.aim); 
          println("BLACKorWHITE");
        }
        else {
          Lemming1.bullet[0]=0;
          println("finballe");
          Lemming1.bullet[1]=Lemming1.bullet[1]+1; 
          Lemming1.bullet[2]=Lemming1.bullet[2];
          Impact Impact1 = new Impact(Lemming1.bullet[1], Lemming1.bullet[2]);
          Impact1.display();
        }
      }
      else {
        Lemming1.bullet[1]=Lemming1.bullet[1]+1; 
        Lemming1.bullet[2]=Lemming1.bullet[2]+1*Lemming1.bulletaim; 
        println("debutballe");
      }
    }
    if (Lemming1.bulletside==-1)
    {
      if (Lemming1.bullet[1]<startx+8)
      {
        if ( ((getpixel(Lemming1.bullet[1]-2, Lemming1.bullet[2]+1) == #000000) || (getpixel(Lemming1.bullet[1]-1, Lemming1.bullet[2]+1*Lemming1.bulletaim) == #FFFFFF)) && ((Lemming1.bullet[1]<697)&&(Lemming1.bullet[1]>1)&&(Lemming1.bullet[2]<347)&&(Lemming1.bullet[2]>1)))
        {
          Lemming1.bullet[1]=Lemming1.bullet[1]-1; 
          Lemming1.bullet[2]=Lemming1.bullet[2]+1*tan(Lemming1.aim);
          println("BLACKorWHITE");
        }
        else {
          Lemming1.bullet[0]=0;
          println("finballe");
          Lemming1.bullet[1]=Lemming1.bullet[1]-1; 
          Lemming1.bullet[2]=Lemming1.bullet[2];
          Impact Impact1 = new Impact(Lemming1.bullet[1], Lemming1.bullet[2]);
          Impact1.display();
        }
      }
      else {
        Lemming1.bullet[1]=Lemming1.bullet[1]-1; 
        Lemming1.bullet[2]=Lemming1.bullet[2]+1*Lemming1.bulletaim; 
        println("debutballe");
      }
    }
 
    //Affichage du projectile
    stroke(200, 120, 0);   
    strokeWeight(1);   
    ellipse(Lemming1.bullet[1], Lemming1.bullet[2], 5, 5);
 
 
    //Dégradé impact
    //if (Impact1.bornat > (millis()-1000)) { Impact1.display(); }
  }
 
  //Dégradé impact
  //if (Impact1) ellipse(3,3);
  //if (Impact1.bornat > (millis()-1000)) { Impact1.display(); }
 
  //Affichage du lemming1
 
  //putpixel(x+14,y+18,rouge);//shoulderd
  //putpixel(x+7,y+18,rouge);   //shoulderg
  //putpixel(x+16,y+30,rouge);//footd
  //putpixel(x+5,y+30,rouge);//footg
  
  Lemming1.display();
  
  Impactsdisplay();
 
  //aim=mouseY;
}
 
//////////////////////////////////////////////////////////////////////////////
//                               CLASS Lemming                              //
//////////////////////////////////////////////////////////////////////////////
class Lemming
{
  //Déclaration des paramètres de base du lemming
  color couleur;
  int x;
  int y;
  int foot = (x+13) + (y+31) * width;
  int centerx;
  int centery;
  
  float aim = 1;
  float aimx;
  float aimy;
  float bullet[]= {
    0, 0, 0
  };
  float bulletaim;
  int bulletside;
  int aimside=1;
  int footd = (x+17) + (y+31) * width; 
  int footg = (x) + (y+31) * width;
  int shoulderd = (x+18) + (y+16) * width; 
  int shoulderg = (x) + (y+16) * width;
 
  //Constructeur du lemming
  Lemming (int nouvX, int nouvY, color nouvCouleur)
  {
    x          = nouvX;
    y          = nouvY;
    centerx= x+8;
    centery= y+15;
    couleur    = nouvCouleur;
    int footd = (x+17) + (y+31) * width; 
    int footg = (x) + (y+31) * width;
    int shoulderd = (x+18) + (y+16) * width; 
    int shoulderg = (x) + (y+16) * width;
    float aim = 1;
    int aimside=1;
    float bullet[]= {
      0, 0, 0
    };
    float bulletaim;
    boolean bulletside;
    int startx;
    int starty;
  }
 
  //Dessin du lemming
  void display()
  {
    fill(couleur);
    //fill(0);
    strokeWeight (2);
    //stroke(255);
    //Crossaim
    //if (aimside==1) {
      
    aimx = ((x+30  * aimside *cos(aim))+12);
    aimy = (y+30  * sin(aim))+15;
    line(aimx-4, aimy, aimx+4, aimy);// fill(255, 204, 51);//xAyA xByB
    line(aimx, aimy-4, aimx, aimy+4);//}//fill(255, 204, 51);
    
    /*else {aimx = x+11 - 100 * cos(aim);
         aimy = y+20 + 100 * sin(aim);
         line(aimx-4, aimy, aimx+4, aimy);// fill(255, 204, 51);//xAyA xByB
         line(aimx, aimy-4, aimx, aimy+4);}*/
 
    /*Old Crossaim
     if (aimside == true)
     {line(x+71, aim, x+79, aim); //xAyA xByB
     line(x+75, aim-4, x+75, aim+4);    fill(255, 204, 51);}
     else
     {line(x-53, aim, x-61, aim); //xAyA xByB
     line(x-57, aim-4, x-57, aim+4);}*/
 
    if (aimside==1) image(SpriteLemming, x, y);
    else image(SpriteLemmingback, x, y);
  }
 
  //Déplacement du lemming
  void move(int relX, int relY)
  { //if pixels(relX+foot
    x=x+relX;
    y=y+relY;
  }
 
  //Mise a jour des variables pour la collision
  void refresh()
  {
    footd = (x+18) + (y+31) * width;
    footg = (x+8) + (y+31) * width;
    shoulderd = (x+16) + (y+19) * width;
    shoulderg = (x+8) + (y+19) * width;
  }
  //Chute de lemming
  boolean falling()
  {
    boolean state = false;
    foot = (x+17) + (y+31) * width;
    if ((pixels[foot]) == #000000)
    {
      state = true;
    }
    else state = false;
    return state;
  }
}
 
//////////////////////////////////////////////////////////////////////////////
//CLASS IMPACT
//////////////////////////////////////////////////////////////////////////////
class Impact
{ 
  float impx;
  float impy;
  int bornat=millis();
 
  //Constructeur de l'impact
  Impact (float nouvimpx, float nouvimpy)
  {
    impx=nouvimpx;
    impy=nouvimpy;
  }
 
  void display()
  {
    fill(255, 255, 255);
    ellipse(int(impx), int(impy), 25, 25);
 
    putpixel(int(impx-1), int(impy +5), #000000);
    putpixel(int(impx)  , int(impy +5), #000000);
    putpixel(int(impx+1), int(impy +5), #000000);
     
    putpixel(int(impx-3), int(impy +4), #000000);
    putpixel(int(impx-2), int(impy +4), #000000);
    putpixel(int(impx-1), int(impy +4), #000000);
    putpixel(int(impx)  , int(impy +4), #000000);
    putpixel(int(impx+1), int(impy +4), #000000);
    putpixel(int(impx+2), int(impy +4), #000000);
    putpixel(int(impx+3), int(impy +4), #000000);
     
    putpixel(int(impx-4), int(impy +3), #000000);
    putpixel(int(impx-3), int(impy +3), #000000);
    putpixel(int(impx-2), int(impy +3), #000000);
    putpixel(int(impx-1), int(impy +3), #000000);
    putpixel(int(impx)  , int(impy +3), #000000);
    putpixel(int(impx+1), int(impy +3), #000000);
    putpixel(int(impx+2), int(impy +3), #000000);
    putpixel(int(impx+3), int(impy +3), #000000);
    putpixel(int(impx+4), int(impy +3), #000000);
     
    putpixel(int(impx-4), int(impy +2), #000000);
    putpixel(int(impx-3), int(impy +2), #000000);
    putpixel(int(impx-2), int(impy +2), #000000);
    putpixel(int(impx-1), int(impy +2), #000000);
    putpixel(int(impx)  , int(impy +2), #000000);
    putpixel(int(impx+1), int(impy +2), #000000);
    putpixel(int(impx+2), int(impy +2), #000000);
    putpixel(int(impx+3), int(impy +2), #000000);
    putpixel(int(impx+4), int(impy +2), #000000);
     
    putpixel(int(impx-5), int(impy +1), #000000);
    putpixel(int(impx-4), int(impy +1), #000000);
    putpixel(int(impx-3), int(impy +1), #000000);
    putpixel(int(impx-2), int(impy +1), #000000);
    putpixel(int(impx-1), int(impy +1), #000000);
    putpixel(int(impx)  , int(impy +1), #000000);
    putpixel(int(impx+1), int(impy +1), #000000);
    putpixel(int(impx+2), int(impy +1), #000000);
    putpixel(int(impx+3), int(impy +1), #000000);
    putpixel(int(impx+4), int(impy +1), #000000);
    putpixel(int(impx+5), int(impy +1), #000000);
     
    putpixel(int(impx-5), int(impy ), #000000);
    putpixel(int(impx-4), int(impy ), #000000);
    putpixel(int(impx-3), int(impy ), #000000);
    putpixel(int(impx-2), int(impy ), #000000);
    putpixel(int(impx-1), int(impy ), #000000);
    putpixel(int(impx)  , int(impy ), #000000);
    putpixel(int(impx+1), int(impy ), #000000);
    putpixel(int(impx+2), int(impy ), #000000);
    putpixel(int(impx+3), int(impy ), #000000);
    putpixel(int(impx+4), int(impy ), #000000);
    putpixel(int(impx+5), int(impy ), #000000);
     
    putpixel(int(impx-5), int(impy -1), #000000);
    putpixel(int(impx-4), int(impy -1), #000000);
    putpixel(int(impx-3), int(impy -1), #000000);
    putpixel(int(impx-2), int(impy -1), #000000);
    putpixel(int(impx-1), int(impy -1), #000000);
    putpixel(int(impx)  , int(impy -1), #000000);
    putpixel(int(impx+1), int(impy -1), #000000);
    putpixel(int(impx+2), int(impy -1), #000000);
    putpixel(int(impx+3), int(impy -1), #000000);
    putpixel(int(impx+4), int(impy -1), #000000);
    putpixel(int(impx+5), int(impy -1), #000000);
     
    putpixel(int(impx-4), int(impy -2), #000000);
    putpixel(int(impx-3), int(impy -2), #000000);
    putpixel(int(impx-2), int(impy -2), #000000);
    putpixel(int(impx-1), int(impy -2), #000000);
    putpixel(int(impx)  , int(impy -2), #000000);
    putpixel(int(impx+1), int(impy -2), #000000);
    putpixel(int(impx+2), int(impy -2), #000000);
    putpixel(int(impx+3), int(impy -2), #000000);
    putpixel(int(impx+4), int(impy -2), #000000);
     
    putpixel(int(impx-4), int(impy -3), #000000);
    putpixel(int(impx-3), int(impy -3), #000000);
    putpixel(int(impx-2), int(impy -3), #000000);
    putpixel(int(impx-1), int(impy -3), #000000);
    putpixel(int(impx)  , int(impy -3), #000000);
    putpixel(int(impx+1), int(impy -3), #000000);
    putpixel(int(impx+2), int(impy -3), #000000);
    putpixel(int(impx+3), int(impy -3), #000000);
    putpixel(int(impx+4), int(impy -3), #000000);
     
    putpixel(int(impx-3), int(impy -4), #000000);
    putpixel(int(impx-2), int(impy -4), #000000);
    putpixel(int(impx-1), int(impy -4), #000000);
    putpixel(int(impx)  , int(impy -4), #000000);
    putpixel(int(impx+1), int(impy -4), #000000);
    putpixel(int(impx+2), int(impy -4), #000000);
    putpixel(int(impx+3), int(impy -4), #000000);
     
    putpixel(int(impx-1), int(impy -5), #000000);
    putpixel(int(impx)  , int(impy -5), #000000);
    putpixel(int(impx+1), int(impy -5), #000000);
     
    ellipse(int(impx), int(impy), 25, 25);
 
 
 
    /*
  putpixel(int(impx  ), int(impy  ), #000000);
      
     putpixel(int(impx+1), int(impy  ), #000000);
     putpixel(int(impx-1), int(impy  ), #000000);
     putpixel(int(impx  ), int(impy+1), #000000);
     putpixel(int(impx  ), int(impy-1), #000000);
      
     putpixel(int(impx+2), int(impy  ), #000000);
     putpixel(int(impx-2), int(impy  ), #000000);
     putpixel(int(impx  ), int(impy+2), #000000);
     putpixel(int(impx  ), int(impy-2), #000000);
     putpixel(int(impx+2), int(impy+1), #000000);
     putpixel(int(impx+2), int(impy-1), #000000);
     putpixel(int(impx+1), int(impy+2), #000000);
     putpixel(int(impx-1), int(impy-2), #000000);
      
     putpixel(int(impx+1), int(impy+1), #000000);
     putpixel(int(impx+1), int(impy-1), #000000);
     putpixel(int(impx-1), int(impy-1), #000000);
     putpixel(int(impx-1), int(impy+1), #000000);
      
    /*
     putpixel(int(impx+2), int(impy+2), #000000);
     putpixel(int(impx+2), int(impy-1), #000000);
     putpixel(int(impx+1), int(impy+2), #000000);
     putpixel(int(impx-1), int(impy-2), #000000);
     putpixel(int(impx+2), int(impy+1), #000000);
     putpixel(int(impx+2), int(impy-1), #000000);
     putpixel(int(impx+1), int(impy+2), #000000);
     putpixel(int(impx-1), int(impy-2), #000000);*/
    //créer fonction qui étend la coordonnée d'un point à un tableau de coordonnées contigues de maniere a former un gros impact !
  }
}
 
void Impactsdisplay()
{//for
}

//////////////////////////////////////////////////////////////////////////////
int getpixel(float getx, float gety)
{
  int coord;
  loadPixels();
  coord = constrain(int(getx), 0, width-1) + constrain(int(gety), 0, height-1)*width-1;
  return pixels[coord];
}
void putpixel(float getx, float gety, color c)
{
  int coord;
  coord = constrain(int(getx), 0, width-1) + constrain(int(gety), 0, height-1)*width-1;
  Level.pixels[coord]=color(c);
  updatePixels();
}
 
//////////////////////////////////////////////////////////////////////////////
/**
 Modified version of Option 1 multiplekeys (should provide improved performance and accuracy)
 @author Yonas Sandbæk http://seltar.wliia.org (modified by jeffg)
 */
boolean checkKey(int k)
{
  if (keys.length >= k) return keys[k];
  return false;
}
void keyPressed()
{
  keys[keyCode] = true;
  println(KeyEvent.getKeyText(keyCode));
}
//if(checkKey(CONTROL) && checkKey(KeyEvent.VK_S)) println("CTRL+S");// pour tester l'appui de deux touches mais vaut mieux cumuler deux if dans le draw()
void keyReleased()
{
  keys[keyCode] = false;
}


