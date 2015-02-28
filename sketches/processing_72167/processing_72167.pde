
//import stuff
import geomerative.*;
import org.apache.batik.svggen.font.table.*;
import org.apache.batik.svggen.font.*;

RFont font;
String myText = "Hello world!";

void setup()
{
  size(800,800);
  background(0);
  smooth();
  RG.init(this);
  
  font = new RFont("FreeSans.ttf",75,CENTER);
}


void draw(){
  background(0,0,0);
  fill(255,255,255);
  noStroke();
  noFill();
  
  translate(width/2, height/3);
  //font.draw(myText);

  RCommand.setSegmentLength(20);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  
  RGroup myGroup = font.toGroup(myText);
  myGroup = myGroup.toPolygonGroup();
  
  RPoint[] myPoints = myGroup.getPoints();
  
  beginShape(QUAD_STRIP);
    for (int i=0; i<myPoints.length; i++) 
    {
      //fill(255,0,0);
      ellipse(myPoints[i].x, myPoints[i].y + mouseY*i/100 - 100, 5, 5);
      vertex(myPoints[i].x, myPoints[i].y + mouseY*i/100 - 100);
      fill(255,255,255);
      triangle(myPoints[i].x, myPoints[i].y + mouseY*i/100 - 100, 0,pmouseY, 1,mouseY);
    }
  endShape();
  
}




