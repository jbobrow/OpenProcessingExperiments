
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.dynamics.contacts.*;
import SimpleOpenNI.*;


/*
// MODE D'EMPLOI

Touche S -> Passer en mode "Settings", c'est lÃ  que l'on peut rÃ©gler les fenÃªtres.

Touches de 0 Ã  8 -> Permettent de sÃ©lectionner chaque fenÃªtre en partant d'en haut Ã  gauche (la zÃ©ro est la premiÃ¨re)

FlÃ¨ches haut/bas/droite/gauche -> permettent de dÃ©placer la fenÃªtre

Touches O et P -> permettent de rÃ©gler la largeur

Touches L et M -> permettent de rÃ©gler la hauteur

Touche G -> Revient en mode "Jeu"

Touche B -> Relance une nouvelle Balle

Touche Espace -> Lance le nouveau Joueur

*/


// A reference to our box2d world
Box2DProcessing monMonde2d;
Box myBarre;
Ballon myBallon;

// Pistons et Ã©lastiques pour la barre
Spring mySpring;
Spring2 spring2;
PrismaticJoint m_joint3;

ArrayList<Boundary> myBoundary;
ArrayList<Window> myWindow;

// ON/OFF pour Kinect // Debug
boolean debug = false;

SimpleOpenNI  context;
// ChangÃ© pour que tous les joueurs soient de la mÃªme couleur
color[]       userClr = new color[] {  
  color(255, 0, 0), 
  color(255, 0, 0), 
  color(255, 0, 0), 
  color(255, 0, 0)
};

PVector com = new PVector();                                   
PVector com2d = new PVector(); 

ArrayList    userVecList = new ArrayList();
int          userVecListSize = 30;

boolean ballonIsHere=false;

// GAMEPLAY
int nbreDeVies = 2;
int transition = 0;
int dureeYouLoose = 300;
int dureeYouWin = 300;
int actualMil;//compteur
int startMil = 0;
int restartMil=0;
int screenMil;

// Pour le rÃ©glage des fenÃªtres
XML xml;
int state = 1;
int workingOnWindowNumber = 0;


void setup() {
  size(1024, 768);
  smooth();
  actualMil = millis()/1000;
  screenMil = actualMil - restartMil;

  if (debug == false)
  {
    context = new SimpleOpenNI(this);// initialize SimpleOpenNI object

    //Le Kinect
    context = new SimpleOpenNI(this);
    if (context.isInit() == false)
    {
      println("Can't init SimpleOpenNI, maybe the camera is not connected!"); 
      exit();
      return;
    }

    // enable depthMap generation 
    context.enableDepth();
    // enable skeleton generation for all joints
    context.enableUser();
  }

  strokeWeight(3);

  monMonde2d = new Box2DProcessing(this);
  monMonde2d.createWorld();
  monMonde2d.setGravity(0, 0);

  // Add a listener to listen for collisions!
  monMonde2d.world.setContactListener(new CustomListener());

  //create arraylist of windows

  xml = loadXML("windowsPositions.xml");

  myWindow = new ArrayList<Window>();
  generateMyWindows();


  //Create arrayList of boundaries
  myBoundary = new ArrayList<Boundary>();
  myBoundary.add(new Boundary(width/2, 0, 1024, 10));
  myBoundary.add(new Boundary(width, height/2, 10, height));
  myBoundary.add(new Boundary(0, height/2, 10, height));


  myBarre = new Box(width/2, 760);
  mySpring = new Spring();
  mySpring.bind(width/2, 760, myBarre);
  PrismaticJointDef pjd = new PrismaticJointDef();
  Boundary myBoundaryTest = new Boundary(0, 760, 5, 5);
  pjd.initialize(myBoundaryTest.getBody(), myBarre.getBody(), new Vec2(0.0f, 0.0f), new Vec2(1.0f, 0.0f));
  m_joint3 = (PrismaticJoint) monMonde2d.createJoint(pjd);
}  


void draw() {

  // On choisit diffÃ©rents modes pour travailler, et on passera de l'un Ã  l'autre
  switch (state)
  {
    // Reglage des fenetres
  case 0:
    background (0);
    // On dessine les fenÃªtres Ã  leur place
    stroke (255);
    strokeWeight(3);
    rectMode(CORNER);
    pushMatrix();
    translate (-33, -47);
    XML[] children = xml.getChildren("window");
    for (int i = 0; i < children.length; i++) {
      float windowX = children[i].getInt("x");
      float windowY = children[i].getInt("y");
      float windowWidth = children[i].getInt("width");
      float windowHeight = children[i].getInt("height");
      if ( i == workingOnWindowNumber)
      {
        fill (255);
      } else {
        fill(255, 0, 0);
      }
      rect(windowX, windowY, windowWidth, windowHeight);
    } 
    popMatrix();

    break;


    // En cours de jeu
  case 1:  

    //joli mais sert Ã  rien...ah si enfait!
    fill(0, 0, 0, 100);
    rect(width/2, height/2, width, height);

    //Le p'tit compteur qui n'Ã©tait en effet pas compliquer Ã  mettre en place mais qui ne marche pas ici!??
    //int mil = millis()/1000;
    actualMil = millis()/1000;
    screenMil = actualMil-restartMil;
   
  
    
    textSize(25);
    //Juste changÃ© le stroke en fill
    fill(255);
    text("Chrono :"+(screenMil), 30, 30);
    text("Vies restantes :"+nbreDeVies, 30, 50);
      
   

    // update the cam
    if (debug == false)
    {
      context.update();
    }

    monMonde2d.step();

    // Display all the boundaries
    for (Boundary theBoundary : myBoundary) {
      theBoundary.display();
    }

    for (Window theWindow : myWindow) {
      theWindow.display();
    }

    if (debug == false)
    {

      //draw death map
      //image(context.depthImage(),0,0);
      //image(context.userImage(),0,0);

      // draw the skeleton if it's available
      int[] userList = context.getUsers();
      // for (int i=0;i<userList.length;i++)
      println(userList.length);
      if (userList.length>0)
      {
        int i=0;

        //DÃ©calage pour remplir l'Ã©cran  
        pushMatrix();
        scale(1.7);
        if (context.isTrackingSkeleton(userList[i]))
        {
          stroke(userClr[ (userList[i] - 1) % userClr.length ] );
          drawSkeleton(userList[i]);
        }      

        // draw the center of mass
        if (context.getCoM(userList[i], com))
        {
          context.convertRealWorldToProjective(com, com2d);
          stroke(100, 255, 0);
          strokeWeight(1);
          beginShape(LINES);

          vertex(com2d.x, com2d.y - 5);
          vertex(com2d.x, com2d.y + 5);

          vertex(com2d.x - 5, com2d.y);
          vertex(com2d.x + 5, com2d.y);
          endShape();

          // Le numÃ©ro de l'user. Pas trÃ¨s utile, non?
          // fill(0, 255, 100);
          //text(Integer.toString(userList[i]), com2d.x, com2d.y);
        }
        popMatrix();
      }
    }

    if (debug == false)
    {
      float myUpdatedX = com2d.x*1024/600;
      mySpring.update((int)myUpdatedX, 760);
    } else 
    {
      mySpring.update((int)mouseX, 760);
    }

    myBarre.display();

    // On checke si le ballon Ã©xiste toujours,
    // et si oui, s'il est sorti de l'Ã©cran.

    if (ballonIsHere == true)
    {

      if (myBallon.done()) {
        myBallon.killBody();
        ballonIsHere = false;

        // On dÃ©gage un point Ã  chaque fois que la balle sort de l'Ã©cran.
        if (nbreDeVies>0)
        {
          nbreDeVies--;
        } else {

          state = 3;
          nbreDeVies = 3;
        }
      } else {
        myBallon.display();
      }
    }
    break;
    
    // Nouveau Joueur
    case 2:
    
    text("Nouveau Joueur, prÃ©pare toi", width/2, height/2);
    
    
    break;
    
    // You loose
    case 3:
    background (0);
    fill(255);
    transition ++;
    if (transition < dureeYouLoose)
    {
      text("YOU LOOSE", width/2, height/2);
      
    }else{
      state = 2;
    }
    
    
    break;
    
    
    /*You WIN!
    case 4:
    background (0);
    fill(255);
    transition ++;
    if (transition < dureeYouWin)
    {
      if w.change()==true{
      text("YOU WIN", width/2, height/2);
      text(actualMil , 50,150);
      } 
    }else{
      state = 1;
    }
    
    
    break;*/
    
  }
}





// draw the skeleton with the selected joints
void drawSkeleton(int userId)
{
  // to get the 3d joint data

  //PVector jointPos = new PVector();
  //context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_NECK,jointPos);
  //println(jointPos);


  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);

  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);

  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
}


// -----------------------------------------------------------------
// SimpleOpenNI events

void onNewUser(SimpleOpenNI curContext, int userId)
{

  //int[] userList = curContext.getUsers();
  //if (userList.length<1)
  //{ 
  println("onNewUser - userId: " + userId);
  println("\tstart tracking skeleton");
  curContext.startTrackingSkeleton(userId);
  //}
}

void onLostUser(SimpleOpenNI curContext, int userId)
{
  println("onLostUser - userId: " + userId);
}

void onVisibleUser(SimpleOpenNI curContext, int userId)
{
  //println("onVisibleUser - userId: " + userId);
}

void generateMyWindows() {


  myWindow.clear();

  XML[] children = xml.getChildren("window");
  for (int i = 0; i < children.length; i++) {
    int windowX = children[i].getInt("x");
    int windowY = children[i].getInt("y");
    int windowWidth = children[i].getInt("width");
    int windowHeight = children[i].getInt("height");
    myWindow.add(new Window(windowX, windowY, windowWidth, windowHeight));
  }
}

void keyPressed () {

  // Relancer un ballon
  if (key == 'b')
  {
    if (ballonIsHere == false)
    {
      ballonIsHere = true;
      myBallon = new Ballon();
    }
  }

  // Reglage des fenetres
  if (key == 's')
  {
    state = 0;
  }

  // Reglage de la fenetre numÃ©ro
  if (key == '1')
  {
    workingOnWindowNumber = 1;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '2')
  {
    workingOnWindowNumber = 2;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '3')
  {
    workingOnWindowNumber = 3;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '4')
  {
    workingOnWindowNumber = 4;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '5')
  {
    workingOnWindowNumber = 5;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '6')
  {
    workingOnWindowNumber = 6;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '7')
  {
    workingOnWindowNumber = 7;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '8')
  {
    workingOnWindowNumber = 8;
  }
  // Reglage de la fenetre numÃ©ro
  if (key == '0')
  {
    workingOnWindowNumber = 0;
  }

  // Reglage de la fenetre numÃ©ro
  if (key == '0')
  {
    workingOnWindowNumber = 0;
  }

  if (key == CODED)
  {
    // Reglage de la fenetre POSITION 
    if (keyCode == UP)
    {
      XML[] children = xml.getChildren("window");
      int currentY = children[workingOnWindowNumber].getInt("y");
      children[workingOnWindowNumber].setInt("y", currentY-1);
    }
    if (keyCode == DOWN)
    {
      XML[] children = xml.getChildren("window");
      int currentY = children[workingOnWindowNumber].getInt("y");
      children[workingOnWindowNumber].setInt("y", currentY+1);
    }
    if (keyCode == LEFT)
    {
      XML[] children = xml.getChildren("window");
      int currentX = children[workingOnWindowNumber].getInt("x");
      children[workingOnWindowNumber].setInt("x", currentX-1);
    }
    if (keyCode == RIGHT)
    {
      XML[] children = xml.getChildren("window");
      int currentX = children[workingOnWindowNumber].getInt("x");
      children[workingOnWindowNumber].setInt("x", currentX+1);
    }

  }
  
  
    // Reglage de la fenetre TAILLE 
    if (key == 'l' )
    {
      XML[] children = xml.getChildren("window");
      int currentWidth = children[workingOnWindowNumber].getInt("width");
      children[workingOnWindowNumber].setInt("width", currentWidth-1);
    }

    if (key == 'm')
    {
      XML[] children = xml.getChildren("window");
      int currentWidth = children[workingOnWindowNumber].getInt("width");
      children[workingOnWindowNumber].setInt("width", currentWidth+1);
    }

    if (key == 'o')
    {
      XML[] children = xml.getChildren("window");
      int currentHeight = children[workingOnWindowNumber].getInt("height");
      children[workingOnWindowNumber].setInt("height", currentHeight-1);
    }

    if (key == 'p')
    {
      XML[] children = xml.getChildren("window");
      int currentHeight = children[workingOnWindowNumber].getInt("height");
      children[workingOnWindowNumber].setInt("height", currentHeight+1);
    }
  



  // Retour au jeu
  if (key == 'g')
  {
    saveXML(xml, "data/windowsPositions.xml");
    generateMyWindows();
    state = 1;
  }
  
    
    if (key == ' ')
  {
    generateMyWindows();
    state = 1;
    nbreDeVies = 3;
    restartMil = actualMil;
    screenMil = startMil;
  }
}

class Ballon {

  // PARAMETRES DU BALLON
  float densite = 0.8;
  float friction = 0.00;
  float restitution = 1;

  Body body;
  color c;
  float xpos;
  float ypos;
  int r = 10;

  Ballon() {
    c=color(0,35,252);
    xpos=width/2;
    ypos=height/4;
    makeBody(r, xpos, ypos);
    body.setUserData(this);
  }

  void killBody() {
    monMonde2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = monMonde2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();

      return true;
    }
    return false;
  }

  void display() {
    // We look at each body and get its screen position
    Vec2 pos = monMonde2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(c);
    strokeWeight(2);
    noStroke();
    strokeWeight(1);
    ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    //line(0, 0, r, 0);
    popMatrix();
  }

  void makeBody(float r, float x, float y ) {

    // Define a body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;

    // Set its position
    bd.position = monMonde2d.coordPixelsToWorld(x, y);
    body = monMonde2d.world.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = monMonde2d.scalarPixelsToWorld(r);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;

    // Parameters that affect physics
    fd.density = densite;
    fd.friction = friction;
    fd.restitution = restitution;

    body.createFixture(fd);
    //body.setGravityScale(0);

    body.setLinearVelocity(new Vec2(random(-30, 30), random(-30, -30)));
    body.setAngularVelocity(random(2, -2));
  }
}

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A fixed boundary class

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;

  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = monMonde2d.scalarPixelsToWorld(w/2);
    float box2dH = monMonde2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);

    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(monMonde2d.coordPixelsToWorld(x, y));
    b = monMonde2d.createBody(bd);

    // Attached the shape to the body using a Fixture
    b.createFixture(sd, 1);
    
    b.setUserData(this);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    pushMatrix();
    translate(x, y);
    rect(0, 0, w, h);
    popMatrix();
  }
  
  Body getBody()
  {
    return b;
  }
}

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// Box2DProcessing example

// A rectangular box

class Box {

  // We need to keep track of a Body and a width and height
  Body body;
  float w;
  float h;

  // Constructor
  Box(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 100;
    h = 10;
    // Add the box to the box2d world
    makeBody(new Vec2(x, y), w, h);
    body.setUserData(this);
  }
  
  Body getBody()
  {
    return body; 
  }
  
  // This function removes the particle from the box2d world
  void killBody() {
    monMonde2d.destroyBody(body);
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = monMonde2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = monMonde2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(0,35,252);
    stroke(0);
    rect(0, 0, w, h);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float w_, float h_) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(monMonde2d.coordPixelsToWorld(center));
    body = monMonde2d.createBody(bd);

    // Define a polygon (this is what we use for a rectangle)
    PolygonShape sd = new PolygonShape();
    float box2dW = monMonde2d.scalarPixelsToWorld(w_/2);
    float box2dH = monMonde2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.3;
    fd.restitution = 0.5;

    body.createFixture(fd);
    //body.setMassFromShapes();

    // Give it some initial random velocity
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }
}


// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// ContactListener to listen for collisions!

import org.jbox2d.callbacks.ContactImpulse;
import org.jbox2d.callbacks.ContactListener;
import org.jbox2d.collision.Manifold;
import org.jbox2d.dynamics.contacts.Contact;

 class CustomListener implements ContactListener {
  CustomListener() {
  }

  // This function is called when a new collision occurs
   void beginContact(Contact cp) {
    // Get both fixtures
    Fixture f1 = cp.getFixtureA();
    Fixture f2 = cp.getFixtureB();
    // Get both bodies
    Body b1 = f1.getBody();
    Body b2 = f2.getBody();
    // Get our objects that reference these bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();
    
    
    // If object 1 is a Box, then object 2 must be a particle
    // Note we are ignoring particle on particle collisions
    if (o1.getClass() == Window.class) {
      Window w = (Window) o1;
      w.change();
    } 
    
    
    // If object 2 is a Box, then object 1 must be a particle
    else if (o2.getClass() == Window.class) {
      Window w = (Window) o2;
      w.change();
    }
  }

   void endContact(Contact contact) {
    // TODO Auto-generated method stub
  }

   void preSolve(Contact contact, Manifold oldManifold) {
    // TODO Auto-generated method stub
  }

   void postSolve(Contact contact, ContactImpulse impulse) {
    // TODO Auto-generated method stub
  }
}




// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// Class to describe the spring joint (displayed as a line)

class Spring {

  // This is the box2d object we need to create
  MouseJoint mouseJoint;

  Spring() {
    // At first it doesn't exist
    mouseJoint = null;
  }

  // If it exists we set its target to the mouse location 
  void update(float x, float y) {
    if (mouseJoint != null) {
      // Always convert to world coordinates!
      Vec2 mouseWorld = monMonde2d.coordPixelsToWorld(x,y);
      mouseJoint.setTarget(mouseWorld);
    }
  }

  void display() {
    if (mouseJoint != null) {
      // We can get the two anchor points
      Vec2 v1 = null;
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = null;
      mouseJoint.getAnchorB(v2);
      // Convert them to screen coordinates
      v1 = monMonde2d.coordWorldToPixels(v1);
      v2 = monMonde2d.coordWorldToPixels(v2);
      // And just draw a line
      stroke(0);
      strokeWeight(1);
      line(v1.x,v1.y,v2.x,v2.y);
    }
  }


  // This is the key function where
  // we attach the spring to an x,y location
  // and the Box object's location
  //void bind(float x, float y, Barre myBarre) {
  void bind(float x, float y, Box myBarre) {
    // Define the joint
    MouseJointDef md = new MouseJointDef();
    
    // Body A is just a fake ground body for simplicity (there isn't anything at the mouse)
    md.bodyA = monMonde2d.getGroundBody();
    // Body 2 is the box's boxy
    // CORRECTION
    // Ton body Ã  toi, dans ta classe barre, il s'appelle b, pas body ! c'est tout!
    md.bodyB = myBarre.body;
    // Get the mouse location in world coordinates
    Vec2 mp = monMonde2d.coordPixelsToWorld(x,y);
    // And that's the target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    // CORRECTION
    // Pareil lÃ 
    md.maxForce = 1000.0f * myBarre.body.m_mass;
    md.frequencyHz = 5.0f;
    md.dampingRatio = 0.1f;

    // Wake up body!
    //box.body.wakeUp();

    // Make the joint!
    mouseJoint = (MouseJoint) monMonde2d.world.createJoint(md);
  }

  void destroy() {
    // We can get rid of the joint when the mouse is released
    if (mouseJoint != null) {
      monMonde2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }

}


// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// Class to describe the spring joint (displayed as a line)

class Spring2 {

  // This is the box2d object we need to create
  MouseJoint mouseJoint;

  Spring2() {
    // At first it doesn't exist
    mouseJoint = null;
  }

  // If it exists we set its target to the mouse location 
  void update(float x, float y) {
    if (mouseJoint != null) {
      // Always convert to world coordinates!
      Vec2 mouseWorld = monMonde2d.coordPixelsToWorld(x,y);
      mouseJoint.setTarget(mouseWorld);
    }
  }

  void display() {
    if (mouseJoint != null) {
      // We can get the two anchor points
      Vec2 v1 = null;
      mouseJoint.getAnchorA(v1);
      Vec2 v2 = null;
      mouseJoint.getAnchorB(v2);
      // Convert them to screen coordinates
      v1 = monMonde2d.coordWorldToPixels(v1);
      v2 = monMonde2d.coordWorldToPixels(v2);
      // And just draw a line
      stroke(0);
      strokeWeight(1);
      line(v1.x,v1.y,v2.x,v2.y);
    }
  }


  // This is the key function where
  // we attach the spring to an x,y location
  // and the Box object's location
  void bind(float x, float y, Box box) {
    // Define the joint
    MouseJointDef md = new MouseJointDef();
    
    // Body A is just a fake ground body for simplicity (there isn't anything at the mouse)
    md.bodyA = monMonde2d.getGroundBody();
    // Body 2 is the box's boxy
    md.bodyB = box.body;
    // Get the mouse location in world coordinates
    Vec2 mp = monMonde2d.coordPixelsToWorld(x,y);
    // And that's the target
    md.target.set(mp);
    // Some stuff about how strong and bouncy the spring should be
    md.maxForce = 1000.0f * box.body.m_mass;
    md.frequencyHz = 5.0f;
    md.dampingRatio = 0.000001f;

    // Wake up body!
    //box.body.wakeUp();

    // Make the joint!
    mouseJoint = (MouseJoint) monMonde2d.world.createJoint(md);
  }

  void destroy() {
    // We can get rid of the joint when the mouse is released
    if (mouseJoint != null) {
      monMonde2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }

}


class Window {

  // A window is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  color col = 0;

  // But we also have to make a body for box2d to know about it
  Body b;

  Window(float x_, float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = monMonde2d.scalarPixelsToWorld(w/2);
    float box2dH = monMonde2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(monMonde2d.coordPixelsToWorld(x, y));
    b = monMonde2d.createBody(bd);

    // Attached the shape to the body using a Fixture
    b.createFixture(sd, 1);
    b.setUserData(this);
  }

  void change()
  {
     col= color(249,250,0); 
  }
  
  // Draw the windows, if it were at an angle we'd have to do something fancier
  void display() {
    fill(col);
    strokeWeight(3.5);
    stroke(249,250,0);
    rectMode(CENTER);

    float a = b.getAngle();

    pushMatrix();
    translate(x, y);
    rect(0, 0, w, h);
    popMatrix();

}
}



