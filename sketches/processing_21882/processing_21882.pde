
/*
Andres Kõpper
Processing class, IED Barcelona, Week 12
29.01.2011

This is a typography creator, created with geomerative library for processing.
 
 */

import processing.opengl.*;
import geomerative.*;

RGroup grupo;
Particle particula;
float toldist;
float maxvel;
float maxalph;
PImage bg;


RFont f;


// Text to be drawn
String STRNG = "";

// Font to be used
String FONT = "Jellyka CuttyCupcakes.ttf";

// Margin from the borders
float MARGIN = 435;

// The coefficient of the velocity of getting to a desired point
float MINNERVE = 0.002;
float MAXNERVE = 0.005;

// The average of mininertia and maxinertia must be under one to have good results
float MININERTIA = 0.7;
float MAXINERTIA = 1.2;

// Coefficient that handles the error of the drawing: 0 for lowest error
float DRWERRCOEFF = 0.8009;

// Coefficient that handles the variation of amount of ink for the drawing 
float INKERRCOEFF = 0.14;

// Coefficient that handles the amount of ink for the drawing
float INKCOEFF = 0.1;

// Coefficient of precision: 0 for lowest precision
float PRECCOEFF = 0.8;

// Velocity of the drawing
int VELOCIDAD = 428;
//-----------------------------------------------------------------------------


String newString = "";

void setup(){
   bg = loadImage("123.jpg");
  


  
 
  
size(1920,1080);
  frameRate(25);
 
    smooth();
 
  tint(0,0,0);
  background(bg);
  RG.init(this);
  f = new RFont(FONT,372,RFont.CENTER);
  
  initialize();
}

void draw(){
  pushMatrix();
    translate(width/2, height/2);

  for(int i=0;i<VELOCIDAD;i++){
    particula.update(grupo);
    particula.draw(g);
  }
  popMatrix();


}

void initialize(){
  background(bg);
  
  toldist = (width/80F) * DRWERRCOEFF * (10F/(STRNG.length()+1));
  maxvel = (width/190F) * constrain(INKERRCOEFF,0.01,INKERRCOEFF) * (10F/(STRNG.length()+1));
  maxalph = 255 * constrain(INKCOEFF,0,1);
  
  grupo = f.toGroup(STRNG);

  RCommand.setSegmentStep(1-constrain(PRECCOEFF,0,0.99));
  RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  grupo = grupo.toPolygonGroup();
  grupo.centerIn(g, MARGIN, 1, 1);
  
  particula = new Particle(g,0);
}



void keyReleased(){
  //exit();
  //saveFrame(STRNG+"-###.tga");
  if(keyCode==ENTER){
    STRNG = newString; 
    newString = "";
    initialize();
  }else if(keyCode==BACKSPACE){
    if(newString.length() !=0 ){
      newString = newString.substring(0,newString.length()-1);
    }
  }else if(keyCode!=SHIFT){
    newString += key;
  }
}

public class Particle{
  // Velocity
  RPoint vel;

  // Position
  RPoint pos;
  RPoint lastpos;

  // Caracteristics
  int col;
  float sz;

  // ID
  int id;

  // Constructor
  public Particle(PGraphics gfx, int ident){
    pos = new RPoint(random(-gfx.width/2,gfx.width/2), random(-gfx.height/2,gfx.height/2));
    lastpos = new RPoint(pos);
    vel = new RPoint(0, 0);

    colorMode(HSB);
    sz = random(2,3);

    id = ident;
  }

  // Updater of position, velocity and colour depending on a RGroup
  public void update(RGroup grp){
    lastpos = new RPoint(pos);
    pos.add(vel);
    RPoint[] ps = grp.getPoints();
    if(ps != null){
      float distancia = dist(pos.x,pos.y,ps[id].x,ps[id].y);
      if(distancia <= toldist){
        id = (id + 1) % ps.length;

      }

      RPoint distPoint = new RPoint(ps[id]);
      distPoint.sub(pos);

      distPoint.scale(random(MINNERVE,MAXNERVE));
      vel.scale(random(MININERTIA,MAXINERTIA));
      vel.add(distPoint);

      // Alpha and saturation in function of the velocity of the drawing
      float velnorm = constrain(vel.norm(),0,maxvel);
      float sat = abs(maxvel - velnorm)/maxvel*maxalph;
      col = color(0,2,1,sat);
    }
  }

  public void setPos(RPoint newpos){
    lastpos = new RPoint(pos);
    pos = newpos;
  }

  // Drawing the particle
  public void draw(PGraphics gfx){
    stroke(col);
    line(lastpos.x,lastpos.y,pos.x, pos.y);
  }
}


