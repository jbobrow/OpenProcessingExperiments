

int num= 12;
int radiusKreis =140;
int s= 0;
int m=0;
int h=0;
int i;
PImage b;


String  [] txt;


void setup () {
  size( 400,400);
  rectMode (CENTER);
  b= loadImage ("_MG_26621.JPG");
  PFont font = loadFont ("Futura-CondensedMedium-20.vlw");
  textFont (font,20);
  stroke(255);

  
  
  
}

void draw () {
  background(255);
  image (b,0,0);
 
  strokeWeight(0);
  translate(width/2, height/2);
  for(int i=0; i< num; i++) {
   
    pushMatrix();
    rotate(TWO_PI/num*i);
    translate(0, radiusKreis);
     //rect(0,0,10,10);

 
    
    
    popMatrix();
  }
  {
    //sekundenzeiger
  s= second();
  pushMatrix();
  
  rotate(TWO_PI/ 60* s);
  strokeWeight(1);
  fill(255);
  line (0,0,0, -100);
  translate (0,-100);
  ellipse(0,0,10,10);
 
  popMatrix();
  
}
{
  //mintuenzeiger
  m= minute();
  pushMatrix();
  rotate(TWO_PI/60*m);
  strokeWeight(2);
  fill(255);
  line(0,0,0, -80);
  
  popMatrix();
}
{
  // Stundenzeiger
  h= hour();
  pushMatrix();
  rotate(TWO_PI /12*h);
  rotate(TWO_PI /12/ 60* m);
  strokeWeight(3);
  line(0,0,0, -60);
  popMatrix();
}

pushMatrix();
   
    translate(0, radiusKreis);

PFont font;
  font = loadFont("Futura-CondensedMedium-20.vlw");
  textFont(font,20);
  fill(255);
    text("12",-12,-259);
    text("1",55,-240);
    text("2", 100,-200);   
    text("3",120,-135);
    text("4", 100,-70);   
    text("5", 62,-27);
    text("6", -7,-9);
    text("7", -65,-27);  
    text("8", -110,-70);       
    text("9",- 135,-135);
    text("10", -110,-200);       
    text("11",-65,-240); 
    
popMatrix();
 
  
}

