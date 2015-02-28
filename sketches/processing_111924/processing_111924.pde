
// Dog Animation- Group 2

int armAngle =-0;
int angleChange =5;
final int ANGLE_LIMIT =10;

void setup (){
  size (600, 600) ;  
  frameRate (10);
  smooth () ;
}

void draw(){
   background(150,200,255);
   fill (100,255,100);
   rect (0,400, 600, 300);
   sun ();
   
  pushMatrix();
  translate(50, 10); // places the dog so that it's always on the screen.
                    // you can move the whole animation using these points.
  
  drawtoon();
  armAngle += angleChange;
  
  // if the arm has moved past its limit,
  // reverse direction and set within limits.
  if (armAngle > ANGLE_LIMIT || armAngle < 0) // to make the tail wag (loop)
  {
  angleChange = -angleChange; // moves tail one way
  armAngle += angleChange; // moves tail opposite way
  }
popMatrix();
}

void drawtoon () {
  noStroke();
  fill (38,38,30) ;
  ellipse (270, 330, 200, 125);
 drawDogHead ();
 drawDogNeck ();
 drawtung ();
 drawDogFace ();
 drawDogEar1 ();
 drawDogEar2 ();
 drawDoglegL1 ();
 drawDoglegL2 ();
 drawDogeleftpaw ();
 drawbottombody ();
 drawDogrightleg1 ();
 drawDogrightleg2 ();
 drawDogrightleg3 ();
 drawtail ();
 draweye1 () ;
}

void sun (){    
  fill (249,250,15) ;
  ellipse (450,75, 110, 110);} 
  
void drawDogHead (){
  translate (140, 250);   
  fill (38,38,30) ;
  ellipse (0,0, 110, 110); }

void drawDogNeck (){
  pushMatrix (); 
  translate (100,70); // pivot point   
  rotate (radians (135)); // angle shape moves
  fill (38,38,30) ;
  rect (0,0, 40, 70); // translated to 0, 0
  popMatrix ();}

void drawtung (){
  pushMatrix (); 
  translate (-40,90); // pivot point   
  rotate (radians (armAngle -80));
  fill (255,0,100) ;
  ellipse (0,0, 30,10); // translated to 0, 0
  popMatrix ();} 

void drawDogFace (){
  pushMatrix (); 
  translate (-20,45); // pivot point   
  rotate (radians (45));
  fill (38,38,30) ;
  ellipse (0,0, 60, 125); // translated to 0, 0
  popMatrix ();}

void drawDogEar1 (){
   pushMatrix (); 
  translate (0,-25); // pivot point   
  rotate (radians (180));
  fill (38,38,30) ;
  ellipse (0,0, 40, 165); // translated to 0, 0
  popMatrix ();}

void drawDogEar2 (){
  pushMatrix (); 
  translate (10,-15); // pivot point   
  rotate (radians (225));
  fill (38,38,30) ;
  ellipse (0,0, 40, 165); // translated to 0, 0
  popMatrix ();}

void drawDoglegL1 (){
  pushMatrix (); 
  translate (35,110); // pivot point   
  rotate (radians (15));
  fill (38,38,30) ;
  ellipse (0,0, 45, 100); // translated to 0, 0
  popMatrix ();}

void drawDoglegL2 (){
  pushMatrix (); 
  translate (0,190); // pivot point   
  rotate (radians (30));
  fill (38,38,30) ;
  ellipse (0,0, 37, 130); // translated to 0, 0
  popMatrix ();}

void drawDogeleftpaw (){
  pushMatrix (); 
  translate (-40,235); // pivot point   
  rotate (radians (75));
  fill (38,38,30) ;
  ellipse (0,0, 42, 55); // translated to 0, 0
  popMatrix ();}
 
void drawbottombody (){
  pushMatrix (); 
  translate (165,120); // pivot point   
  rotate (radians (120));
  fill (38,38,30) ;
  ellipse (0,0, 180, 75); // translated to 0, 0
  popMatrix ();} 

void drawDogrightleg1 (){
  pushMatrix (); 
  translate (170,210); // pivot point   
  rotate (radians (25));
  fill (38,38,30) ;
  ellipse (0,0, 115, 45); // translated to 0, 0
  popMatrix ();} 

void drawDogrightleg2 (){
  pushMatrix (); 
  translate (195,260); // pivot point   
  rotate (radians (120));
  fill (38,38,30) ;
  ellipse (0,0, 90, 30); // translated to 0, 0
  popMatrix ();} 

void drawDogrightleg3 (){
  pushMatrix (); 
  translate (180,280); // pivot point   
  rotate (radians (75));
  fill (38,38,30) ;
  ellipse (0,0, 42, 55); // translated to 0, 0
  popMatrix ();}

void drawtail (){
  pushMatrix (); 
  translate (220,60); // pivot point   
  rotate (radians (armAngle -80));
  fill (38,38,30) ;
  ellipse (0,0, 25, 235); // translated to 0, 0
  popMatrix ();}

void draweye1 (){
  pushMatrix (); 
  translate (-45,10); // pivot point   
  rotate (radians (-25));
  fill (255) ;
  ellipse (0,0, 20, 7); // translated to 0, 0
  popMatrix ();}



