
// usually one would probably make a generic Shape class and subclass different types (circle, polygon), but that

// would mean at least 3 instead of 1 class, so for this tutorial it's a combi-class CustomShape for all types of shapes

// to save some space and keep the code as concise as possible I took a few shortcuts to prevent repeating the same code

class CustomShape {

  // to hold the box2d body

  Body body;

  // to hold the Toxiclibs polygon shape

  Polygon2D toxiPoly;

  // custom color for each shape

  color col;

  // radius (also used to distinguish between circles and polygons in this combi-class

  float r;



  CustomShape(float x, float y, float r) {

    this.r = r;

    // create a body (polygon or circle based on the r)

    makeBody(x, y);

    // get a random color

    col = getRandomColor();//++++++++++++++++++++++++++?????


  }



  void makeBody(float x, float y) {

    // define a dynamic body positioned at xy in box2d world coordinates,

    // create it and set the initial values for this box2d body's speed and angle

    BodyDef bd = new BodyDef();

    bd.type = BodyType.DYNAMIC;

    bd.position.set(box2d.coordPixelsToWorld(new Vec2(x, y)));

    body = box2d.createBody(bd);
    
       //+++++++++++++iisolated images here+++++++++++++++++++++++++++++++++++
     
       
    body.setLinearVelocity(new Vec2(random(-8, 8), random(2, 8)));

    body.setAngularVelocity(random(-5, 5));

          

    // depending on the r this combi-code creates either a box2d polygon or a circle

    if (r == -1) {

      // box2d polygon shape

      PolygonShape sd = new PolygonShape();
         


      // toxiclibs polygon creator (triangle, square, etc)//+++++++++++++++++++++++++++++++++squares,triangles,circles++++++++++++++

      //toxiPoly = new Circle(random(5, 20)).toPolygon2D(int(random(3, 6)));//+++++++++++++++origine++++
     toxiPoly = new Circle(random(2, 2)).toPolygon2D(int(random(3, 3)));

      // place the toxiclibs polygon's vertices into a vec2d array
      

      Vec2[] vertices = new Vec2[toxiPoly.getNumPoints()];

      for (int i=0; i<vertices.length; i++) {

        Vec2D v = toxiPoly.vertices.get(i);
     
        vertices[i] = box2d.vectorPixelsToWorld(new Vec2(v.x, v.y));
              

      }

      // put the vertices into the box2d shape

      sd.set(vertices, vertices.length);
       


      // create the fixture from the shape (deflect things based on the actual polygon shape)+++++++++++++++++++++++++++++++++++++

      body.createFixture(sd, 1);

    } else {

      //box2d circle shape of radius 

      CircleShape cs = new CircleShape();

      cs.m_radius = box2d.scalarPixelsToWorld(r);
           

      // tweak the circle's fixture def a little bit

      FixtureDef fd = new FixtureDef();

      fd.shape = cs;

      fd.density = 1;

      fd.friction = 0.01;

      fd.restitution = 0.3;

      // create the fixture from the shape's fixture def (deflect things based on the actual circle shape)

      body.createFixture(fd);

    }

  }



  // method to loosely move shapes outside a person's polygon

  // (alternatively you could allow or remove shapes inside a person's polygon)

  void update() {
         

    // get the screen position from this shape (circle of polygon)

    Vec2 posScreen = box2d.getBodyPixelCoord(body);

    // turn it into a toxiclibs Vec2D

    Vec2D toxiScreen = new Vec2D(posScreen.x, posScreen.y);

    // check if this shape's position is inside the person's polygon

    boolean inBody = poly.containsPoint(toxiScreen);

    // if a shape is inside the person

    if (inBody) {

      // find the closest point on the polygon to the current position

      Vec2D closestPoint = toxiScreen;

      float closestDistance = 9999999;

      for (Vec2D v : poly.vertices) {

        float distance = v.distanceTo(toxiScreen);

        if (distance < closestDistance) {

          closestDistance = distance;

          closestPoint = v;

        }

      }

      // create a box2d position from the closest point on the polygon

      Vec2 contourPos = new Vec2(closestPoint.x, closestPoint.y);

      Vec2 posWorld = box2d.coordPixelsToWorld(contourPos);

      float angle = body.getAngle();

      // set the box2d body's position of this CustomShape to the new position (use the current angle)

      body.setTransform(posWorld, angle);

    }

  }



  // display the customShape

  void display() {

    // get the pixel coordinates of the body

    Vec2 pos = box2d.getBodyPixelCoord(body);
          

    pushMatrix();

    // translate to the position

    translate(pos.x, pos.y);

    noStroke();


    // use the shape's custom color

     //fill(col);

    // depending on the r this combi-code displays either a polygon or a circle

    if (r == -1) {

      // rotate by the body's angle

      float a = body.getAngle();

      rotate(-a); // minus!

      gfx.polygon2D(toxiPoly);

    } else {
      // size of the transparent rectangle to be superposed on the picture 
      //they have to be the same amaount of pixels ideally less than (0,0,50,50) minimum (0,0,10,10)
      //this allows the picture to be "catched" by the performer
    
      image(images[imageIndex],0,0);//++L6+++++++++++++++++++++++++++++++++++++
      
      
      fill(0,10);//++++++++++++++transparency of the square
      rect(0,0,50,50);//++++++++++++++initilal values 20,20+++++++++++++++++++++++++++++++

      //tint(255, 100);  // Display more or less opacity: 0 to 255 the second value++++++
      
      }

    popMatrix();

  }

    // if the shape moves off-screen, destroy the box2d body (important!)

    // and return true (which will lead to the removal of this CustomShape object)

  boolean done() {

    Vec2 posScreen = box2d.getBodyPixelCoord(body);

    boolean offscreen = posScreen.y > height;
    
    
    
 
    stroke(0);
    
   
    if (offscreen) {

      box2d.destroyBody(body);

      return true;

    }

    return false;

  }

}

