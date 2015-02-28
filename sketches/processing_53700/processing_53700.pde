
/************************************* 
 *Assignment 04
 *Name: Leslie Tjing
 *Email: Ltjing@haverford.edu
 *Course: CS 110- Section 02
 *Submitted: 2-27-2012
 *
 * My artwork is called "Blast Off." This is a tribute to the USA NASA program. The peeping eye is not happy about the end of the space shuttle program and is saddened by the sight of each moving rocket. 
 Click once and a cloud and rocket will appear. The clouds have boundaries and will move to the right at y<height/2 and to the left if y>height/2. The rocket will shoot up into the air, starting off slowly (red warning
 light) and increasing in speed (yellow light) until take off (green light). See your rockets fly!
 
 **************************************/PImage img;
PFont f;
//instantiate SpaceCloud
SpaceCloud[] cloud = new SpaceCloud [20];
//instantiate RocketBody
RocketBody [] body= new RocketBody [5];
int index = 0;
int rocketindex= 0;
WindowEye e1, e2;

void setup () {
  size (800, 800);
  smooth ();
  noStroke ();
  //Peeking Eyes
  e1 = new WindowEye (120, 50, 80);
  e2 = new WindowEye (50, 85, 80);
  //NASA
  f=loadFont("SynchroLET-65.vlw");
}

void draw () {
  //Background Space Image
  img= loadImage ("EarthSpace.jpg");
  image (img, 0, 0);

  // Loop for cloud
  for (int i=0; i<19; i++) {
    if (cloud [i] !=null) {
      cloud[i]. update ();
      cloud[i]. display ();
    }
  }
  // Loop for rocket
  for (int i=0; i<5; i++) { 
    if (body [i] !=null) {
      body[i]. update ();
      body[i]. display ();
      body[i]. changeColor();
    }
  }
  /*  //"NASA"
  textFont(f, 65 );
  fill(255, 0, 0);
  text("N", 350, 100);
  fill(0, 0, 255);
  text("A", 390, 100);
  fill(255, 255, 255);
  text("S", 430, 100);
  fill(255, 0, 0);
  text("A", 470, 100);*/
  
  //Eyes
  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);

  e1.display();
  e2.display();
}

void mousePressed() {
  //Function draw cloud
  fill (255);
  cloud [index] = new SpaceCloud (mouseX, mouseY);
  index= (index +1) % 20;
  //Function to draw rocket
  body [rocketindex]= new RocketBody (mouseX, mouseY);
  rocketindex= (rocketindex +1) % 5;
}



