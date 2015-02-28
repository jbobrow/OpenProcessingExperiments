
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


  PShape shp;
  PShape shp2;
  PShape shp3;
  PShape shp4;
  PShape shp5;
  
  void setup()
  {
    
    size(400,600);
    shapeMode (CENTER);
    background(255); 
    smooth();
    frameRate(5);

  shp = loadShape ("koerper.svg");
  shp2 = loadShape ("arm_links.svg");
  shp3 = loadShape ("auge.svg");
  shp4 = loadShape ("bein_links.svg");
  shp5 = loadShape ("arm_rechts.svg");
  
  }

  void draw ()
  {
   background(255); 
  shape (shp, width/2, height/2);
  shape (shp2, random(60,90),300);
  shape (shp3, 170,250);
  shape (shp4, 180,420);
  shape (shp5, 280,370);
  
  
}






