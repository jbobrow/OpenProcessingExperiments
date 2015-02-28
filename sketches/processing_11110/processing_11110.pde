

import traer.physics.*; // library that codes for collision
import interfascia.*; // library for buttons

/**
 * ControlP5 Slider. Horizontal and vertical sliders, 
 * with and without tick marks and snap-to-tick.
 * by andreas schlegel, 2010
 */

import controlP5.*;
ControlP5 controlP5;

// variables for buttons
GUIController control;
IFButton button1, button2, button3, button4, button5, button6, button7, button8, button9, button10;
IFLookAndFeel defaultLook, redLook, blueLook, greenLook, purpleLook;
IFTextField tmassb, tvelb, tmomb, tmassc, tvelc, tmomc, totalmom;

// variables for particles
Particle b, c;
ParticleSystem physics;


public float theta = 0;
public float massb = 1.0;//mass ball b
public float massc = 1.0;//mass ball c
PFont font;
public float rb=10.0 ;//radius ball b
public float rc=10.0;//radius ball c
public PVector vFinalp1, vFinalp2, momentumCons;
public float red_velocity = 0.0;
public float blue_velocity = 0.0;
public String mb;


void setup() {
  control = new GUIController (this);
  
  button1 = new IFButton ("increase mass" , 75, 530, 80, 20);//b increase mass
  button2 = new IFButton ("decrease mass", 75, 560, 80, 20);//b decrease mass
  button3 = new IFButton ("start", 75, 500, 80, 20);//b start
  button4 = new IFButton ("stop", 75, 590, 80, 20); // b stop
  button5 = new IFButton ("increase mass", 180, 530, 80, 20);  //c increase mass
  button6 = new IFButton ("decrease mass", 180, 560, 80, 20);  // c decrease mass
  button7 = new IFButton ("start", 180, 500, 80, 20);  // c start
  button8 = new IFButton ("stop", 180, 590, 80, 20); // c stop
  button9 = new IFButton ("restart", 75, 620, 185, 20); //reset
  button10 = new IFButton (">", 160, 500, 15, 20); //start both at the same time

  button1.addActionListener(this);
  button2.addActionListener(this);
  button3.addActionListener(this);
  button4.addActionListener(this);
  button5.addActionListener(this);
  button6.addActionListener(this);
  button7.addActionListener(this);
  button8.addActionListener(this);
  button9.addActionListener(this);
  button10.addActionListener(this);
  
  defaultLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);  // color change in buttons
  
  redLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);// color change in buttons
  redLook.baseColor = color(255,52,52);
  redLook.highlightColor = color(175, 50, 50);
 
  blueLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);// color change in buttons
  blueLook.baseColor = color(60,80,255);
  blueLook.highlightColor = color(50, 50, 175);
  
  greenLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);// color change in buttons
  greenLook.baseColor = color(0,255,0);
  greenLook.highlightColor = color(50, 175, 50);
  
  purpleLook = new IFLookAndFeel(this, IFLookAndFeel.DEFAULT);// color change in buttons
  purpleLook.baseColor = color(190,45,190);
  purpleLook.highlightColor = color(150,45,150);
  
  control.setLookAndFeel(redLook); 
  control.add (button1);
  control.add (button2);
  control.add (button3);
  control.add (button4);
  control.add (button5);
  control.add (button6);
  control.add (button7);
  control.add (button8);
  control.add (button9);
  control.add (button10);
  
  button5.setLookAndFeel(blueLook);
  button6.setLookAndFeel(blueLook);
  button7.setLookAndFeel(blueLook);
  button8.setLookAndFeel(blueLook);
  button9.setLookAndFeel(greenLook);
  button10.setLookAndFeel(purpleLook);
  
  tmassb = new IFTextField("", 400, 500);//text boxes for momentum equation massb
  tmassb.addActionListener(this);
  control.add (tmassb);
  tvelb = new IFTextField(" ", 550, 500);//text boxes for momentum equation velocity b
  tvelb.addActionListener(this);
  control.add (tvelb);
  tmomb = new IFTextField(" ", 700, 500);//text boxes for momentum equation momentum b
  tmomb.addActionListener(this);
  control.add (tmomb);
  tmassc = new IFTextField(" ", 400, 550);//text boxes for momentum equation mass c
  tmassc.addActionListener(this);
  control.add (tmassc);
  tvelc = new IFTextField(" ", 550, 550);//text boxes for momentum equation velocity c
  tvelc.addActionListener(this);
  control.add (tvelc);
  tmomc = new IFTextField(" ", 700, 550);//text boxes for momentum equation momentum c
  tmomc.addActionListener(this);
  control.add (tmomc);
  totalmom = new IFTextField(" ", 700, 600);//text box for total momentum
  totalmom.addActionListener(this);
  control.add (totalmom);
  
  controlP5 = new ControlP5(this);
  controlP5.addSlider("red_velocity",0,10,0,30,500,10,160);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("blue_velocity",0,10,0,290,500,10,160);
  
  size( 900, 750 );
  //smooth();

  font = loadFont ("BookAntiqua-Italic-25.vlw");
  
  physics = new ParticleSystem();  //calls the creation of particles according to traer
  b = physics.makeParticle( massb, 200, 400, 0 );
  c = physics.makeParticle( massc, width-50, 400-rc, 0);


}

void draw()
{
  handleBoundaryCollisions( b ); // sets boundaries at sides - applies it to particle b
  handleBoundaryCollisions( c ); //sets boundaries at sides - applies it to particle c
  physics.tick();                //time step
  massCollisions (b, c, rb, rc);
 // equation ();// initialization of text box info

  background(240, 209, 160);
  
  stroke(0);                    //ruler
  line (0,400,width,400);
 
  for (int i = 0;i<width; i=i+10){  // minor tick marks on ruler
   line (i+10,405,i+10,395);
  }
  for (int i = 0;i<width; i=i+100){  //major tick marks on ruler
   line (i+10,425,i+10,375);
   
   textFont(font);
   textSize (20);
   fill (0);
    text(i/100, 0+(i), 450);
 
  }
  
   textFont(font);
   textSize (18);
   fill (0);
    text("meters (m)", 10, 360); //end ruler
    
   textFont(font); //title
   textSize (30);
   fill (0);
    text("COLLISIONS", 370, 250); 
    
   textFont(font);
   textSize (18);
   fill (0);
   text("red marble", 310, 515);
 
   textFont(font);
   textSize (18);
   fill (0);
   text("blue marble", 310, 565);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" m/s   =", 650, 515);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" kg    X", 500, 515);
  
  textFont(font);
   textSize (15);
   fill (0);
   text(" kg    X", 500, 565);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" m/s   =", 650, 565);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" kg*m/s", 800, 515);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" kg*m/s", 800, 565);
   
   textFont(font);
   textSize (15);
   fill (0);
   text(" kg*m/s", 800, 615);
   
   textFont(font);
   textSize (18);
   fill (0);
   text("mass", 425, 495);
   
   textFont(font);
   textSize (18);
   fill (0);
   text("velocity", 570, 495);
   
   textFont(font);
   textSize (18);
   fill (0);
   text("momentum", 700, 495);
   
   textFont(font);
   textSize (18);
   fill (0);
   text("total momentum of system    =", 460, 618);
   
   if (rb <= 10.0) {  // lower limit on radius and mass of b
    rb = 10.0;
    massb = 1.0;
  }
   if (rb >= 40.0) {  //upper limit on radius and mass of b
     rb = 40.0;
     massb = 4.0;
   }

  fill( 255,0,0 );
  ellipse( b.position().x(), b.position().y(), rb*2, rb*2 ); //draw circle around point for particle b
   
   if (rc <= 10.0) {//  lower limit on radius and mass of c
    rc = 10.0;
    massc = 1.0;
  }
   if (rc >= 40.0) {  //upper limit on radius and mass of c
     rc = 40.0;
     massc = 4.0;
   } 
  fill( 0 ,0, 255 );
  ellipse( c.position().x(), c.position().y(), rc*2, rc*2 ); // draw circle around point for particle c

}

void actionPerformed (GUIEvent e) {  //instructions for what buttons do

   
  if (e.getSource() == button1) {  //inc size of ball b and the value of it's mass
    println(massb);                // prints the current value of b's mass
    rb=rb+(rb*0.5);
    massb = massb+1.0;
    
  } else if (e.getSource() == button2) { //dec size of ball b and the value of it's mass
    println(massb);                // prints the current value of b's mass
    rb=rb-(rb*0.25);
    massb = massb-1.0;
  }
    else if (e.getSource() == button3) {  //adds velocity of particle b 
    println("startb");
    b.velocity().set (red_velocity, 0.0 , 0.0);  //changes velocity to the value of the slider
  }
    else if (e.getSource() == button4) { // sets velocity of particle b to 0 when the "stop" button is pressed.
    println("stopb"); 
    b.velocity().set (0.0, 0.0, 0.0);
  }
  if (e.getSource() == button5) { //inc size of ball c and the value of it's mass
    println(massc);               // prints the current value of c's mass
    rc=rc+(rc*0.5);          
    massc = massc+1.0;
    
  } else if (e.getSource() == button6) {
    println(massc);              //dec size of ball c and the value of it's mass
    rc=rc-(rc*0.25);              // prints the current value of c's mass
    massc = massc-1.0;
  }
    else if (e.getSource() == button7) { //adds velocity each time the "start" button is pressed.  I don't need this.  I only need to be able to start the movement.
    println("startc");
    c.velocity().set (-1*blue_velocity, 0.0 , 0.0);  //changes velocity to the value of the sliderin the opposite direction of b 
  }
    else if (e.getSource() == button8) { // sets velocity of particle b to 0 when the "stop" button is pressed.
    println("stopc");
    c.velocity().set (0.0, 0.0, 0.0);
  }
    
    if (e.getSource() == button10) {  //starts both particles at the same time with opposite velocities
    println("startboth");
    b.velocity().set (red_velocity, 0.0, 0.0);
    c.velocity().set (-1*blue_velocity, 0.0, 0.0);  
    }
  
    if (e.getSource() == button9) {  //resets mass and positions of particles b and c
    println("restart");
    massb = 1.0;//mass ball b
    massc = 1.0;//mass ball c
    rb=10.0 ;//radius ball b
    rc=10.0;//radius ball c
    b.velocity().set (0.0, 0.0, 0.0);
    c.velocity().set (0.0, 0.0, 0.0);
    b.position().set ( 200, 400-rb, 0 );
    c.position().set ( width-(2*rc), 400-rc, 0 );
    }
}

void mouseDragged(){
  if (mouseX <= abs(c.position().x() + rc) && mouseY <= abs(c.position().y()+ rc) && mousePressed){ 
  c.position().set (mouseX, 400-rc, 0.0);
  }
}

void massCollisions(Particle p1, Particle p2, float rb, float rc){  //p1 = b and p2 = c
     float distance= dist (p1.position().x(), p1.position().y(), p2.position().x(), p2.position().y()); //sets the distance between the two particles
     float vtemp1, vtemp2;
     
     vFinalp1 = new PVector (((massb - massc) * p1.velocity().x() +  2 * massc * p2.velocity().x()) / (massb + massc), 0.0);  //resulting change in velocity afte a collision, copied from "circle collision" processing.org
     vFinalp2 = new PVector (((massc - massb) * p2.velocity().x() +  2 * massb * p1.velocity().x()) / (massb + massc), 0.0);
     
     vtemp1 = vFinalp1.x;
     vtemp2 = vFinalp2.x;
     
    if (distance < rb+rc){    // if the distance between the 2 particles is less than the sum of their radii, then change their velocities according to the PVector above
     p1.velocity().set(vtemp1, 0.0,0.0);
     p2.velocity().set(vtemp2,0.0,0.0);
     
     } 

     
 }
 
//void equation (){
////setLabel (String tmassb);
////getLabel (massb);
//println (massb);
// String mb = massb;
// setValue(mb);
////tvelb, tmomb, tmassc, tvelc, tmomc
// }
// really basic collision strategy:
// sides of the window are walls
// if it hits a wall pull it outside the wall and flip the direction of the velocity
// the collisions aren't perfect so we take them down a notch too
void handleBoundaryCollisions( Particle p )
{
  if ( p.position().x() < 10 || p.position().x() > width-10 )
    p.velocity().set( -1.0*p.velocity().x(), 0, 0 );
    p.position().set( constrain( p.position().x(), 0, width-10 ), constrain( p.position().y(), 400, height-10 ), 0 ); 
}



