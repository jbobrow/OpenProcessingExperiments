
/**
 *    SVGs laden mit PShape
 *
 *    http://processing.org/reference/loadShape_.html
 *    http://processing.org/reference/shape_.html
 *
 *    http://en.wikipedia.org/wiki/Scalable_Vector_Graphics
 *
 *    fjenett 20081101
 */
 
 
 PShape body;
 PShape bart;
 PShape auge;
 PShape braue;
 PShape backe;
 
 void setup ()
 {
   size (300,300);
   background(255);
   
   frameRate(5);
   smooth();
   
  body = loadShape("body.svg");
  bart = loadShape("bart.svg");
  auge = loadShape("auge.svg");
  backe = loadShape("backe.svg");
  braue = loadShape("braue.svg");
   
 }
 
void draw ()
{
  background(255);
  
  shape(body, 50,50);
  
  pushMatrix();
  translate(120,140);
  rotate( random(radians(-5),radians(10)) );
  shape(bart, -100,0);
  popMatrix();
  
  pushMatrix();
  scale(-1,1);
  translate(-220,140);
  //rotate( random(radians(0),radians(10)) );
  shape(bart, 0,0);
  popMatrix();
  
  shape(auge, 90,100);
  shape(auge, 140,100);
  
  pushMatrix();
  shape(braue, 80, random(70,80));
  popMatrix();
  
  pushMatrix();
  scale(-1,1);
  shape(braue, -170,80);
  popMatrix();
  
}

