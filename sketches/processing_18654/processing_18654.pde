
class Bug {

// fields

boolean button = false;

int locX;
int locY;
int spots;

int bugHead;
int bugBody;

int fillR;
int fillG;
int fillB;

int yellowR = 255;
int yellowG = 247;
int yellowB = 7;

int grass = 200;
int grassW = 6;

int fireFlyX = 8;
int fireFlyY = 8;
int fireFlyW= 8;
int fireFlyH = 8;



//constructor

Bug(int tempLocX, int tempLocY, int tempBugHead, int tempBugBody, int tempSpots, int tempFillR, int tempFillG, int tempFillB) {
locX      = tempLocX;
locY      = tempLocY;
bugHead   = tempBugHead;
bugBody   = tempBugBody;
spots     = tempSpots;
fillR  =  tempFillR;
fillG  =  tempFillG;
fillB  =  tempFillB;

}

// methods

void display() {
  
  colorMode(RGB,255);
  noStroke();
 
 //head
  fill(0);
  ellipse(locX,locY-55,bugHead,bugHead);
  
  //antenna
  stroke(0);
  strokeWeight(1);
  line(locX-10,locY-70,locX -27 ,locY -80 );
  line(locX+10,locY-70,locX +27,locY -80);

 
  //body
  stroke(0);
  strokeWeight(3);
  fill(fillR,fillG,fillB);
  ellipse(locX,locY,bugBody,bugBody+10);
  
  //stripe
  line(locX,locY-55,locX,locY+54);
  
  //spots
  noStroke();
  fill(0);
    //middle spots
  ellipse(locX+15,locY+5,spots,spots);
  ellipse(locX-15,locY+5,spots,spots);
    //top layer spots
  ellipse(locX+35,locY-25,spots,spots);
  ellipse(locX-35,locY-25,spots,spots);
    //bottom layer spots
  ellipse(locX+30,locY+35,spots,spots);
  ellipse(locX-30,locY+35,spots,spots);
  
  if ( keyPressed ) {
    button = true;
  } else { 
    button = false;
  }
  
  
  if (button) {
    noStroke();
    fill(yellowR,yellowG,yellowB);
    //body
    ellipse(locX,locY,bugBody,bugBody+10);
    
    //stripe
    stroke(0);
    line(locX,locY-55,locX,locY+54);
      //middle spots
    fill(0);
    ellipse(locX+15,locY+5,spots,spots);
    ellipse(locX-15,locY+5,spots,spots);
      //top layer spots
    ellipse(locX+35,locY-25,spots,spots);
    ellipse(locX-35,locY-25,spots,spots);
      //bottom layer spots
    ellipse(locX+30,locY+35,spots,spots);
    ellipse(locX-30,locY+35,spots,spots);

  }

  
  //WHITE SPOTS
  if (mousePressed) {
        noStroke();
    fill(100);
      //middle spots
    ellipse(locX+15,locY+5,spots,spots);
    ellipse(locX-15,locY+5,spots,spots);
      //top layer spots
    ellipse(locX+35,locY-25,spots,spots);
    ellipse(locX-35,locY-25,spots,spots);
      //bottom layer spots
    ellipse(locX+30,locY+35,spots,spots);
    ellipse(locX-30,locY+35,spots,spots);
    
    // FIREFLIES
    fireFlyX = int(random(0,250));
    fireFlyY = int(random(0,250));
    noStroke();
    fill(random(0,255));
    ellipse(fireFlyX,fireFlyY,fireFlyW,fireFlyH); 
    
  
  
  } 
  
}
}



