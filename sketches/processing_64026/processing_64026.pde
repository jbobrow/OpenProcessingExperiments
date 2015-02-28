

import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;

PFont font;

Physics sim;

Button circle;
Button rectangle;
Button bomb;

Button zoomIn;
Button zoomOut;

String drawMode;

drawShape drawshape;

ArrayList particles;

PGraphics fx;

float scale;

void setup() {
  println("Compiling completed.");
  //size(screen.width, screen.height);
  //^^^ Uncomment for full screen ^^^
  size(640, 480);
  smooth();
  
  println("Loading font...");
  font = loadFont("LucidaConsole-12.vlw");
  textFont(font);
  
  println("Loading physics...");
  sim = new Physics(this, width, height);
  sim.setCustomRenderingMethod(this, "RenderPhysics");
  sim.setDensity(0.0f);
  sim.createRect(-50, height - 10, width + 50, height + 2);
  sim.setDensity(1.0f);
  sim.removeBorder();
  
  println("Loading the rest...");
  particles = new ArrayList();
  fx = createGraphics(width, height, P2D);
  rectangle = new Button(2, 2, 100, 16, "Rectangle");
  circle = new Button(104, 2, 100, 16, "Circle");
  bomb = new Button(206, 2, 100, 16, "Bomb");
  zoomIn  = new Button(325, 2, 60, 16, "Zoom In");
  zoomOut = new Button(387, 2, 60, 16, "Zoom Out");
  rectangle.on = true;
  drawshape = null;
  scale = 1;
  
  println("Done!");
}

void draw() {
  background(255);
  
  circle.draw();
  rectangle.draw();
  bomb.draw();
  //zoomIn.draw();
  //zoomOut.draw();
  if (circle.clicked()) {
    circle.on = true;
    rectangle.on = false;
    bomb.on = false;
  }
  if (rectangle.clicked()) {
    rectangle.on = true;
    circle.on = false;
    bomb.on = false;
  }
  if (bomb.clicked()) {
    bomb.on = true;
    rectangle.on = false;
    circle.on = false;
  }
  
  scale(scale);
  image(fx, 0, 0);
  
  fx.beginDraw();
  fx.background(255, 0);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    if (p.alive) {
      p.update();
      p.draw();
    } else {
      particles.remove(i);
    }
  }
  fx.endDraw();
  
  if (drawshape != null)
    drawshape.draw();
}

void RenderPhysics(World world) {
   
  // clear the background
  stroke(0);
  noFill();
   
  // iterate through the bodies
  Body body;
  for (body = world.getBodyList(); body != null; body = body.getNext()) {
   
    // iterate through the shapes of the body
    org.jbox2d.collision.Shape shape;
    for (shape = body.getShapeList(); shape != null; shape = shape.getNext()) {
      stroke(0);
      noFill();
      // find out the shape type
      ShapeType st = shape.getType();
      if (st == ShapeType.POLYGON_SHAPE) {
   
        // polygon? let's iterate through its vertices while using begin/endShape()
        beginShape();
        PolygonShape poly = (PolygonShape) shape;
        int count = poly.getVertexCount();
        Vec2[] verts = poly.getVertices();
        for(int i = 0; i < count; i++) {
          Vec2 vert = sim.worldToScreen(body.getWorldPoint(verts[i]));
          vertex(vert.x, vert.y);
        }
        Vec2 firstVert = sim.worldToScreen(body.getWorldPoint(verts[0]));
        vertex(firstVert.x, firstVert.y);
        endShape();
   
      }
      else if (st == ShapeType.CIRCLE_SHAPE) {
   
        // circle? let's find its center and radius and draw an ellipse
        CircleShape circle = (CircleShape) shape;
        Vec2 pos = sim.worldToScreen(body.getWorldPoint(circle.getLocalPosition()));
        float radius = sim.worldToScreen(circle.getRadius());
        Bomb data = (Bomb) body.getUserData();
        ellipseMode(CENTER);
        if (data == null) { //Not a bomb D:
          ellipse(pos.x, pos.y, radius*2, radius*2);
          // we'll add one more line to see how it rotates
          line(pos.x, pos.y, pos.x + radius*cos(-body.getAngle()), pos.y + radius*sin(-body.getAngle()));
        } 
        
        else { //It be a bomb :D
          stroke(255, 0, 0);
          ellipse(pos.x, pos.y, radius*2, radius*2);
          float timerrad = data.time / 3 * (radius * 2);
          ellipse(pos.x, pos.y, timerrad, timerrad); //Inner circle gets smaller as it ticks
          data.draw(int(pos.x), int(pos.y));
          data.tick();
          if (millis() - data.lasttick >= 1000) {
            Particle p = new RingParticle(pos.x, pos.y, radius * 2);
            particles.add(p);
            data.lasttick = millis();
          }
          if (data.time <= 0) { //Boom boom time :D
            sim.removeBody(body); //No self-rebuilding bombs exist yet D:
            data.explode(pos.x, pos.y, radius);
          }
        }
      }
    }
  }
}

class Button {
  int x, y, wide, high;
  String text;
  boolean on;
  Button(int x_, int y_, int wide_, int high_, String text_) {
    on = false;
    x = x_;
    y = y_;
    wide = wide_;
    high = high_;
    text = text_;
  }
  
  void draw() {
    boolean ms = mouseOver();
    fill(ms ? 220 : 255);
    if (on)
      fill(200);
    stroke(0);
    rect(x, y, wide, high);
    fill(0);
    textAlign(LEFT, TOP);
    text(text, x + 2, y + 2);//, wide - 4, high - 4);
  }
  
  boolean mouseOver() {
    return mouseX >= x && mouseX <= x + wide && mouseY >= y && mouseY <= y + high;
  }
  
  boolean clicked() {
    return mouseOver() && mousePressed;
  }
}


class drawShape {
  int startX, startY;
  drawShape(int x, int y) {
    startX = x;
    startY = y;
  }
  
  void draw() {
    stroke(200);
    noFill();
    rect(startX, startY, mouseX - startX, mouseY - startY);
  }
  
  void finish() {
    if (startX != mouseX && startY != mouseY)
      sim.createRect(startX, startY, mouseX, mouseY);
  }
}

class drawCircle extends drawShape {
  drawCircle(int x, int y) {
    super(x, y);
  }
  
  void draw() {
    stroke(200);
    noFill();
    ellipse(startX, startY, dist(startX, startY, mouseX, mouseY) * 2, dist(startX, startY, mouseX, mouseY) * 2);
    line(startX, startY, mouseX, mouseY);
  }
  
  void finish() {
    if (!(startX == mouseX && startY == mouseY))
      sim.createCircle(startX, startY, dist(startX, startY, mouseX, mouseY));
  }
}


class drawBomb extends drawCircle {
  drawBomb(int x, int y) {
    super(x, y);
  }
  
  void draw() {
    stroke(255, 200, 200);
    noFill();
    ellipse(startX, startY, dist(startX, startY, mouseX, mouseY) * 2, dist(startX, startY, mouseX, mouseY) * 2);
    ellipse(startX, startY, dist(startX, startY, mouseX, mouseY), dist(startX, startY, mouseX, mouseY)); //Half size of first
  }
  void finish() {
    if (!(startX == mouseX && startY == mouseY)) {
      Body c = sim.createCircle(startX, startY, dist(startX, startY, mouseX, mouseY));
      c.setUserData(new Bomb());
    }
  }
}

class Bomb { //User data class that makes a shape a bomb
  float time;
  float lasttime;
  float lasttick;
  Bomb() {
    time = 3.0;
    lasttime = millis();
    lasttick = 0;
  }
  
  void tick() {
    float m = millis();
    time -= (m - lasttime) / 1000; //How long since tick() was last called?
    lasttime = m;
  }
  
  void explode(float x, float y, float radius) {
    float maxDistance = radius * 10;
    float maxForce = radius * 10;
    
    Body body;
    World world = sim.getWorld();
    for (body = world.getBodyList(); body != null; body = body.getNext()) {
      // iterate through the shapes of the body
      org.jbox2d.collision.Shape shape;
      for (shape = body.getShapeList(); shape != null; shape = shape.getNext()) {
        // find out the shape type
        ShapeType st = shape.getType();
        if (st == ShapeType.POLYGON_SHAPE) {
          PolygonShape poly = (PolygonShape) shape;
          int count = poly.getVertexCount();
          Vec2[] verts = poly.getVertices();
          for(int i = 0; i < count; i++) { //Let's loop through the polygon's vertices
            
            Vec2 vert = sim.worldToScreen(body.getWorldPoint(verts[i]));
            float distance = dist(x, y, vert.x, vert.y);
            float strength = (maxDistance - distance);
            float force = strength * maxForce;
            if(distance > maxDistance)
              distance = maxDistance - 0.01;
              
            float angle = atan2(vert.y - y, vert.x - x);
            sim.applyForce(body, cos(angle) * force, sin(angle) * force * -1, vert.x, vert.y);
            //vertex(vert.x, vert.y);
          }
          Vec2 firstVert = sim.worldToScreen(body.getWorldPoint(verts[0]));
        }
        else {
          CircleShape circle = (CircleShape) shape;
          Vec2 pos = sim.worldToScreen(body.getWorldPoint(circle.getLocalPosition()));
          
          float distance = dist(x, y, pos.x, pos.y);
          float strength = (maxDistance - distance);
          float force = strength * maxForce;
          if(distance > maxDistance)
            distance = maxDistance - 0.01;
            
          float angle = atan2(pos.y - y, pos.x - x);
          sim.applyForce(body, cos(angle) * force, sin(angle) * force * -1);
        }
      }
    }
    
    float power = radius / 15;
    
    for (int i = 0; i < 250; i++) { //Now for some particle explosion effects :D
      Particle p = new Particle(x, y);
      float v = random(power);
      float a = random(360);
      p.xvel = v * cos(a);
      p.yvel = v * sin(a);
      particles.add(p);
    }
    
    int dnum = int(random(5, 10));
    for (int i = 0; i < dnum; i++) {
      Debris p = new Debris(x, y);
      float v = random(power, power + 3);
      float a = random(360);
      p.xvel = v * cos(a);
      p.yvel = v * sin(a);
      particles.add(p);
    }
    
    RingParticle p = new RingParticle(x, y, 5, 10);
    particles.add(p);
  }
  
  void draw(int x, int y) {
    textAlign(CENTER);
    fill(0);
    text(nf(time, 1, 2), x, y - 10);
  }
}


class Particle {
  float x, y;
  float oldx, oldy;
  float xvel, yvel;
  float gravity;
  boolean alive;
  float life;
  Particle(float x_, float y_) {
    x = x_;
    y = y_;
    xvel = 0;
    yvel = 0;
    oldx = x;
    oldy = y;
    gravity = 0.05;
    alive = true;
    life = 255;
  }
  
  void update() {
    life--;
    if (life <= 0)
      alive = false;
    oldx = x;
    oldy = y;
    x += xvel;
    y += yvel;
    yvel += gravity;
    if (x > width || x < 0 || y > height || y < -height)
      alive = false;
  }
  
  void draw() {
    fx.stroke(255, 0, 0, life);
    fx.line(oldx, oldy, x, y);
  }
}

class Debris extends Particle {
  Debris(float x_, float y_) {
    super(x_, y_);
  }
  
  void draw() {
    life += 1;
    for (int i = 0; i < 3; i++) {
      Particle p = new Particle(x + random(-1, 1.-1), y + random(-1, 1.-1));
      p.xvel = xvel * 0.5 + random(-0.1, 0.501);
      p.yvel = yvel * 0.5 + random(-0.5, 0.501);
      p.life = life;
      particles.add(p);
    }
  }
}

class RingParticle extends Particle {
  float radius;
  float power;
  RingParticle(float x_, float y_, float radius_) {
    super(x_, y_);
    radius = radius_;
    gravity = 0;
    power = 2;
  }
  
  RingParticle(float x_, float y_, float radius_, float power_) {
    super(x_, y_);
    radius = radius_;
    gravity = 0;
    power = power_;
  }
  
  void update() {
    super.update();
    life -= 2;
    radius += power;
  }
  
  void draw() {
    stroke(255, 0, 0, life);
    noFill();
    ellipse(x, y, radius, radius);
  }
}

void mousePressed() {
  if (!(rectangle.clicked() || circle.clicked() || bomb.clicked() || zoomIn.clicked() || zoomOut.clicked())) {
    if (rectangle.on)
      drawshape = new drawShape(mouseX, mouseY);
    else if (circle.on)
      drawshape = new drawCircle(mouseX, mouseY);
    else if (bomb.on)
      drawshape = new drawBomb(mouseX, mouseY);
  } else {
    if (zoomIn.clicked())
      scale += 0.1;
    if (zoomOut.clicked())
      scale -= 0.1;
  }
}


void mouseReleased() {
  if (drawshape != null) {
    drawshape.finish();
    drawshape = null;
  }
}

