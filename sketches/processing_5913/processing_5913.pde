
/**
 * Interference Demo Effect
 * by luis2048. 
 * 
 * Two sets of concentric circles intersect and invert each other out causing crazy MoirÃ© patterns. 
 * One of the most famous demos that has a interference effect is "State of the Art" by Spaceballs.
 *
 * http://www.demoscene.tv/page.php?id=172&lang=uk&vsmaction=view_prod&id_prod=9914 
 *
 */
PGraphics circle1, circle2,interferenceEffect;

void setup(){
  size(600,400,JAVA2D);
  circle1 = createGraphics(width/2, height/2,JAVA2D);  
  circle2 = createGraphics(width/2, height/2,JAVA2D);  
  interferenceEffect = createGraphics(width/2, height/2,JAVA2D);  
  circle1.strokeWeight(5);
  circle2.strokeWeight(5);  
}

void draw() {
  // this makes circles move 
  float h=sin(frameCount*.011)*99;
  float v=sin(frameCount*.01)*99;
  int radius;

  // draw concentric circles
  circle1.beginDraw();
  circle2.beginDraw();
  // avoid drawing circles outside viewable width
  for (int j=width>>3;j>0;j--) {
    radius = (j<<4) + (j<<3); // this makes circles bigger on every loop. Equivalent to j*24. 
    circle1.ellipse(175+h,100+v,radius,radius);
    circle2.ellipse(175-h,100-v,radius,radius);
  }
  circle1.endDraw();
  circle2.endDraw();

  // a more efficient way to do this is to have a custom circle drawing
  // function that merges pixels before plotting itself eliminating 3 video pages but oh well.
  interferenceEffect.beginDraw();
  interferenceEffect.loadPixels();
  for (int y = 0; y < interferenceEffect.pixels.length; y++)  {
    interferenceEffect.pixels[y] = circle1.pixels[y] << circle2.pixels[y];  // merge circles
  }
  interferenceEffect.updatePixels();  
  interferenceEffect.endDraw();

  // make it have some trippy colors
  tint(200, 153, 204, 200);

  // lets see what we got  
  background(255,0,255);
  image(interferenceEffect,0,0,width,height);
}

