
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

//Import all Phys2D libraries
import pphys2d.bodies.*;
import pphys2d.joints.*;
import pphys2d.shapes.*;
import pphys2d.phys2d.raw.collide.*;
import pphys2d.phys2d.raw.strategies.*;
import pphys2d.phys2d.raw.forcesource.*;
import pphys2d.phys2d.util.*;
import pphys2d.phys2d.raw.shapes.*;
import pphys2d.*;


Minim minim;


//Create a PPhys2D world
PPWorld world = new PPWorld();

//Create an Array to hold the balls
PPBoite[] balls = new PPBoite[17];

void setup () {
  

  //Set size and framerate
  frameRate(30);
  size(800,480, P2D);

  //Set new minim object
  minim = new Minim(this);
  //Set a standard world gravity
  world.setGravity(0, 200);

  //Create the line
  PPLine myLine = new PPLine(120, 15, 2, 450);

  //make it static
  myLine.setGravityEffected(false);
  myLine.setVelocity(0,0);
  myLine.setStaticBody(true);

  //Create 10 balls and add them to the world
  for(int i=0; i <balls.length; i++) {   
    
    balls[i] = new PPBoite(random(5, 70),random(5, 50), i);
    
   
      balls[i].myColor=balls[i].inter;
      balls[i].setFillColor(new java.awt.Color(balls[i].inter));
      balls[i].setRotation(random(100)); 
     
    
  //  balls[i].setStrokeColor(new Color(balls[i].inter));  
      balls[i].setStrokeWidth(0);   
   
    balls[i].setPosition(random(5, 70), random(height));

    //changer la vitesse de frein quand l'objet roule/glisse
    balls[i].setRotDamping(2000);

    //ajouter les objets au monde
    world.add(balls[i]);
    world.add(myLine);

  }

  //Bordures du monde
  world.setEdges(this, new java.awt.Color (120, 120, 120));

}

void draw () {
  //Clear screen
  background(255); 
  
  // stroke(50);
  //Appel des fonction over() et setStatic() sur chaque boule
  for(int i=0; i <balls.length; i++) { 
  // balls[i].ex=
    balls[i].over();
    balls[i].setStatic();

  //Jouer son en fonction de la position x lorsque l'on lock une boule
    
      if(balls[i].getX()>120){
        if(millis()>balls[i].Starttimer+balls[i].getX())
        {
          
          if (balls[i].dclic==true) {
            balls[i].player.play();
            balls[i].player.rewind();
            balls[i].Starttimer = millis();
          }
        
        }
      }
    
  }
  //Draw world
  world.draw(this);  
}

//When mouse is pressed, call mousePressed() function of each ball
void mousePressed(){
  for(int i=0; i <balls.length; i++) {  
    balls[i].mousePressed();
  }

}

//When mouse is dragged, call mouseDragged function of each ball
void mouseDragged(){
  for(int i=0; i <balls.length; i++) {  
    balls[i].mouseDragged();
  }
}

//When mouse is released, call mouseReleased function of each ball
void mouseReleased(){
  for(int i=0; i <balls.length; i++) {  
    balls[i].mouseReleased();
  }
}

//function stop()
void stop(){
for(int i=0; i <balls.length; i++) {  
    balls[i].stop();
  }
  minim.stop();
  super.stop();
}






class PPBoite extends PPBox{
 //PPBoite propriétés
float ex, ey, longueur, hauteur;
float xoff;
float yoff;
boolean over = false;
boolean locked = false;
float Starttimer;

AudioPlayer player;
AudioMetaData meta;

Boolean dclic;
color myColor;

      float a=random(1); 
      color from = color(#7FFF36);
      color to = color(#016F6E);
      color inter = lerpColor(from, to, a);
      color sColor = color(#01316F);

//Appel du superconstructeur pour le constructeur + chargement de la musique
PPBoite(float i, float j, int k){
super(i,j);
this.Starttimer = 0;
this.player = minim.loadFile("s"+k+".wav",1024);
this.meta = this.player.getMetaData();

dclic = false;
}//end constructeur PPBoite()

//Fonction over() de PPBoite
void over(){
  
ex=this.getX();
ey=this.getY();
longueur=this.getWidth();
hauteur=this.getHeight();
float gain = this.player.getGain();

if(this.locked==true) {
  if(keyPressed && keyCode==UP){
    
    if (this.player.getGain() < 14) this.player.setGain(gain+0.1);
    sColor=sColor+color(5);
    println(sColor);
  }
  
  if(keyPressed && keyCode==DOWN){
    
    if (this.player.getGain() > -80) this.player.setGain(gain-0.1);
    sColor=sColor-color(5);
  }
  
  /////////////////////////////////////////////////
   if(keyPressed && keyCode==RIGHT){
    this.setAngularVelocity(4);
  }
  
  if(keyPressed && keyCode==LEFT){
    this.setAngularVelocity(-4);
  }
  
}

//Si la souris est dans le rectangle
if (mouseX > ex-longueur/2 && mouseX < ex+longueur/2 && mouseY > ey-hauteur/2 && mouseY < ey+hauteur/2){
    this.setFillColor(new java.awt.Color(sColor));
    this.over = true;
    println("File Name:"+ this.meta.fileName());
   
}//end if
else{
  this.setFillColor(new java.awt.Color(this.myColor));
  this.over=false;
}//end else
}// end over()

//Fonction setStatic()
 void setStatic(){
   //Si les objets sont dans la partie gauche de l'écran, les rendre statiques
    if(this.getX() < 120 || this.locked == true) {
      
      if(this.getX() < 120) { this.setAngularVelocity(0.1); }
      
      this.setGravityEffected(false);
      this.resetForces();
      //this.setAngularVelocity(0);
      this.setVelocity(0,0);
    }//end if
    else this.setGravityEffected(true);
  }//end setStatic()
  //mousePressed function of PPRond
  void mousePressed(){
    if(over){
      locked = true;
      xoff = mouseX-this.getX();
      yoff = mouseY-this.getY();
      dclic = true;
      
    }
    else locked = false;
    this.setStatic();
     
    
  }

  //mouseDragged function of PPRond
  void mouseDragged(){
    if(locked){ 
      locked=true;
      
      this.ex = int(mouseX-this.xoff);
      this.ey = int(mouseY-this.yoff);
      
      this.setPosition(mouseX-xoff, mouseY-yoff);
    }  
    //this.setStatic();
  }

  //mouseReleased function of PPRond
  void mouseReleased(){
    locked = false;
    this.setStatic();
    this.setAngularVelocity(0);
    
  }
  
  void stop()
  {
    this.player.close();
  }
}//end classe PPBoite


