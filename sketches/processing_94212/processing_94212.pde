
//// adam ben-dror 810161656
// Copyright Adam Ben-Dror 2013
// HW7
 
//tickle jim with the feather by clicking on his face.
 
float x, y, wd, ht, z, xSpeed, ySpeed, d, eb, e, n, h, m, x1, y1, x2, y2, x3, y3, x4, y4 ;
int br, bg, bb, count, count1 ;    //colors
PImage webImg;
 
 
void setup ()
{
  size(800,600);
  smooth ();
  wd = 180;
  ht = 180;
  x=100;
  y=100;
  z=1;
  eb = 1;
  e = 1;
  n = 1;
  h = 1;
  m = 1;
String url = "http://s2.postimg.org/d452681c5/feather.png";
  // Load image from a web server
  webImg = loadImage(url, "gif");
    
  xSpeed=6;
  ySpeed=5;
 
 
}
 
void draw()
{
 
    easing(.9);
    easing1(.8);
    easing2(.4);
    easing3(.08);

 
   
  //RGB backround color
  background (br,bg,bb) ;
  br = 245;
  bg = 245;
  bb = 247;
   
 d = dist( x4, y4, x+91, y+100);
 
 textSize( 20 );
 fill(100);
 text("Score " + count, width/2.2, 22);
 text("Time " +  millis( )/1000, width/1.8, 22);
 
  //move head
  moveHead();
     
  //render face
  ears();       //ears
  face();       //face
  glasses();    //glasses frame
  nose();       //nose
  moustache (); //moustache
  eyebrow ();   //eyebrow
  hair();       //hair
  eyes();       //eyes
 
  //counter when face is tickled
   if (count1 > 0)
   {
    count1++;
   }
   
  //reset face & position
  if (count1 > 70)
  {
   count1 = 0;
   eb = 1;
   e = 1;
   n = 1;
   h = 1;
   m = 1;
   xSpeed=5;
   ySpeed=4;
   x = random (5, width*.87);
   y = random (5, height*.80);
   xSpeed=6;
   ySpeed=5;
    
  }
   
  if(count1 == 0)
  {
    PImage b;
    imageMode(CENTER);
  image(webImg, x4, y4, 40, 80);
  }
   
   
  
   
 
   
   
}
 
 
void moveHead()
{
  x=x+xSpeed;
  
  if ((x > width*.87) || (x < -27 ))
  {xSpeed = -xSpeed;}
    
   y = y+ySpeed;
  
  if ((y > height*.80) || (y < -50))
  {ySpeed = -ySpeed;}
}
 
 
 //change face + start timer when mouse pressed
  void mousePressed()
 {
   if (d < 51 && count1 == 0)
   {
     eb = 2.5;
     e = 1.6;
     n = 1.5;
     h = -.1;
     m = 1.1; 
     count++ ;
     count1 = 1;
     xSpeed=1;
     ySpeed=1.5;
   }
 }
 
 
 
 
 
//face
 
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
  ellipse(x+wd/2.9, y+ht/1.9, wd/22*e, ht/22*e);
  ellipse(x+wd/1.54, y+ht/1.9, wd/22*e, ht/22*e);
 
  fill (0, 0, 0, 180);
  noStroke ();
  ellipse(x+wd/2.9, y+ht/1.9, wd/50*e, ht/50*e);
  ellipse(x+wd/1.54, y+ht/1.9, wd/50*e, ht/50*e);
 
  fill (255, 255, 255);
  noStroke ();
  ellipse(x+wd/2.9, y+ht/1.9, wd/190*e, ht/190*e);
  ellipse(x+wd/1.54, y+ht/1.9, wd/190*e, ht/190*e);
}
 
void hair() //hair
{
  noFill();
  stroke (114, 84, 58);
  strokeWeight (.4);
 
    //1
  beginShape();
  curveVertex(random(1, 12)+x3+(.52*wd) , random(1, 12)+y3+(.30*ht) );
  curveVertex(random(1, 12)+x3+(.52*wd) , random(1, 12)+y3+(.30*ht) );
  curveVertex(random(1, 12)+x3+(.51*wd) , random(1, 12)+y3+(.25*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  curveVertex(x+(.54*wd) , y+(.28*ht) );
  endShape();
 
  //2
  beginShape();
  curveVertex(random(1, 12)+x3+(.46*wd) , random(1, 12)+y3+(.31*ht) );
  curveVertex(random(1, 12)+x3+(.46*wd) , random(1, 12)+y3+(.31*ht) );
  curveVertex(random(1, 12)+x3+(.43*wd) , random(1, 12)+y3+(.25*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  curveVertex(x+(.40*wd) , y+(.26*ht) );
  endShape();
 
  //3
  beginShape();
  curveVertex(random(1, 12)+x+(.50*wd) , random(1, 12)+y3+(.33*ht) );
  curveVertex(random(1, 12)+x3+(.50*wd) , random(1, 12)+y3+(.33*ht) );
  curveVertex(random(1, 12)+x3+(.48*wd) , random(1, 12)+y3+(.25*ht) );
  curveVertex(x+(.46*wd) , y+(.27*ht) );
  curveVertex(x+(.46*wd) , y+(.27*ht) );
  endShape();
}
 
void glasses() //glasses
{
  strokeWeight ( 3 );
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
  ellipse (x + .47 * wd, y + ht*.60, 5*n, 3.5);
  ellipse (x + .55*wd, y +ht*.60, 5*n, 3.5);
}
 
 void moustache() //moustache
{
  noStroke ();
  fill (114, 84, 58) ;
  ellipse ( x1+wd/2, y1+ht*.90, wd/2.3, ht/2);
  fill (br,bg,bb) ;
  ellipse ( x2+wd/2, y2+ht*1, wd/2.3*m, ht/2.4);
}
 
 void eyebrow () //eyebrow
{
   
   
 noFill();
  stroke (114, 84, 58);
  strokeWeight (3.8);
 
  //left
  beginShape();
  curveVertex(x+(.60*wd) , y+(.5*ht)*eb );
  curveVertex(x+(.60*wd) , y+(.50*ht) );
  curveVertex(x+(.64*wd) , y+(.49*ht) );
  curveVertex(x+(.70*wd) , y+(.48*ht) );
  curveVertex(x+(.70*wd) , y+(.48*ht)*eb );
  endShape();
 
  //right
  beginShape();
  curveVertex(x+(.30*wd) , y+(.48*ht)*eb );
  curveVertex(x+(.30*wd) , y+(.48*ht) );
  curveVertex(x+(.37*wd) , y+(.49*ht) );
  curveVertex(x+(.40*wd) , y+(.50*ht) );
  curveVertex(x+(.40*wd) , y+(.50*ht)*eb );
  endShape();
}
 
void easing(float easingCoefficient) //Easing
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = x - x1;
  float dy = y - y1;
   
  // change x and y by an amount equal to the distance between
  // the mouse and the circle multiplied by the easingCoefficient
   
  x1 = x1 + ( dx * easingCoefficient );
  y1 = y1 + ( dy * easingCoefficient );
}
 
void easing1(float easingCoefficient) //Easing
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = x - x2;
  float dy = y - y2;
   
  // change x and y by an amount equal to the distance between
  // the mouse and the circle multiplied by the easingCoefficient
   
  x2 = x2 + ( dx * easingCoefficient );
  y2 = y2 + ( dy * easingCoefficient );
}
 
 
void easing2(float easingCoefficient) //Easing
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = x - x3;
  float dy = y - y3;
   
  // change x and y by an amount equal to the distance between
  // the mouse and the circle multiplied by the easingCoefficient
   
  x3 = x3 + ( dx * easingCoefficient );
  y3 = y3 + ( dy * easingCoefficient );
}


void easing3(float easingCoefficient) //Easing
{
  // local variables
  // compute distance between current circle location and mouse location.
  float dx = mouseX - x4;
  float dy = mouseY - y4;
  
  // change x and y by an amount equal to the distance between 
  // the mouse and the circle multiplied by the easingCoefficient
  
  x4 = x4 + ( dx * easingCoefficient );
  y4 = y4 + ( dy * easingCoefficient );
}
