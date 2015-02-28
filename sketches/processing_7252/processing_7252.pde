
/*
 * --=[WoG]=--
 * by Jonsku, January 2010
 * --
 * 'Reverse engineering' of a very small part the awesome game World Of Goo by 2D Boy
 * http://www.worldofgoo.com/
 * If you are not familliar with the game, try out the demo from their web site.
 *
 * The idea is to build structures by attaching those goo balls to each other
 * --
 * INSTRUCTIONS:
 * Click to spawn a new goo ball
 * Click and drag to move a goo ball around
 * If there is a possibility to attach the ball to the structure you will see red lines
 * Release mouse to drop goo ball or attach to structure
 * SPACE BAR to destroy the structure
 */
import traer.physics.*;

/*
  Holds springs objects and draw a 'skinned' link
*/
class Goolink{
  Spring spring;
  PImage linkImg;
  
  float lastLength = 0;
  public Goolink(Spring s){
    spring = s;
  }
  /*
  draw the link
  */
  void draw(){
    Particle a = spring.getOneEnd();
    Particle b = spring.getTheOtherEnd();
    if(abs(lastLength-spring.currentLength())>2){
      //regenerate the gfx if length have changed too much
      lastLength=spring.currentLength();
      generateLink( a,  b);
    }
    
    float currentDirection = atan2(b.position().y()-a.position().y(),b.position().x()-a.position().x());
  
    pushMatrix();
    translate(a.position().x()+worldX,a.position().y()+worldY);
  
    rotate(currentDirection);
    image(linkImg,-halfThickness,-linkImg.height/2);
    popMatrix();
    
}

/*
Generate the link gfx -- this is heavy on the frame rate
*/
  void generateLink(Particle a, Particle b){
      noStroke();
      float mX = dist(a.position().x(),a.position().y(),b.position().x(),b.position().y());
      float midX = mX/2;

      float firstQuart = (midX)/2;
    
      float thirdQuart = (midX+firstQuart);
    
      float centerThickness = map(mX,MAX_DIST,0,minCenterThickness,maxCenterThickness);
      float controlThickness = halfThickness-(maxCenterThickness-centerThickness)/2;
    
      linkImg = createImage(pgTexture.width,pgTexture.height,RGB);
      linkImg.copy(pgTexture, 0, 0, pgTexture.width,pgTexture.height, 0, 0, pgTexture.width,pgTexture.height); 
    
    
      PGraphics pgLink = createGraphics(pgTexture.width, pgTexture.height, P2D);
      pgLink.beginDraw();
      pgLink.smooth();
      pgLink.background(0);
      pgLink.fill(255);
      pgLink.translate(halfThickness,pgLink.height/2);
      pgLink.beginShape();
      pgLink.vertex(-halfThickness, 0);
      pgLink.bezierVertex(0.0, -halfThickness*2, firstQuart, -controlThickness, midX, -centerThickness/2);
    
      pgLink.bezierVertex(thirdQuart, -controlThickness,mX, -halfThickness*2, mX+halfThickness,0);
    
      pgLink.bezierVertex(mX, halfThickness*2,thirdQuart, controlThickness, midX, centerThickness/2);
    
      pgLink.bezierVertex(firstQuart, controlThickness, 0, halfThickness*2, -halfThickness, 0);
    
      pgLink.endShape();
      pgLink.endDraw();
      linkImg.mask(pgLink);
  }
}


ParticleSystem physics;

ParticleSystem gooBallPhysics;

//World physics parameters 
float DRAG = 0.1;
float GRAVITY = 0.9;
int particleR = 20;
float MAX_DIST = 200;
int MAX_CONNECT = 2;
int MIN_CONNECT = 2;

//Springs parameter
float STRENGTH = 0.2;
float DAMPING = 0.1;

//distance of the ground
float GROUND = 50;



int selectedGoo = -1;

//background
/*
background image from flickr : http://www.flickr.com/photos/justinmclean/35826485/sizes/o/
*/
PImage bgImage;


//goo link gfx data
PImage pgTexture;
int maxCenterThickness = particleR;
float halfThickness = maxCenterThickness/2;
int minCenterThickness = 10;

//world translation vector
int worldX = 0;
int worldY = 0;

//a list of Goolink objects
ArrayList gooLinks;

void setup()
{
  size( 600, 600 );
  smooth();
  
  bgImage = loadImage("city_scape.jpg");
  //create or load a texture
  createSpringTexture();
  ellipseMode( CENTER );
  //physics simulation  
  gooBallPhysics = new ParticleSystem( GRAVITY, DRAG );
  gooBallPhysics.setIntegrator(ParticleSystem.MODIFIED_EULER);
  physics = new ParticleSystem( GRAVITY, DRAG );
  physics.setIntegrator(ParticleSystem.MODIFIED_EULER);
  //initialize
  reset();
}

void draw()
{
  
  //move simulation forward
  physics.tick();
  gooBallPhysics.tick();
  
  //takes care of the scrolling
  if(mouseX<50){
    worldX+=2;
  }
  if(mouseX>width-50){
    worldX-=2;
  }
  if(mouseY>height-50){
    worldY-=2;
  }
  if(mouseY<50){
    worldY+=2;
  }
  
  //make sure we don't go too far
  worldY = worldY<0?0:worldY;
  worldY = worldY>bgImage.height-height?bgImage.height-height:worldY;
  
  worldX = worldX<(width-bgImage.width+bgImage.width/2)?(width-bgImage.width+bgImage.width/2):worldX;
  worldX = worldX>bgImage.width/2?bgImage.width/2:worldX;

  //draw the background
  image(bgImage,-bgImage.width/2+worldX,height-bgImage.height+worldY);
  
  //translate for scrolling
  translate(worldX,worldY);
  
  //to make sure we are above the ground when moving a goo with the mouse
  int mY = int(mouseY-worldY*2>height-GROUND?height-GROUND:mouseY-worldY*2);
  if(selectedGoo!=-1){
    //look for closest node
    int[] closest = getClosestParticles(mouseX-worldX*2, mY, selectedGoo, MAX_CONNECT, MIN_CONNECT, MAX_DIST);
    for(int c=-1;++c<closest.length;){
      if(closest[c]!=-1)
        drawLine(mouseX-worldX*2, mY, physics.getParticle(closest[c]).position().x(), physics.getParticle(closest[c]).position().y(), map(dist(mouseX-worldX*2, mY,physics.getParticle(closest[c]).position().x(),physics.getParticle(closest[c]).position().y()),0,MAX_DIST,20,1));
    }
  }
  
  noStroke();
  
  //stop the particles from falling, yep that is what the ground does 
  for(int i=-1;++i<physics.numberOfParticles();){
    Particle p = physics.getParticle(i);
    //make sure particles are above ground
    if(p.position().y()>height-GROUND) p.position().set(p.position().x(), height-GROUND, 0);
  } 

  //draw all the springs
  for(int i=-1;++i<gooLinks.size();)
   ((Goolink)gooLinks.get(i)).draw();

  //draw the nodes
  for(int i=-1;++i<physics.numberOfParticles();)
    drawNode(physics.getParticle(i));
  
  for(int i=-1;++i<gooBallPhysics.numberOfParticles();){
    Particle p = gooBallPhysics.getParticle(i);
    //move the selected particle with the mouse
    if( i == selectedGoo) p.position().set(mouseX-worldX*2, mY, 0);
    //make sure goo balls are above ground
    if(p.position().y()>height-GROUND) p.position().set(p.position().x(), height-GROUND, 0);
    drawGoo(p);
  }  
}

//////////// INPUTs/OUTPUTs

void drawLine(float x1, float y1, float x2, float y2, float strokeW){
  stroke(255,0,0,100);
  strokeWeight(strokeW);
  line(x1+worldX,y1+worldY,x2+worldX,y2+worldY);
}

void drawGoo(Particle p){
  noStroke();
  fill(0);
  ellipse(p.position().x()+worldX,p.position().y()+worldY,particleR,particleR);
}

void drawNode(Particle p){
  strokeWeight(2);
  stroke(42,125,0);
  fill(174,254,133);
  ellipse(p.position().x()+worldX,p.position().y()+worldY,particleR+10,particleR+10);
}


//////////// UTILITIES


/*
 returns the index of the particle at coordinates (x,y) in radius r
 return -1 if nothing was found
*/
int getParticleIndexAt(int x, int y, int r){
  int ind = -1;
  for(int i=-1;++i<gooBallPhysics.numberOfParticles();){
    Particle p = gooBallPhysics.getParticle(i);
    if(dist(x,y,p.position().x(),p.position().y())<=r){
      ind = i;
      break;
    }
  }
  return ind;  
}
/*
  return true if two particle a and b are already connected to each other by a spring
  return false otherwise
*/
boolean areAlreadyConnected(Particle a, Particle b){
  for(int i=-1;++i<physics.numberOfSprings();){
    Particle a2 = physics.getSpring(i).getOneEnd();
    Particle b2 = physics.getSpring(i).getTheOtherEnd();
    if((a == a2 && b == b2) || (a == b2 && b == a2))
      return true;
  }
  return false;
}

/*
 return an array of length n containing at least m indice of closests nodes that are at a distance equal or lower than maxDist to the point of coordinates (x,y);
 else return an array of size 0;
*/
int[] getClosestParticles(int x, int y, int particle, int n, int m, float maxDist){
  Particle target = gooBallPhysics.getParticle(particle);
  int[] result = new int[n];
  for(int i =-1;++i<result.length;)
    result[i] = -1;
    
  int ind = 0;
  for(int i=-1;++i<physics.numberOfParticles();){
    Particle p = physics.getParticle(i);
    float d = dist(x,y,p.position().x(),p.position().y());
    if(d <= maxDist){
      boolean addToResult = true;
      if(ind>=result.length){
        for(int j=-1;++j<ind && addToResult;){
          if(result[j]>=0){
            Particle r = physics.getParticle(result[j]);
            if(d<dist(x,y,r.position().x(),r.position().y())){
              result[j] = i;
              addToResult = false;
            }
          }
        }
      }
      if(addToResult && ind<result.length)
        result[ind++] = i;
    }
  }
  if(ind>=m)
    return result;
  else{
    return new int[0];
  }
}

//////////// INPUTs/OUTPUTs

void keyReleased(){
  //reset
  if(key == ' ')
    reset();
}

void mouseClicked(){
  // drop a goo ball
  gooBallPhysics.makeParticle(1, mouseX-worldX*2, mouseY-worldY*2,0 );

}

void mousePressed(){
  //pick up a goo ball if there is one under the mouse
  selectedGoo = getParticleIndexAt(mouseX-worldX*2,mouseY-worldY*2,particleR);
}

void mouseReleased(){
  if(selectedGoo>-1){
    //If a goo ball is selected and there are nodes close enough, create links and add goo ball to the texture
    int[] closest = getClosestParticles(mouseX-worldX*2, mouseY-worldY*2, selectedGoo, MAX_CONNECT, MIN_CONNECT, MAX_DIST);

    Particle goo = gooBallPhysics.getParticle(selectedGoo);
    boolean added = false;

    Particle a = null;
    Particle b = null;
    for(int c=-1;++c<closest.length;){
      if(closest[c]!=-1){
        if(a == null)
          a = physics.getParticle(closest[c]);
        else if(b == null)
          b = physics.getParticle(closest[c]);
      }
      if(a!=null && b!=null){
        break;
      }
    }
    boolean connected = areAlreadyConnected(a,b);
    if(a!=null && b!=null && !connected){
      gooLinks.add(new Goolink(physics.makeSpring(a, b, STRENGTH, DAMPING, dist(a.position().x(),a.position().y(),b.position().x(),b.position().y()))));
      added = true;
    }else if(!added){


      Particle nonGoo = physics.makeParticle(1, goo.position().x(), goo.position().y(),0);
      for(int c=-1;++c<closest.length;){
        if(closest[c]!=-1){
          added = true;
          gooLinks.add(new Goolink(physics.makeSpring(nonGoo, physics.getParticle(closest[c]), STRENGTH, DAMPING, dist(mouseX-worldX*2, mouseY-worldY*2,physics.getParticle(closest[c]).position().x(),physics.getParticle(closest[c]).position().y()))));
        }
      }
      if(!added){
        physics.removeParticle(nonGoo);
      }
    }
    if(added){
      //bye bye goo
      gooBallPhysics.removeParticle(goo);
    }
  }
  //nothing is selected anymore
  selectedGoo=-1;
}

//////////// INITIALISATION

void reset(){
  while(physics.numberOfSprings()>0){
    physics.removeSpring(0);
  }
  
  while(physics.numberOfParticles()>0){
    Particle p = physics.getParticle(0);
    gooBallPhysics.makeParticle(1,p.position().x(), p.position().y(),0 );
    physics.removeParticle(p);
  }
  
  gooLinks = new ArrayList();
  Particle a1 = physics.makeParticle(1, width/2-MAX_DIST/2, height-GROUND,0 );
  Particle b1 = physics.makeParticle(1, width/2+MAX_DIST/2, height-GROUND,0 );
  Particle a2 = physics.makeParticle(1, width/2-MAX_DIST/2, height-GROUND-MAX_DIST/2,0 );
  Particle b2 = physics.makeParticle(1, width/2+MAX_DIST/2, height-GROUND-MAX_DIST/2,0 );
  a1.makeFixed();
  a2.makeFixed();
  b1.makeFixed();
  b2.makeFixed();


  gooLinks.add(new Goolink(physics.makeSpring(a1, b1, STRENGTH, DAMPING, MAX_DIST)));
 gooLinks.add(new Goolink(physics.makeSpring(a2, b2, STRENGTH, DAMPING, MAX_DIST)));

  gooLinks.add(new Goolink(physics.makeSpring(a1, b2, STRENGTH, DAMPING, dist(a1.position().x(),a1.position().y(),b2.position().x(),b2.position().y()))));
  gooLinks.add(new Goolink(physics.makeSpring(a1, a2, STRENGTH, DAMPING, MAX_DIST/2)));

  gooLinks.add(new Goolink(physics.makeSpring(b1, b2, STRENGTH, DAMPING, MAX_DIST/2)));
  gooLinks.add(new Goolink(physics.makeSpring(b1, a2, STRENGTH, DAMPING, dist(a2.position().x(),a2.position().y(),b1.position().x(),b1.position().y()))));
}


void createSpringTexture(){
  pgTexture = loadImage("texture.png");
  /* One could also program a texture here instead of loading from an image file */
  /*
  PGraphics pgTex = createGraphics(ceil(MAX_DIST+maxCenterThickness), maxCenterThickness+10, P2D);
  pgTex.beginDraw();
  pgTex.smooth();
  pgTex.background(0,255,0);
  pgTex.noFill();
  pgTex.stroke(0,255,255);
  pgTex.strokeWeight(15);
  float x = pgTex.width/2;
  float y = pgTex.height/2;
  for(int r = 50; r<x*2;r+=50){

    pgTex.ellipse(x,y,r,r);
  }
  pgTex.endDraw();
  pgTexture = pgTex;
  */
}




















