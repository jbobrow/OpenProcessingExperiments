
//// adam ben-dror 810161656
// Copyright Adam Ben-Dror 2013
// HW5

//move the mouse around onscreen

float x, y, x1, y1, x2, y2, x3, y3, wd, ht ; 
int br, bg, bb ;    //colors


void setup ()
{
  size(600,600);
  smooth ();
  wd = 350;
  ht = 320; 
}

void draw()
{

  //RGB backround color 
  background (br,bg,bb) ;
  br = 245;
  bg = 245;
  bb = 247;
  
  //easing
  easing(.11);
  
  easing1(.15);
  
  easing2(.4); 
  
  easing3(.3); 

    
  //ears 
  ears(); 

  //face
  face();  

  //glasses frame
  glasses(); 

  //nose
  nose(); 

  //moustache
  moustache (); 

  //eyebrow
  eyebrow (); 

   //hair
  hair(); 

  //eyes
  eyes(); 

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
  
  
  void easing1(float easingCoefficient) //Easing1
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = mouseX - x1;
  float dy = mouseY - y1;
  
  // change x and y by an amount equal to the distance between 
  // the mouse and the circle multiplied by the easingCoefficient
  
  x1 = x1 + ( dx * easingCoefficient );
  y1 = y1 + ( dy * easingCoefficient );
}

void easing2(float easingCoefficient) //Easing2
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = mouseX - x2;
  float dy = mouseY - y2;
  
  // change x and y by an amount equal to the distance between 
  // the mouse and the circle multiplied by the easingCoefficient
  
  x2 = x2 + ( dx * easingCoefficient );
  y2 = y2 + ( dy * easingCoefficient );
}

void easing3(float easingCoefficient) //Easing3
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = mouseX - x3;
  float dy = mouseY - y3;
  
  // change x and y by an amount equal to the distance between 
  // the mouse and the circle multiplied by the easingCoefficient
  
  x3 = x3 + ( dx * easingCoefficient );
  y3 = y3 + ( dy * easingCoefficient );
}


void ears() //ears
{
  noStroke();
  fill(244, 201, 164);
  ellipse ( x3+wd/1.45 , y3+ht/1.7 , wd/4, ht/6); 
  ellipse ( x3+wd/3.21 , y3+ht/1.7 , wd/4, ht/6); 
  
}


void eyes() //eyes
{
  fill (98, 130, 171, 150); 
  noStroke ();
  ellipse(x3+wd/2.9, y3+ht/1.9, wd/22, ht/22);
  ellipse(x3+wd/1.54, y3+ht/1.9, wd/22, ht/22);

  fill (0, 0, 0, 180); 
  noStroke ();
  ellipse(x3+wd/2.9, y3+ht/1.9, wd/50, ht/50);
  ellipse(x3+wd/1.54, y3+ht/1.9, wd/50, ht/50);

  fill (255, 255, 255); 
  noStroke ();
  ellipse(x3+wd/2.9, y3+ht/1.9, wd/190, ht/190);
  ellipse(x3+wd/1.54, y3+ht/1.9, wd/190, ht/190);
}

void hair() //hair
{
  noFill();
  stroke (114, 84, 58); 
  strokeWeight (.4);

   //1
  beginShape(); 
  curveVertex(x+(.52*wd) , y3+(.30*ht) );
  curveVertex(x+(.52*wd) , y3+(.30*ht) );
  curveVertex(x3+(.51*wd) , y3+(.25*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  endShape();

  //2
  beginShape();
  curveVertex(x+(.46*wd) , y3+(.31*ht) );
  curveVertex(x3+(.46*wd) , y3+(.31*ht) );
  curveVertex(x3+(.43*wd) , y3+(.25*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  endShape();

  //3
  beginShape();
  curveVertex(x+(.50*wd) , y3+(.33*ht) );
  curveVertex(x3+(.50*wd) , y3+(.33*ht) );
  curveVertex(x3+(.48*wd) , y3+(.25*ht) );
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
  curveVertex(x2+(.15*wd ), y );

  curveVertex(x2+(.15*wd ), y3+(.25*ht) );
  curveVertex(x3+(.15*wd) , y3+(.50*ht) );
  curveVertex(x3+(.30*wd) , y3+(.60*ht) );
  curveVertex(x3+(.45*wd) , y3+(.50*ht) );
  curveVertex(x3+(.50*wd) , y3+(.45*ht) );
  curveVertex(x3+(.55*wd) , y3+(.50*ht) );
  curveVertex(x3+(.70*wd) , y3+(.60*ht) );
  curveVertex(x3+(.85*wd) , y3+(.50*ht) );
  curveVertex(x2+(.85*wd ), y3+(.25*ht) );

  curveVertex(x2+( .85*wd) , y3 );
  endShape();

  //line on frame

  //left
  beginShape(); 
  curveVertex(x3+(.15*wd) , y3+(.50*ht) );

  curveVertex(x3+(.15*wd) , y3+(.50*ht) );
  curveVertex(x3+(.30*wd) , y3+(.44*ht) );
  curveVertex(x3+(.45*wd) , y3+(.50*ht) );

  curveVertex(x3+(.70*wd) , y3+(.60*ht) );
  endShape();

  //right
  beginShape(); 
  curveVertex(x3+(.35*wd) , y3+(.50*ht) );

  curveVertex(x3+(.55*wd) , y3+(.50*ht) );
  curveVertex(x3+(.70*wd) , y3+(.44*ht) );
  curveVertex(x3+(.85*wd) , y3+(.50*ht) );

  curveVertex(x3+(.70*wd) , y3+(.60*ht) );
  endShape();
}

void face() //face
{
  noStroke();
  fill( 244, 201, 164 );
  ellipse ( x3+wd/2 , y3+ht/1.8 , wd/1.8, ht/1.8); 
}

void nose() //nose
{
  fill ( 72, 65, 59);
  noStroke ( );
  ellipse (x3 + .47 * wd, y3 + ht*.60, 10, 7); 
  ellipse (x3 + .55*wd, y3 +ht*.60, 10, 7);
}

void moustache() //moustache
{
  noStroke ();
  fill (114, 84, 58) ; 
  ellipse ( x+wd/2, y+ht*.90, wd/2.3, ht/2);
  fill (br,bg,bb) ;
  ellipse ( x1+wd/2, y1+ht*1, wd/2.3, ht/2.4);
}

void eyebrow () //eyebrow
{
  
  
 noFill();
  stroke (114, 84, 58); 
  strokeWeight (3.8);

  //left
  beginShape(); 
  curveVertex(x3+(.60*wd) , y3+(.5*ht) );
  curveVertex(x3+(.60*wd) , y3+(.50*ht) );
  curveVertex(x3+(.64*wd) , y3+(.49*ht) );
  curveVertex(x3+(.70*wd) , y3+(.48*ht) );
  curveVertex(x3+(.70*wd) , y3+(.48*ht) );
  endShape();

  //right
  beginShape();
  curveVertex(x3+(.30*wd) , y3+(.48*ht) );
  curveVertex(x3+(.30*wd) , y3+(.48*ht) );
  curveVertex(x3+(.37*wd) , y3+(.49*ht) );
  curveVertex(x3+(.40*wd) , y3+(.50*ht) );
  curveVertex(x3+(.40*wd) , y3+(.50*ht) );
  endShape();
}



