
import megamu.mesh.*;
float[][] points = new float[6][4];

Delaunay myDelaunay ;
void setup(){

  size(600,600);
  background(255);

}

void draw(){


points[0][0] = mouseX; 
points[0][1] = mouseY;
points[1][0] = 150; 
points[1][1] = 105; 
points[2][0] = 320; 
points[2][1] = 113; 
points[3][0] = 220; 
points[3][1] = 413;
points[4][0] = 160; 
points[4][1] = 253; 
points[5][0] = 230; 
points[5][1] = 30; 

myDelaunay = new Delaunay( points );

  background(200,200,250);
  strokeWeight(3);
  stroke(250);

 int[][] myLinks = myDelaunay.getLinks();

for(int i=0; i<myLinks.length; i++)
{
	int startIndex = myLinks[i][0];
	int endIndex = myLinks[i][1];

	float startX = points[startIndex][0];
	float startY = points[startIndex][1];
	float endX = points[endIndex][0];
        float endY = points[endIndex][1]; 
	line( startX, startY, endX, endY );
}

} 

