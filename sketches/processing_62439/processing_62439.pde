
// Importation des librairies
import pbox2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Liste des obstacles par défaut sur l'écran (limites physiques)
ArrayList<Boundary> box2dBoundariesScreen;

// Fonction de création des limites de l'écran
void box2d_createScreenBoundaries(boolean isGround,boolean isLeft,boolean isRight, boolean isTop)
{
  if (box2dBoundariesScreen == null)
    box2dBoundariesScreen = new ArrayList<Boundary>();

  if (isGround)
    box2dBoundariesScreen.add(new Boundary(width/2,height+5,width,10));
  if (isLeft)
    box2dBoundariesScreen.add(new Boundary(-5,height/2,10,height));
  if (isRight)
    box2dBoundariesScreen.add(new Boundary(width+5,height/2,10,height));
  if (isTop)
    box2dBoundariesScreen.add(new Boundary(width/2,-5,width,10));
}

void box2d_displayScreenBoundaries()
{
  for (Boundary b:box2dBoundariesScreen){
    b.display();
  }
}


// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2012
// PBox2D example

// A fixed boundary class

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Define the polygon
    PolygonShape sd = new PolygonShape();
    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    // We're just a box
    sd.setAsBox(box2dW, box2dH);


    // Create the body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    // Attached the shape to the body using a Fixture
    b.createFixture(sd,1);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}



