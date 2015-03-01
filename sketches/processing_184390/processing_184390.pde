
/* Created by Terry Moore with reference from Brandon Messner's "Crazy Coloured Lines"
Art 3001
Contact: terryjuku@yahoo.com
Date Modified: 2.5.15
*/


float x;


void setup () {
  size (500, 500);
}
  
void draw() 
{background(0);

x= width/10; //establishing the margin


//yellow line far left
stroke  (242, 242, 90); //yellow color

//   (x1    y1 (constrained ranges)   x2          y2 (constrained ranges)
line (x, random(x, height/2-x/2), width/2-x/2, random(x, height/2-x/2));
  
  
//blue line far right
stroke (80, 3, 247); //blue color
//   (x1           y1 (constrained ranges)   x2      y2 (constrained ranges)
line (width/2+x/2, random(x, height/2-x/2), width-x, random(x, height/2-x/2));

//green line
stroke (19, 247, 3); //green color
//   (x1 y1 (constrained ranges)         x2           y2 (constrained ranges)
line (x, random(height/2+x/2, height-x), width/2-x/2, random(height/2+x/2, height-x));

//red line
stroke (247, 3, 3); //red color
//   (x1           y1 (constrained ranges)        x2       y2 (constrained ranges)
line (width/2+x/2, random(height/2+x/2, height-x), width-x, random(height/2+x/2, height-x));
}
