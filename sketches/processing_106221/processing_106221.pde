
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

SinCosLUT sinCosLUT;
float deg;
float sinMax, sinMin;

Snake snake;
ArrayList<Snake> snakes = new ArrayList();

void setup() {
  size(400, 400, P2D);
  colorMode(HSB, 360, 100, 100, 100);
  sinCosLUT = new SinCosLUT(70); // precision passed as arg
  frameRate(30);
  noFill();
  sinMax = sinMin = 0;
  
  for(int i=0; i<65; i++)
    snakes.add(new Snake());
}

class Snake {

  PShape snakeShape;
  PVector pos;
  
  public Snake() {
    int borderBuffer = 10;
    pos = new PVector(random(-borderBuffer, width+borderBuffer), random(height/4, height+borderBuffer));
    
    snakeShape = createShape();

    snakeShape.beginShape();
      snakeShape.strokeWeight(4);
      for(int i=0; i<480; i+=9) {
        snakeShape.vertex(0, i);
      }  
    snakeShape.endShape();
    
    if(pos.y > height/4) {
      float alpha = map(pos.y, height/4, height, 100, 0);
      snakeShape.setStroke(color(0, 0, 75, alpha));
    } else {
      snakeShape.setStroke(color(0, 0, 75));
    }
  }
  
  public void draw(float deg) {
    pushMatrix();
      translate(pos.x, pos.y);
      
      for (int i = 0; i < snakeShape.getVertexCount(); i++) {
        PVector v = snakeShape.getVertex(i);
        v.x += sinCosLUT.sin(deg + i*0.01);
        snakeShape.setVertex(i, v.x, v.y);
      }
      
      shape(snakeShape);

    popMatrix();
  }
}

void draw() {
  fill(20, 40);
  rect(0,0,width,height);
  
  // inc degrees. if 360, go back to 0.
  deg+= 1.01;
  if(deg != 0 && deg % 360 == 0) deg = 0;
  
 // float sinResult = sinCosLUT.sin(deg);
  
  for(Snake snake : snakes)
    snake.draw(deg);
  
}



