
/* 
 December 1 2014 - nanoBubbles
 by LluÃ­s Montabes
 Copyright (c) 2014 LluÃ­s Montabes
 
 SUMMARY
 
 This program draws circles of random radius and random position.
 If one circle overlap any box margin it is projected at a velocity 
 proportional to the overlap and always oriented to the interior of 
 the box.
 
 If one circle collides with another they expell each other adding 
 to the actual velocity of each one a vector proportional to the 
 width of the intersection of the two circles and opposite oriented 
 to the center of each other.
 
 USER CONTROLS
 
 - Mouse Press on a bubble: captures the selected bubble
 - Drag-and-Throw: with a captured bubble, it changes position and 
 sets velocity to be used when the event mouseRelease would happen
 - Mouse scroll: increases-decreases gravity
 - Double-click: restart the program
 - Press 'i': restart the program
 - Press 'l' swaps Collision Lines visible / unvisible
 - Press 'm' swaps freezes / unfreezes the screen
 - Press 's' to save one jpg file
 
 PHYSICAL REALITY SIMPLIFIED VIRTUAL MODEL
 
 The program is a simplified model of physical reality at quantum
 level. It emulates the behaviour of very small particles (could be
 atoms or mollecules, but also particles of several mollecules but
 really small.
 
 At this very small size level the walls of our container (our
 scketch window) are not still but always shaking. We can't see it
 because our frames coincide with the vibration of the walls and we
 see them allways at the very same moment of their cicle. But they
 vibrate and it can be deduced from the fact that between one 
 frame and the next one our Bubbles can "penetrate" beyond the limits
 of the walls we can see. In the physical reality it can be seen a
 the displacement of the whole wall in the same X or Y direction
 of the coming ball until when the next phase of the wall vibration 
 starts the wall finds and hits the bubble giving it much energy
 coming from the same wall vibration.
 
 This back movement of the wall and the hitting of the coming bubble
 if the cause of the Bubbles being projected ramdomly and of its
 vibration when gravity is high. It can be seen as the effect of
 temperature of the walls that transmits energy in the form of heat 
 to the bubble.
 
 
 FUTURE DEVELOPMENTS ON JUNE 20
 
 The program will be developed in the following aspects:
 
 1) Collisions will be rewritten so they follow the momentum and 
 conservation energy conservation laws. This will probably force 
 to rewrite friction and other energy losses so the system can
 slow down (cold down in the real world), as it does so far.
 
 2) Chemical and nuclear reactions can be emulated by linking
 Bubbles to each other when reaching a particular level of force
 between them.
 
 3) Events will be rewritten so gestures can be used with smartphones
 and tablets, in order to avoid the keyboard and some mouse events
 that don't work properly with these devices.
 
 
 ENJOY!
 
 */

int iFrames=10;
int iNum=50;
float gravity=9.8;
 
float[] fOBx = new float[100];
float[] fOBy = new float [100];
float[] fOBVx = new float [100];
float[] fOBVy = new float [100];
float[] fOBxo = new float [100]; // Point where the circle was clicked related to its center
float[] fOByo = new float [100];
float[] fOBradius = new float [100];
color[] fOBcolor = new color [100];
float[] fNx = new float[100];
float[] fNy = new float[100];
boolean[] bOBClicked = new boolean[100];
 
float fElasticity = 1; // Factor of elasticity of the virtual matter of the balls.
int lastPressMillis = 0; // Last milisecond mouseClicked happened.
int lastPressMouseX = 0;
int lastPressMouseY = 0;
 
 
boolean bSeeLines = true;
boolean bMouvement = true;
 
 
void setup() {  //setup function called initially, only once
  size(600, 600);
  background(240);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  frameRate(iFrames);
  initiateCollection ();
  drawCollection();
  initiateUserEvents();
}
 
void draw() {  //draw function loops
  if (bMouvement) {
    updateCollection();
    drawCollection();
  }
  //userEvents();
}
 
void keyPressed() {
  //if (keyPressed) {
  switch(key) {
  case 'i':
    initiateCollection();
    drawCollection();
    break;
  case 'l':
    bSeeLines = bSeeLines==false;
    break;
  case 'm':
    bMouvement = bMouvement==false;
    break;
  case 's':
    saveFrame("NBalls.jpg");
    break;
  }
}
//}
void mousePressed() {
  if (bOBClicked[0]==false) {
    for (int i=1; i<=iNum; ++i) {
      if (fOBx[i]-fOBradius[i]<mouseX && mouseX<fOBx[i]+fOBradius[i] && fOBy[i]-fOBradius[i]<mouseY && mouseY<fOBy[i]+fOBradius[i]) {
        bOBClicked[i]=true;
        fOBxo[i]=fOBx[i]-mouseX;
        fOByo[i]=fOBy[i]-mouseY;
        bOBClicked[0]=true;
      }
    }
  }
  if (lastPressMouseX==999999) {
    lastPressMouseX=mouseX;
    lastPressMouseY=mouseY;
  }
}
 
void mouseReleased() {
  if (bOBClicked[0]==false) {
    if (lastPressMouseX!=999999) {
      gravity+=0.05*(mouseY-lastPressMouseY);
      iFrames+=0.05*(mouseX-lastPressMouseX);
      if (iFrames<1) iFrames=1;
      if (iFrames>60) iFrames=60;
      frameRate(iFrames);
      println("Gravity=", gravity, "Frames=", iFrames, "mouseReleased");
      println(mouseX, lastPressMouseX, mouseX-lastPressMouseX);
    }
  }
  initiateUserEvents();
}
 
void initiateUserEvents() {
  for (int i=0; i<=iNum; ++i) {
    bOBClicked[i]=false;
    fOBxo[i]=0;
    fOByo[i]=0;
  }
  lastPressMouseX=999999;
  lastPressMouseY=999999;
}
 
 
void mouseWheel(MouseEvent event) {
  /* By scrolling the mouse wheel we can change the parameter
   gravity. Scrolling forward increases gravity. Scrolling
   backwards decreases gravity. The factor is 1/10 of a virtual
   Newton each scroll click. It is a bit slow when trying high
   gravities but it makes possible to reach near 0 gravity.
    
   Zero gravity is interesting because all the Bubbles end reaching
   stillness. If one bubble is "drag-and-thrown"(1) it adds energy
   to the system, until that energy gets lost or disipated through
   the walls and the Bubbles get still again.
    
    
   1) See Human Forces
   */
 
  float e = event.getCount();
  gravity+=0.1*e;
  println("Gravity=", gravity, "mouseReleased");
}
 
 
void mouseClicked() {
  if (millis()-lastPressMillis<500) {
    // doble-click
    initiateCollection ();
    drawCollection();
    initiateUserEvents();
  }
  lastPressMillis=millis();
}
 
 
/*    FUNCTIONS ORDERED BY NAME     */
 
void checkWalls() {
 
  for (int i=1; i <=iNum; ++i) {
 
    if (fOBx[i]-fOBradius[i]<0) {
      fOBVx[i]=fElasticity*(fOBradius[i]-fOBx[i]);
      fOBx[i]=fOBradius[i];
    }
    if (fOBx[i]+fOBradius[i]>width) {
      fOBVx[i]=-fElasticity*(fOBx[i]+fOBradius[i]-width);
      fOBx[i]=width-fOBradius[i];
    }
    if (fOBy[i]-fOBradius[i]<0) {
      fOBVy[i]=fElasticity*(fOBradius[i]-fOBy[i]);
      fOBy[i]=fOBradius[i];
    }
    if (fOBy[i]+fOBradius[i]>height) {
      fOBVy[i]=-fElasticity*(fOBy[i]+fOBradius[i]-height);
      fOBy[i]=height-fOBradius[i];
    }
  }
}
 
void checkCollisions() {
 
  for (int i=1; i <=iNum; ++i) { // Under construction
    for (int j=1; j<=iNum; ++j) {
      float Dij=sqrt(sq(fOBx[i]-fOBx[j])+sq(fOBy[i]-fOBy[j])); // Distance from i to j circle center.
      float SRij=fOBradius[i]+fOBradius[j]; // Sum of radius
      // Calculation of the distance between the center points of i and j objects.
      if (Dij<SRij && i!=j) {
 
        // Calculation of the vector opposite to the one formed by the two center points of the objects colliding
        float xR=fOBx[i]-fOBx[j];
        float yR=fOBy[i]-fOBy[j];
        fNx[i]=xR;
        fNy[i]=yR;
        // Addition to the actual velocity of the collition vector. The strength of the impact is proportional to the
        // intersection of the two circles at the very moment of the frame time.
         
        //fOBVx[i]+=xR*(SRij-Dij)/SRij;
        //fOBVy[i]+=yR*(SRij-Dij)/SRij;
 
        if (SRij*1.0>Dij) {
        float fMass  = PI * sq(fOBradius[i]);
        //fOBVx[i]+=PI*sq(40)*(xR*pow((SRij-Dij)/SRij,2))/fMass;
        //fOBVy[i]+=PI*sq(40)*(yR*pow((SRij-Dij)/SRij,2))/fMass;
        fOBVx[i]+=min((20/1)*xR/Dij*pow((SRij*1.0-Dij),2)/fMass, 30);
        fOBVy[i]+=min((20/1)*yR/Dij*pow((SRij*1.0-Dij),2)/fMass, 30);}
      }
    }
  }
}
 
void checkForces() {
 
  for (int i=1; i <=iNum; ++i) {
 
    // Let's add gravity...
    fOBVy[i]+=gravity;
 
    /* Human Forces
     If one bubble has been caught by clicking it, its 'clicked'
     property is set to true, so it can have a particular movement
     treatment.
      
     The real analogy would be that the object is linked to another
     object (a human through technology) and follows its carrier
     movements.
      
     But the human, that is the user, can add energy to the system
     similarly as the way energy is added to a system by throwing
     something. We just need to assign velocity to the clicked object
     when it would be eventually released. Event that will trigger
     the mouseRelease event.
      
     The velocity calculated is the actual velocity at which the
     cursor is moving along the sketch window. Since the "sketch time"
     is mesured by the actual frameRate parameter, as it is easily
     deduced from the fact that we make a calculation every time a
     frame is displayed, and the movement of our objects are
     syncronized with that representation, it follows that we can know
     easily what is the velocity given to a bubble by throwing it, just
     calculating the pixels advanced by this bubble per unit of time,
     that is, per one frame-time. Since the time is one, we can ignore
     it and calculate the velocity just measuring space, that is the
     pixels advanced during the frame (mouseX-pmouseX, mouseY-pmouseY).
      
     The visual effect of calculating velocity this way is similar to
     the impression we have when throwing an object away, following
     the well known parabolic trail.
      
     */
    if (bOBClicked[i]==true) {
      fOBVx[i]=mouseX-pmouseX;
      fOBVy[i]=mouseY-pmouseY;
    }
  }
}
 
void drawCollection() {
  background(100, 190, 190);
  for (int i=1; i <=iNum; ++i) {
    drawObject (i);
  }
}
 
 
void drawObject (int item) {
  // draws the circle
  fill (fOBcolor[item], 180);
  noStroke();
  //ellipse ( fOBx[item], fOBy[item], fOBradius[item]*2, fOBradius [item]*2);
  ellipse ( fOBx[item], fOBy[item], fOBradius[item]*1.5, fOBradius [item]*1.5);
  // draws the line
  if (bSeeLines) {
    stroke(0, 255, 255, 255);
    line(fOBx[item], fOBy[item], fOBx[item]-fNx[item], fOBy[item]-fNy[item]);
  }
}
 
void initiateCollection() {
  for (int i=1; i <=iNum; ++i) {
    fOBx [i]=random (width);
    fOBy [i]=random (height);
    fOBVx [i]=random (-0, 0);
    fOBVy [i]=random (-0, 0);
    fOBradius [i]=random (20,90);
    /*if (i<11) {
    fOBradius[i] =60;
    } else {
    fOBradius[i] = 30;
    }*/
    fOBcolor [i]=color (random (100, 150), random (100, 150), random (100, 150));
  }
}
 
void updateCollection() {
  checkWalls();
  checkCollisions();
  checkForces();
  for (int i=1; i<=iNum; ++i) {
    fOBx[i]=fOBx[i]+fOBVx[i]; // The new position is the result of addint to the old one the velocity per 1 frame.
    fOBy[i]=fOBy[i]+fOBVy[i];
    if (bOBClicked[i]==true) {
      fOBx[i]=mouseX+fOBxo[i];
      fOBy[i]=mouseY+fOByo[i];
    }
  }
}

