
import TUIO.*;
TuioProcessing tuioClient;
PFont font ;
float x ;
float y ;
float speed=4.5 ;
PImage monImage ;

void setup()
{
  size(1024, 768);
  tuioClient  = new TuioProcessing(this);
    font=loadFont ("TempusSansITC-48.vlw") ;
  textFont(font, 48) ;
 x= width/2 ;
 y= height/2 ;
 monImage=loadImage("virus.jpg") ;
  
}

// A l'interieur de la fonction/méthode  DRAW on recupère un Vector qui contient la liste des TuiObjects & des TUICursor 
// on utilise ensuite ces coordonnées pour activer/assigner un usage à chacun d'entre eux 

void draw() 
{

  //background(255);//éviter les fonds blanc
  background(0);
  commencement();

  Vector tuioObjectList = tuioClient.getTuioObjects();
  for (int i=0;i<tuioObjectList.size();i++) {

    TuioObject tobj = (TuioObject)tuioObjectList.elementAt(i);

    pushMatrix();
    translate(tobj.getScreenX(width), tobj.getScreenY(height));
    rotate(tobj.getAngle());
    println("angle "+ tobj.getAngle());


    if (tobj.getSymbolID()==59)
    { //INDIQUE LE Numero d'ID de la fiche
    virus();
    }
    
    if (tobj.getSymbolID()==49) {
      contagion();
    }
    if (tobj.getSymbolID()==56) {
      cerclealeatoire();
    }
   
    if (tobj.getSymbolID()==35) {
      imagevirus();
    }
   
    popMatrix();
  }
}




// these callback methods are called whenever a TUIO event occurs

// called when an object is added to the scene
void addTuioObject(TuioObject tobj) {
}

// called when an object is removed from the scene
void removeTuioObject(TuioObject tobj) {
  println("remove object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+")");
 
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {
  // println("update object "+tobj.getSymbolID()+" ("+tobj.getSessionID()+") "+tobj.getX()+" "+tobj.getY()+" "+tobj.getAngle()
  //    +" "+tobj.getMotionSpeed()+" "+tobj.getRotationSpeed()+" "+tobj.getMotionAccel()+" "+tobj.getRotationAccel());
}



// called after each message bundle
// representing the end of an image frame
void refresh(TuioTime bundleTime) { 
  redraw();
}

void commencement()
{
 stroke (105, 255, 21) ;
 line (512,0,512,768) ;
 line (0,369,1024,369) ;
}


void virus(){
   for  ( int x=10; x<screen.width ; x+=10) {
        for (int y= 10 ;y<screen.height ; y+=10) {
          ellipse(x, y, random (10), random (10) ) ;
        }
      }
}

void contagion() {
   stroke (105,255,21) ;
   
  text("STOP!Je suis contagieux", random (width),random (height));
println (frameRate);
  }
  
  void cerclealeatoire () {
     background (0 ) ;
 x+=random (-speed, speed ) ;
 y+=random (-speed, speed ) ;
  ellipse (x,y, 100, 100 ) ;
  }
  
  void imagevirus() {
     image(monImage, 0, 0, 200, 200);
  
  }

