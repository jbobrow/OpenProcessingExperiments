
/*

Spinning star
jacky@kwancreative.com
June 18,2009

*/

float theta = 0;

void setup () {
  
  size (200,200);
  smooth ();
}

void draw () {
  
  background (0);
  stroke (255);
  
  translate (width/2,height/2);
  
  for (float i=0; i < TWO_PI; i += 1.3) {
    pushMatrix ();
    rotate (theta + i);
    line (0,0,100,0);
    
    for (float j=0; j < TWO_PI; j += 0.3) {
      pushMatrix ();
      translate (10,0);
      rotate (-theta-j);
      line (0,0,70,0);
      popMatrix ();
    }
    popMatrix ();
  }
  endShape ();
  theta += 0.04;
}

