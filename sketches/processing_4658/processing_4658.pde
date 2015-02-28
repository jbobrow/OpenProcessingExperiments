

// Full screen library
import fullscreen.*;


// Import everything exposed by JBox2D (except the testbed stuff)
import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.contacts.*;
// BoxWrap2D
import org.jbox2d.p5.*;

// Font
PFont  fontBig;
PFont  fontSmall;
String currentMode = "";
SoftFullScreen fs;


/********************************************/
// A reference to the physics engine
/********************************************/
World     world;

Physics   physics;

boolean   isDownPhysics = true;

/********************************************/
// Drawing Modes
/********************************************/
boolean  modeSingleCircle   = false;
boolean  modeSpray          = false;
boolean  modeCircleOfBodies = false;

/********************************************/
// Single
/********************************************/


/********************************************/
// Spray
/********************************************/
float scaleRangeMin = 200;
float scaleRangeMax = 100;

float sprayRadius = 50;

/********************************************/
// Circle of Bodies
/********************************************/
PVector vec1 = new PVector(0, 0);
PVector vec2 = new PVector(0, 0);
ArrayList circles;


/********************************************/

void setup()
{
  // Medium sized scene
  size(1280, 720, JAVA2D);
  // Physics is computed 60 times per second, so let's draw at same rate
  frameRate(60);
  // Nicer graphisc
  smooth();
  // Set up everything physics
  initScene();
  
  fontSmall = loadFont("Helvetica-10.vlw");
  fontBig   = loadFont("Helvetica-20.vlw");
  
  fs = new SoftFullScreen(this);
  fs.enter();
}

void draw()
{
  // Not much to do here, most drawing is handled by BoxWrap2D
  
  /*
  stroke(0);
  fill(0, 12);
  rect(0, 0, width, height);
  fill(255);
  */
  background(0);
  
  textFont(fontSmall);
  text("drawing modes:", 10, 20);
  text("'a' -- single circle mode", 10, 34);
  text("'s' -- spray mode", 10, 48);
  text("'d' -- body of circles mode", 10, 62);
  
  if (modeSingleCircle)   currentMode = "Single Circle Mode";
  if (modeSpray)          currentMode = "Spray Mode";
  if (modeCircleOfBodies) currentMode = "Circle of Bodies Mode";
  
  textFont(fontBig);
  text(currentMode, 20, height - 30);
  

  // spray mode
  if (modeSpray)
  {
    if (mousePressed)
    {
      float x = mouseX + random(-sprayRadius, sprayRadius);
      float y = mouseY + random(-sprayRadius, sprayRadius);

      float scl = norm(random(scaleRangeMax, scaleRangeMin), scaleRangeMin, scaleRangeMax);

      physics.createCircle(x, y, scl * 10);
    }
  }

  // circle of bodies & single circle modes
  if ((modeCircleOfBodies || modeSingleCircle) && mousePressed)
  {
    if (vec1 != null)
    {
      noFill();
      stroke(255);

      PVector v = new PVector(mouseX, mouseY);

      float d = PVector.dist(vec1, v);
      ellipse(vec1.x, vec1.y, d*2, d*2);
    }
  }
}

void mousePressed()
{
  if (modeCircleOfBodies || modeSingleCircle)
  {
    vec1 = new PVector(mouseX, mouseY);
  }
}
void mouseReleased()
{
  if (modeCircleOfBodies || modeSingleCircle)
  {
    vec2 = new PVector(mouseX, mouseY);
    float d = PVector.dist(vec1, vec2);
    
    if (modeSingleCircle)
    {
      createCircleBody(vec1.x, vec1.y, d);
    }
    
    if (modeCircleOfBodies)
    {
      createCircleOfBodies(vec1.x, vec1.y, d, 20);
    }
    
    vec1 = new PVector(mouseX, mouseY);
  }
}

void keyPressed()
{
  if (key == 'Q' || key == 'q')
  {
    physics.destroy();
    physics = null;
    initScene();
  }
   
  if (key == 'A' || key == 'a')
  {
    // free style mode
    modeSingleCircle   = true;
    modeSpray          = false;
    modeCircleOfBodies = false;
  }
  else if (key == 'S' || key == 's')
  {
    // spray mode
    modeSingleCircle   = false;
    modeSpray          = true;
    modeCircleOfBodies = false;
  }
  else if (key == 'D' || key == 'd')
  {
    // single circle with drag
    modeSingleCircle   = false;
    modeSpray          = false;
    modeCircleOfBodies = true;
  }
}

void keyReleased()
{
  // reset all modes
  modeSingleCircle   = false;
  modeSpray          = false;
  modeCircleOfBodies = false;
  
  currentMode = "";
}

void initScene()
{
  if (physics != null) physics.destroy();
  // Set up the engine with the sketch's dimensions
  physics = new Physics(this, width, height - 80);

  physics.setDensity(1.0);
  physics.setCustomRenderingMethod(this, "blackWhite");
  physics.setFriction(0.9);
  physics.setRestitution(0.9);
}




/********************************************************************************************************** Circle Creation **/

void createCircleBody(float xPos, float yPos, float radius)
{
  physics.createCircle(xPos, yPos, radius);
}

void createCircleOfBodies(float xPos, float yPos, float radius, float density)
{
  circles = new ArrayList();

  int cRadius = 8;

  Body pBody, nBody;

  for (int deg = 0; deg < 360; deg += density)
  {
    float angle = radians(deg);

    float x = xPos + (radius * cos(angle));
    float y = yPos + (radius * sin(angle));

    Body c = physics.createCircle(x, y, cRadius);
    circles.add(c);
  }

  for (int j = 0; j < circles.size() - 1; j++)
  {
    pBody = (Body)circles.get(j);
    nBody = (Body)circles.get(j + 1);

    connectBodies(pBody, nBody);
  }

  // Connect the ending bodies
  pBody = (Body)circles.get(0);
  nBody = (Body)circles.get(circles.size() - 1);

  connectBodies(pBody, nBody);
}

void connectBodies(Body pBody, Body nBody)
{
  float px = physics.worldToScreen(pBody.getPosition()).x;
  float py = physics.worldToScreen(pBody.getPosition()).y;
  float nx = physics.worldToScreen(nBody.getPosition()).x;
  float ny = physics.worldToScreen(nBody.getPosition()).y;

  // Connect the neighbors
  physics.createDistanceJoint(pBody, nBody, px, py, nx, ny);
  //physics.createRevoluteJoint(pBody, nBody, x, y);
}








/********************************************************************************************************** Custom Rendering **/


void blackWhite(World w)
{
  //go through each of our body lists in the physics world
  for (Body body = physics.getWorld().getBodyList(); body != null; body = body.getNext())
  {

    //Define the shape as a jbox2D shape variable
    org.jbox2d.collision.Shape shape;

    //go through each of our shapes contained in the current body
    for (shape = body.getShapeList(); shape != null; shape = shape.getNext())
    {

      //draw the shapes based on type
      if (shape.getType() == ShapeType.POLYGON_SHAPE)
      {

        //Polygon Appearance Parameters
        fill(255);
        stroke(200);
        strokeWeight(1);

        //Draw the polygon
        polyDraw(body, shape);
      } 

      else if (shape.getType() == ShapeType.CIRCLE_SHAPE)
      {
        //Circle Appearance Parameters
        fill(0);
        stroke(255);
        strokeWeight(1);

        //Draw the circle
        circleDraw(body, shape);
      }
    } 
  }
}


void polyDraw(Body body, org.jbox2d.collision.Shape shape) {

  beginShape();

  PolygonShape poly = (PolygonShape) shape;

  //get the number of vertex points that make up the shape
  int count = poly.getVertexCount();

  //convert the polygon into points
  Vec2[] verts = poly.getVertices();

  //make a vertex for each point of the polygon and convert for pixel coordinates
  for(int i = 0; i < count; i++) {

    //get the position of the vertex of the shape within the body in the world (whew!!)
    Vec2 vert = physics.worldToScreen(body.getWorldPoint(verts[i]));
    vertex(vert.x, vert.y);
  }

  //connect the last point with the first point and stop
  Vec2 firstVert = physics.worldToScreen(body.getWorldPoint(verts[0])); 
  vertex(firstVert.x, firstVert.y);
  endShape();
}

void circleDraw(Body body, org.jbox2d.collision.Shape shape) {

  //convert the shape to a circleshape
  CircleShape circle = (CircleShape) shape;

  //get position of circle within body
  Vec2 center = circle.getLocalPosition();

  //get position of body within world and convert to pixel coordinates
  Vec2 wpoint = physics.worldToScreen(body.getWorldPoint(center));

  //get the radius of the circleshape in pixel format
  float radius = physics.worldToScreen(circle.getRadius());

  //draw the circle with radius converted to diameter
  ellipse(wpoint.x,wpoint.y,radius*2,radius*2);
}




