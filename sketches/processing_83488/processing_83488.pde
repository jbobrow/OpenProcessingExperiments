
//Project 1
 
//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA
  //credit to George Lucas, Lucasfilm, etc for the ideas, concept, and imagery of Star Wars
  //final win image is from http://news.thomasnet.com/IMT/2008/04/01/inside-controversial-aerospace-plans-for-space-station-dubbed-death-star-satire/ (http://news.thomasnet.com/IMT/Death_Star_1_destroyed_at_Yavin.jpg, accessed 11/28/2012)
  
//GAME: Destroy the Deathstar
  //INSTRUCTIONS:
//you are a Rebel trying to destroy the evil Empire's DEATH STAR
//use your mouse to fire at the TIE fighters
//once you shoot enough TIE fighters, you'll be able to blow up the DEATH STAR
//good luck!










//globals
PImage imgWin;

int stage = 0;

generateBox g;

generateTIE t;
float zTranslateTIE = -3000;

int hitCount = 0;

float crosshairSize = height*.10;
float crosshairX = mouseX;
float crosshairY = mouseY;
  
int wallSizeX = 125;
int wallSizeY = 300;
int wallSizeZ = 2600;
int wallBottomTranslateX = 400 ;
int wallBottomTranslateY = 300 ;
int wallBottomTranslateZ = -1000 ;
int wallLeftTranslateX = wallBottomTranslateX - (wallSizeX*2) ;
int wallLeftTranslateY = 300 ;
int wallLeftTranslateZ = -1000 ;
int wallRightTranslateX = wallBottomTranslateX + (wallSizeX*2) ;
int wallRightTranslateY = 300 ;
int wallRightTranslateZ = -1000 ;
 int wallBotBoxesTranslateX = wallBottomTranslateX;
 int wallBotBoxesTranslateY = wallBottomTranslateY+wallSizeY-50;
 int wallBotBoxesTranslateZ = wallBottomTranslateZ;







void setup ()  {
  size (800,600, P3D);
  background (0);
  noCursor ();
  /*THE ORIGIN IS NOT AT (0,0)! THE ORIGIN IS NOT AT (0,0)! THE ORIGIN IS NOT AT (0,0)! THE ORIGIN IS NOT AT (0,0)! */ 
  translate (width/2, height/2, 0);
  
  imgWin = loadImage("800x600destroy.png");
  
  setupStyle();
    
  g = new generateBox();
  g.setup();
  
  t = new generateTIE();
  t.setup();
  
}


void draw ()  {
  background (0);
  lights ();
  directionalLight(51, 102, 126, 0, 1, -1);

  if (stage < 1)  {
    beginningStage ();
  }

  if ( stage == 1)  {
    //playing stage
    crossHair();
    generateWalls ();
    targetable01 ();    
  }

  if ( stage == 2)  {
    background(0);
    failedStage (); 
  }

  if ( stage == 3)  {
    background(0);
    winStage ();
  }  

println (stage);
//println (hitCount);
}











void mousePressed ()  {
  if (stage == 1)  {
    pushStyle();
      stroke(255,0,0);
      strokeWeight(10);
      line (mouseX, mouseY, 500, mouseX, mouseY,-3000);  //lazer/torpedo feedback for when you're shooting
    popStyle();
  }
}

void keyPressed ()  {
  if (key == ' ')  {
    stage = 1;
  }
  if ( (key == 'r')&&(stage!=1) )  {  //cant restart while playing game
    stage = 0; 
  }  
//  if (key == 'w')  {  //comment out when actually playing game
//    stage = 3; 
//  }    
}


void winStage()  {
  image (imgWin, 0,0);
  pushMatrix();
    pushStyle();
      textAlign(CENTER);
      textSize (25);
      fill (255);
      text ("You succeeded!", 200,100,0);
      textSize (20);
      text ("PRESS R TO GO AGAIN", 200,150,0);
    popStyle();    
  popMatrix();
}


void failedStage ()  {
  pushMatrix();
    translate (400, 400, 0);
    pushStyle();
      textAlign(CENTER);
      textSize (25);
      fill (255);
      text ("YOU HAVE FAILED", 0,-200,0);
      textSize (20);
      text ("PRESS R TO RETRY", 0,0,0);
    popStyle();
  popMatrix();
}

void beginningStage ()  {
  pushMatrix();
    translate (400, 400, 0);
    pushStyle();
      textAlign(CENTER);
      textSize (20);
      fill(16,85,230);
      String s = "A long time ago in a galaxy far, far away....";
      text(s, -350, -350, 325, 100);      
      textSize (25);
      fill (255);
      text ("Destroy the EMPIRE'S ultimate weapon, the DEATH STAR", 0,-200,0);
      text ("and restore freedom to the galaxy.", 0,-170,0);
      text ("You are flying a Rebel X-wing fighter.", 0,-100,0);
      text ("Shoot down any TIE fighters!", 0,-50,0);
      text ("PRESS SPACE TO BEGIN", 0,0,0);
    popStyle();
  popMatrix();
  pushMatrix();
    translate (400, 500, 0);
    t.draw();
  popMatrix();  
}


void targetable01 ()  {
  pushMatrix ();
    translate (0,0, zTranslateTIE);
    if (frameCount > 0)  {
      zTranslateTIE = zTranslateTIE + 30; /*make this number higher to make the TIE approach faster*/
      if (zTranslateTIE > 400)  {
        stage = 2;
        zTranslateTIE = -3000; /* or close to what the original value was */
      }
    }
    t.draw();
    t.move();
    t.target();
  popMatrix();  
}


void generateWalls (){
  //bottom floor
  pushMatrix ();
    translate (wallBottomTranslateX, wallBottomTranslateY+wallSizeY, wallBottomTranslateZ);
    box ((wallRightTranslateX-wallLeftTranslateX-wallSizeX), wallSizeY, wallSizeZ);
  popMatrix();
  pushMatrix ();
    translate (wallBotBoxesTranslateX, wallBotBoxesTranslateY, wallBotBoxesTranslateZ);
    g.draw();
    g.move();
  popMatrix();
  
  //left wall
  pushMatrix ();
    translate (wallLeftTranslateX, wallLeftTranslateY, wallLeftTranslateZ);
    box (wallSizeX, wallSizeY, wallSizeZ);   
    g.draw();
    g.move();
  popMatrix();

  //right wall
  pushMatrix ();
    translate (wallRightTranslateX, wallRightTranslateY, wallRightTranslateZ);
    box (wallSizeX, wallSizeY, wallSizeZ);
    g.draw();
    g.move();    
  popMatrix();
}



void crossHair ()  {
  pushMatrix();
  pushStyle();
  stroke (255,0,0);
  noFill ();
  crosshairSize = height*.10;
  crosshairX = mouseX;
  crosshairY = mouseY;

  translate (0,0, 200);

  ellipse (crosshairX, crosshairY, crosshairSize, crosshairSize);
  line (crosshairX-crosshairSize, crosshairY, crosshairX+crosshairSize, crosshairY);
  line (crosshairX, crosshairY-crosshairSize, crosshairX, crosshairY+crosshairSize);
  popStyle();
  popMatrix();
}

void setupStyle ()  {
  noStroke ();
  fill (200);

}

