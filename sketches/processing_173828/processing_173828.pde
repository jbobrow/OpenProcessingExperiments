
//Press n for new distribution and save

import toxi.math.conversion.*;
import toxi.geom.*;
import toxi.math.*;
import toxi.geom.mesh2d.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.math.noise.*;
import toxi.processing.*;

ToxiclibsSupport gfx;
Voronoi voronoi;

PImage reference;
PVector mid;

//change for different results
float probabilityThresholdMin = 0.15;
float probabilityThresholdMax = 0.9;
int amountOfPoints = 500;
ArrayList<Vec2D> points;

void setup()
{
  //reference to your image
  reference = loadImage("2.jpg");

 // size( reference.width, reference.height );
 size(1024, 768);
  gfx = new ToxiclibsSupport( this );
  voronoi = new Voronoi();

  //middle of the image
  mid = new PVector(reference.width/2, reference.height/2);

  makeNewVoronoi();
}

void draw()
{
  //if not black, weird polygones around the outline are visible.. 
  background( 0 );

  for ( Polygon2D polygon : voronoi.getRegions () ) {

    //get color value of each polygon's center point
    Vec2D v = polygon.getCentroid();
    color c = reference.get( int( v.x ), int( v.y ) );

    //mean isn't necessary, fill as stroke works too.. 
    stroke(c);
    fill( c );

    //connect the dots, add the polygon
    gfx.polygon2D( polygon );
  }

  //blend reference image over polygons, last parameter is blend mode -> see processing reference for more modes.
  blend(reference, 0, 0, reference.width, reference.height, 0, 0, reference.width, reference.height, SOFT_LIGHT);

  //debug: voronoi centerpoints
  /*for (Vec2D p : points) {
   fill(255);
   ellipse(p.x, p.y, 2, 2);
   }*/
}

void keyPressed() {
  if (key == 'n') {
    points.clear();
    makeNewVoronoi();
    saveFrame("images/crystal-###.png");
  }
}

void makeNewVoronoi() {

  points = new ArrayList<Vec2D>();

  //how many points?
  for ( int i = 0; i < amountOfPoints; i++ ) {

    //catch the color of some random points in the image
    int x = int (random(width));
    int y = int (random(height));
    color c = reference.get(x, y);

    //get the distance from the center to point
    float dist = dist(mid.x, mid.y, x, y);
    //map it to a probability value
    float prob = map(dist, 0, mid.x, 0, 1);

    //add point if its not transparent, and the probability of beeing near the end is great
    if (alpha(c) != 0 && prob > probabilityThresholdMin && prob < probabilityThresholdMax) {
      voronoi.addPoint( new Vec2D(x, y) );
      points.add(new Vec2D(x, y));
    }
  }

  smooth();
  // noLoop();
}


