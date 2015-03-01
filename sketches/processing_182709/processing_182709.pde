
import megamu.mesh.*;
float[][] myEdges;
float[][] points;
float startX,startY,endX,endY;
Voronoi myVoronoi;

int numPoints = 1200;
int flip=1;
boolean clicked = false;
float basecolor = 0;

void setup() {
  size(600,600);
  smooth();
  background(255);
  strokeWeight(2);
  colorMode(HSB, 100, 100, 100, 100);
  
   points = new float[numPoints][2];
   for (int i=0; i<numPoints; i++) {
      points[i][flip] = random(-width,width); //x coord of point
      flip = (flip == 0) ? 1 : 0; //make 1 if 0 and vice versa
      points[i][flip] = random(-width,width); //y coord of point
   }
   
   myVoronoi = new Voronoi( points );
   
   MPolygon[] myRegions = myVoronoi.getRegions();

    for(int i=0; i<myRegions.length; i++)
    {
      // an array of points
      float[][] regionCoordinates = myRegions[i].getCoords();
      
      fill(50+basecolor*1.5,80,i%85+15); //stroke(0,255,0,0);
      myRegions[i].draw(this); // draw this shape
    }
}

void draw(){

    
  
  
  if (clicked == true) {
      for (int i=0; i<numPoints; i++) {
        points[i][flip] = points[i][flip] + (mouseX-width/2)*0.05;
        flip = flip == 0 ? 1 : 0;
        points[i][flip] = points[i][flip] - (mouseX-width/2)*0.05;
     }
     
     myVoronoi = new Voronoi( points );
   
   MPolygon[] myRegions = myVoronoi.getRegions();

    for(int i=0; i<myRegions.length; i++)
    {
      // an array of points
      //float[][] regionCoordinates = myRegions[i].getCoords();
      
      basecolor = (mouseY-height/2)/10; println(basecolor);
      fill(50+basecolor*1.5,80,i%85+15); //stroke(0,255,0,0);
      myRegions[i].draw(this); // draw this shape
    }
      
  } //end of if clicked
  
  clicked = false;
}

void mouseDragged(){
  clicked = true;
}


