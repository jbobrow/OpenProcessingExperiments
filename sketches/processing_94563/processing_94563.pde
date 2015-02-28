
/* 
 Printing Code ITP
 (Spring 2012)
 
 Assignment Week 4: This week you’re going to design a word. 
 Pick a word and make a typeface around it. 
 The important thing is that you draw the letters using some 
 kind of rule-based logic.
 
 */

/* created by Alexandra Coym */

//setting canvas properties
float printWidth = 16;
float printHeight = 16;
float enlarge = 100;


import geomerative.*;
PShape[] hooves = new PShape[6];
int fontSize = 500;


void setup() 
{
  RG.init(this);
  size(round(printWidth * enlarge), round(printHeight * enlarge));
  background(255);
  smooth();
  fill(0);
  noStroke();

  // loading images into array "images"
  hooves[0] = loadShape("HB1b.svg");
  hooves[1] = loadShape("HB2b.svg");
  hooves[2] = loadShape("HB3b.svg");
  hooves[3] = loadShape("HB4b.svg");
  hooves[4] = loadShape("HB5b.svg");
  hooves[5] = loadShape("HB6b.svg");

  noLoop();
} 

void draw() {
  translate(350, 700);
  RFont font = new RFont("helveticaneue.ttf", fontSize, RFont.LEFT);
  RCommand.setSegmentLength(70);

  RGroup group = font.toGroup("H O").toPolygonGroup();

  for (int k = 0; k < group.elements.length; k++)
  {
    RPolygon polygon = (RPolygon) group.elements[k];

    for (int i = 0; i < polygon.contours.length; i++)
    {
      RContour curContour = polygon.contours[i];

      for (int j = 0; j < curContour.points.length; j++)
      {
        // now for each RPoint (which is a vector), make an ellipse
        RPoint curPoint = curContour.points[j];

        // Draw contour points of letter through choosen random images from array 
        int f;
        f = (int)random(0, hooves.length);
        //image(images[f], curPoint.x, curPoint.y,30,30);
        //  hoof.draw();  
        shape(hooves[f], curPoint.x, curPoint.y);
      }
    }
  }
  
    RGroup group2 = font.toGroup("W L").toPolygonGroup();
translate (0,530);
  for (int k = 0; k < group2.elements.length; k++)
  {
    RPolygon polygon2 = (RPolygon) group2.elements[k];

    for (int i = 0; i < polygon2.contours.length; i++)
    {
      RContour curContour = polygon2.contours[i];

      for (int j = 0; j < curContour.points.length; j++)
      {
        // now for each RPoint (which is a vector), make an ellipse
        RPoint curPoint = curContour.points[j];

        // Draw contour points of letter through choosen random images from array 
        int f;
       
        f = (int)random(0, hooves.length);
        //image(images[f], curPoint.x, curPoint.y,30,30);
        //  hoof.draw();  
        shape(hooves[f], curPoint.x, curPoint.y);
      }
    }
  }
}

// safe image as a tiff
/*void mouseClicked () {
  int value = 0;
  if (value == 0) {
    save("print.tiff");
  }
}*/



