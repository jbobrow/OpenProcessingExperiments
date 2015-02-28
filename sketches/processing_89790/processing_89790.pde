
//// adam ben-dror 810161656
// Copyright Adam Ben-Dror 2013
// HW6

//move the mouse around onscreen to change speed of bouncing figure 
//press "a" to reset speed and location of figures

float x, y, wd, ht, z, x1, y1, xSpeed, ySpeed, x1Speed, y1Speed ; 
int br, bg, bb ;    //colors


void setup ()
{
  size(600,600);
  smooth ();
  wd = 140;
  ht = 140; 
  x=100;
  y=100;
  z=1;
  
 xSpeed=2;
 ySpeed=5;
 x1Speed=random (0, 7);
 y1Speed= random (0, 4);

}

void draw()
{
  

  //RGB backround color 
  background (br,bg,bb) ;
  br = 245;
  bg = 245;
  bb = 247;
  
 moveHead(); 
    
  //ears 
  ears(); 
  ears1(); 

  //face
  face(); 
  face1(); 

  //glasses frame
  glasses(); 
  glasses1(); 
  
  //nose
  nose(); 
  nose1(); 

  //moustache
  moustache (); 
  moustache1 (); 

  //eyebrow
  eyebrow (); 
  eyebrow1 (); 

   //hair
  hair(); 
  hair1(); 

  //eyes
  eyes(); 
  eyes1(); 
  
  moveHead1();

}


void ears() //ears
{
  noStroke();
  fill(244, 201, 164);
  ellipse ( x+wd/1.45 , y+ht/1.7 , wd/4, ht/6); 
  ellipse ( x+wd/3.21 , y+ht/1.7 , wd/4, ht/6); 
  
}


void eyes() //eyes
{
  fill (98, 130, 171, 150); 
  noStroke ();
  ellipse(x+wd/2.9, y+ht/1.9, wd/22, ht/22);
  ellipse(x+wd/1.54, y+ht/1.9, wd/22, ht/22);

  fill (0, 0, 0, 180); 
  noStroke ();
  ellipse(x+wd/2.9, y+ht/1.9, wd/50, ht/50);
  ellipse(x+wd/1.54, y+ht/1.9, wd/50, ht/50);

  fill (255, 255, 255); 
  noStroke ();
  ellipse(x+wd/2.9, y+ht/1.9, wd/190, ht/190);
  ellipse(x+wd/1.54, y+ht/1.9, wd/190, ht/190);
}

void hair() //hair
{
  noFill();
  stroke (114, 84, 58); 
  strokeWeight (.4);

   //1
  beginShape(); 
  curveVertex(x+(.52*wd) , y+(.30*ht) );
  curveVertex(x+(.52*wd) , y+(.30*ht) );
  curveVertex(x+(.51*wd) , y+(.25*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  endShape();

  //2
  beginShape();
  curveVertex(x+(.46*wd) , y+(.31*ht) );
  curveVertex(x+(.46*wd) , y+(.31*ht) );
  curveVertex(x+(.43*wd) , y+(.25*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  endShape();

  //3
  beginShape();
  curveVertex(x+(.50*wd) , y+(.33*ht) );
  curveVertex(x+(.50*wd) , y+(.33*ht) );
  curveVertex(x+(.48*wd) , y+(.25*ht) );
  curveVertex(x+(.46*wd) , y+(.27*ht) );
  curveVertex(x+(.46*wd) , y+(.27*ht) );
  endShape();
}

void glasses() //glasses
{
  strokeWeight ( 5 );
  stroke ( 1, 1, 1 );
  noFill ();

  beginShape( );
  curveTightness ( - .1 );
  curveVertex(x+(.15*wd ), y );

  curveVertex(x+(.15*wd ), y+(.25*ht) );
  curveVertex(x+(.15*wd) , y+(.50*ht) );
  curveVertex(x+(.30*wd) , y+(.60*ht) );
  curveVertex(x+(.45*wd) , y+(.50*ht) );
  curveVertex(x+(.50*wd) , y+(.45*ht) );
  curveVertex(x+(.55*wd) , y+(.50*ht) );
  curveVertex(x+(.70*wd) , y+(.60*ht) );
  curveVertex(x+(.85*wd) , y+(.50*ht) );
  curveVertex(x+(.85*wd ), y+(.25*ht) );

  curveVertex(x+( .85*wd) , y );
  endShape();

  //line on frame

  //left
  beginShape(); 
  curveVertex(x+(.15*wd) , y+(.50*ht) );

  curveVertex(x+(.15*wd) , y+(.50*ht) );
  curveVertex(x+(.30*wd) , y+(.44*ht) );
  curveVertex(x+(.45*wd) , y+(.50*ht) );

  curveVertex(x+(.70*wd) , y+(.60*ht) );
  endShape();

  //right
  beginShape(); 
  curveVertex(x+(.35*wd) , y+(.50*ht) );

  curveVertex(x+(.55*wd) , y+(.50*ht) );
  curveVertex(x+(.70*wd) , y+(.44*ht) );
  curveVertex(x+(.85*wd) , y+(.50*ht) );

  curveVertex(x+(.70*wd) , y+(.60*ht) );
  endShape();
}

void face() //face
{
  noStroke();
  fill( 244, 201, 164 );
  ellipse ( x+wd/2 , y+ht/1.8 , wd/1.8, ht/1.8); 
}

void nose() //nose
{
  fill ( 72, 65, 59);
  noStroke ( );
  ellipse (x + .47 * wd, y + ht*.60, 10, 7); 
  ellipse (x + .55*wd, y +ht*.60, 10, 7);
}

void moustache() //moustache
{
  noStroke ();
  fill (114, 84, 58) ; 
  ellipse ( x+wd/2, y+ht*.90, wd/2.3, ht/2);
  fill (br,bg,bb) ;
  ellipse ( x+wd/2, y+ht*1, wd/2.3, ht/2.4);
}

void eyebrow () //eyebrow
{
  
  
 noFill();
  stroke (114, 84, 58); 
  strokeWeight (3.8);

  //left
  beginShape(); 
  curveVertex(x+(.60*wd) , y+(.5*ht) );
  curveVertex(x+(.60*wd) , y+(.50*ht) );
  curveVertex(x+(.64*wd) , y+(.49*ht) );
  curveVertex(x+(.70*wd) , y+(.48*ht) );
  curveVertex(x+(.70*wd) , y+(.48*ht) );
  endShape();

  //right
  beginShape();
  curveVertex(x+(.30*wd) , y+(.48*ht) );
  curveVertex(x+(.30*wd) , y+(.48*ht) );
  curveVertex(x+(.37*wd) , y+(.49*ht) );
  curveVertex(x+(.40*wd) , y+(.50*ht) );
  curveVertex(x+(.40*wd) , y+(.50*ht) );
  endShape();
}

void moveHead()
{
  x=x+(mouseX/100*xSpeed);
 
  if ((x > width*.80) || (x < -27 ))
  {xSpeed = -xSpeed;}
   
   y = y +(mouseY/100*ySpeed);
 
  if ((y > height*.80) || (y < -50))
  {ySpeed = -ySpeed;}
}



void easing(float easingCoefficient) //Easing
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = mouseX - x;
  float dy = mouseY - y;
  
  // change x and y by an amount equal to the distance between 
  // the mouse and the circle multiplied by the easingCoefficient
  
  x = x + ( dx * easingCoefficient );
  y = y + ( dy * easingCoefficient );
}



void ears1() //ears
{
  noStroke();
  fill(244, 201, 164);
  ellipse ( x1+wd/1.45 , y1+ht/1.7 , wd/4, ht/6); 
  ellipse ( x1+wd/3.21 , y1+ht/1.7 , wd/4, ht/6); 
  
}


void eyes1() //eyes
{
  fill (98, 130, 171, 150); 
  noStroke ();
  ellipse(x1+wd/2.9, y1+ht/1.9, wd/22, ht/22);
  ellipse(x1+wd/1.54, y1+ht/1.9, wd/22, ht/22);

  fill (0, 0, 0, 180); 
  noStroke ();
  ellipse(x1+wd/2.9, y1+ht/1.9, wd/50, ht/50);
  ellipse(x1+wd/1.54, y1+ht/1.9, wd/50, ht/50);

  fill (255, 255, 255); 
  noStroke ();
  ellipse(x1+wd/2.9, y1+ht/1.9, wd/190, ht/190);
  ellipse(x1+wd/1.54, y1+ht/1.9, wd/190, ht/190);
}

void hair1() //hair
{
  noFill();
  stroke (114, 84, 58); 
  strokeWeight (.4);

   //1
  beginShape(); 
  curveVertex(x1+(.52*wd) , y1+(.30*ht) );
  curveVertex(x1+(.52*wd) , y1+(.30*ht) );
  curveVertex(x1+(.51*wd) , y1+(.25*ht) );
  curveVertex(x1+(.54*wd) , y1+(.28*ht) );
  curveVertex(x1+(.54*wd) , y1+(.28*ht) );
  endShape();

  //2
  beginShape();
  curveVertex(x1+(.46*wd) , y1+(.31*ht) );
  curveVertex(x1+(.46*wd) , y1+(.31*ht) );
  curveVertex(x1+(.43*wd) , y1+(.25*ht) );
  curveVertex(x1+(.40*wd) , y1+(.26*ht) );
  curveVertex(x1+(.40*wd) , y1+(.26*ht) );
  endShape();

  //3
  beginShape();
  curveVertex(x1+(.50*wd) , y1+(.33*ht) );
  curveVertex(x1+(.50*wd) , y1+(.33*ht) );
  curveVertex(x1+(.48*wd) , y1+(.25*ht) );
  curveVertex(x1+(.46*wd) , y1+(.27*ht) );
  curveVertex(x1+(.46*wd) , y1+(.27*ht) );
  endShape();
}

void glasses1() //glasses
{
  strokeWeight ( 5 );
  stroke ( 1, 1, 1 );
  noFill ();

  beginShape( );
  curveTightness ( - .1 );
  curveVertex(x1+(.15*wd ), y1 );

  curveVertex(x1+(.15*wd ), y1+(.25*ht) );
  curveVertex(x1+(.15*wd) , y1+(.50*ht) );
  curveVertex(x1+(.30*wd) , y1+(.60*ht) );
  curveVertex(x1+(.45*wd) , y1+(.50*ht) );
  curveVertex(x1+(.50*wd) , y1+(.45*ht) );
  curveVertex(x1+(.55*wd) , y1+(.50*ht) );
  curveVertex(x1+(.70*wd) , y1+(.60*ht) );
  curveVertex(x1+(.85*wd) , y1+(.50*ht) );
  curveVertex(x1+(.85*wd ), y1+(.25*ht) );

  curveVertex(x1+( .85*wd) , y1 );
  endShape();

  //line on frame

  //left
  beginShape(); 
  curveVertex(x1+(.15*wd) , y1+(.50*ht) );

  curveVertex(x1+(.15*wd) , y1+(.50*ht) );
  curveVertex(x1+(.30*wd) , y1+(.44*ht) );
  curveVertex(x1+(.45*wd) , y1+(.50*ht) );

  curveVertex(x1+(.70*wd) , y1+(.60*ht) );
  endShape();

  //right
  beginShape(); 
  curveVertex(x1+(.35*wd) , y1+(.50*ht) );

  curveVertex(x1+(.55*wd) , y1+(.50*ht) );
  curveVertex(x1+(.70*wd) , y1+(.44*ht) );
  curveVertex(x1+(.85*wd) , y1+(.50*ht) );

  curveVertex(x1+(.70*wd) , y1+(.60*ht) );
  endShape();
}

void face1() //face
{
  noStroke();
  fill( 244, 201, 164 );
  ellipse ( x1+wd/2 , y1+ht/1.8 , wd/1.8, ht/1.8); 
}

void nose1() //nose
{
  fill ( 72, 65, 59);
  noStroke ( );
  ellipse (x1 + .47 * wd, y1 + ht*.60, 10, 7); 
  ellipse (x1 + .55*wd, y1 +ht*.60, 10, 7);
}

void moustache1() //moustache
{
  noStroke ();
  fill (114, 84, 58) ; 
  ellipse ( x1+wd/2, y1+ht*.90, wd/2.3, ht/2);
  fill (br,bg,bb) ;
  ellipse ( x1+wd/2, y1+ht*1, wd/2.3, ht/2.4);
}

void eyebrow1 () //eyebrow
{
  
  
 noFill();
  stroke (114, 84, 58); 
  strokeWeight (3.8);

  //left
  beginShape(); 
  curveVertex(x1+(.60*wd) , y1+(.5*ht) );
  curveVertex(x1+(.60*wd) , y1+(.50*ht) );
  curveVertex(x1+(.64*wd) , y1+(.49*ht) );
  curveVertex(x1+(.70*wd) , y1+(.48*ht) );
  curveVertex(x1+(.70*wd) , y1+(.48*ht) );
  endShape();

  //right
  beginShape();
  curveVertex(x1+(.30*wd) , y1+(.48*ht) );
  curveVertex(x1+(.30*wd) , y1+(.48*ht) );
  curveVertex(x1+(.37*wd) , y1+(.49*ht) );
  curveVertex(x1+(.40*wd) , y1+(.50*ht) );
  curveVertex(x1+(.40*wd) , y1+(.50*ht) );
  endShape();
}


void moveHead1()
{
  x1=x1+x1Speed;
 
  if ((x1 > width) || (x1 < -40 ))
  {x1 = 0;}
   
   y1 = y1 + y1Speed;
 
  if ((y1 > height) || (y1 < -50))
  {y1 = 0;}
}



void keyPressed() {
   if (key == 'a')
  {
 y1Speed= random ( 10);
  x1Speed= random ( 10);
  x1 = random (0, width);
  y1 = random (0, height); 
  x = random (0, width);
  y = random (0, height); 

  }
  
}

