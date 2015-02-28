
import gifAnimation.*;
GifMaker gifExport;
int timer = 150;

import megamu.mesh.*;

//Image to use
String fileName = "apo";
String fileExt = ".jpg";
PImage source;
int pointsNum = 700;
//array of points
float[][] points = new float[pointsNum][2];
int alph = 10;
boolean backgrounding = false;
int style = 0;

void setup(){
  size(480,480);
  //a vision in the distance, bring it in
  source = loadImage(fileName + fileExt);
  //println(source.width );
  //println(source.height);
  //size(source.width,source.height);
  noStroke();
  //background(source);
  //smooth();
  //scatter our seeds over the field
  for (int i = 0; i< pointsNum; i++){
     points[i][0] = random(width);//x
     points[i][1] = random(height);//y
  }
  Voronoi myVoronoi = new Voronoi(points);
  
  MPolygon[] myRegions = myVoronoi.getRegions();

  for(int i=0; i<myRegions.length; i++)
  {
  	// an array of points
  	float[][] regionCoordinates = myRegions[i].getCoords();
  	fill(255,0,0);
  	myRegions[i].draw(this); // draw this shape
  }
  if( ! online){
    gifExport = new GifMaker(this, "export.gif");
    gifExport.setRepeat(0);				// make it an "endless" animation
    //gifExport.setTransparent(0,0,0);	// black is transparen
  }
   
}

void draw(){
  //blow
  movePoints();
  //look through the haze
  drawRegions();
  //record what you see
   if( ! online  && timer-- >= 0){
    gifExport.addFrame();
  
    if (timer == 0){
      gifExport.finish();
    }
  }
}
void movePoints(){
 //the wind blows from the west
 for( int i = 0; i < pointsNum; i++){
   float x = points[i][0];
   float y = points[i][1];
   x = (x + 2 * random(0,4));
   y = (y + 2 * random(-1,1));
   if(x > width){
     x = 0;
   }
   points[i][0] = x;
   points[i][1] = y;
  
 }
}

void drawRegions(){
  if(backgrounding){
    background(source);
  }
  //draw out the points
  Voronoi myVoronoi = new Voronoi(points);
  
  MPolygon[] myRegions = myVoronoi.getRegions();

  for(int i=0; i<myRegions.length; i++)
  {
  	// an array of points
  	float[][] regionCoordinates = myRegions[i].getCoords();
        color c = source.get(int(points[i][0]),int(points[i][1]));
        fill(c,alph);
//  	fill(255,0,0);
  	myRegions[i].draw(this); // draw this shape
  }
}
void mouseClicked(){
  //cycle through some settings
  int stylesMax = 1;
  style++;
  if(style > stylesMax){
    style = 0;
  }
  switch(style){
    case 0:
      background(255,0,0);
      alph = 10;
      backgrounding = false;
      break;
    case 1:
      alph = 220;
      backgrounding = true;
      break;
  }

}


