

/************************************************
Earth and Moon v2.
Demonstrates usage of the Shapes3D library.
Original created by Peter Lager,
tested with Shapes3D library v1.9.2,
see http://www.lagers.org.uk/s3d4p/index.html
earth map https://atmire.com/labs17/handle/123456789/7618?show=full
************************************************/
import shapes3d.*;

Ellipsoid AddEllipsoid (int slices, int segments, String textureFile, float radius) 
{
  Ellipsoid aShape = new Ellipsoid(this, slices, segments);
  aShape.setTexture(textureFile);
  aShape.drawMode(Shape3D.TEXTURE);
  aShape.setRadius(radius);
  return aShape;
}

Ellipsoid earth, moon, stars;    
float rotx = -0.3;
float distance = 0;

void setup()
{
  size(800,600, P3D);
  frameRate(30);

  // create the earth
  earth = AddEllipsoid (20,30, "Earth.jpg", 90);

  // create the moon
  moon = AddEllipsoid (10,15, "Moon.jpg", 20);
  moon.moveTo(-220,0,0);

  // add moon to the earth relative to it
  earth.addShape(moon);
  moon.rotateBy(0, radians(90), 0);

  // create the stars
  stars = AddEllipsoid (20,30, "Stars.jpg", 1000);
  stars.setTexture("Stars.jpg",5,5);  
}

void draw()
{
  camera(0, 0, 400+distance, 0, 0, 0, 0, 1, 0);
  if (mousePressed) 
    if (mouseButton == LEFT)
      rotx = constrain(rotx + (pmouseY-mouseY)*0.003, -HALF_PI, HALF_PI);
    else distance = constrain(distance + (mouseY-pmouseY), -200, 200);  
  else
  { // do rotation before drawing
    earth.rotateBy(0, radians(0.6), 0);
    stars.rotateBy(0, 0, radians(0.03));
  }
  rotateX (rotx);
  background(0);
  // lightning earth 
  ambientLight(40,40,40);
  directionalLight(255, 255, 255, -150, 40, -140);
  earth.draw(); // draw earth and added shapes (moon)

  // reset the lights
  noLights();
  ambientLight(180,180,180);
  stars.draw();
}


