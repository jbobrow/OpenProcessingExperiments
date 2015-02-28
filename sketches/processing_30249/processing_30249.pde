
import toxi.geom.*;
import toxi.color.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D physics;

Cluster cluster;
PFont infoFont;


void setup() {
  size(900, 600);
  physics = new VerletPhysics2D();
  physics.setWorldBounds(new Rect(0, 0, width, height));

  Vec2D center = new Vec2D(width/2, height/2);
  cluster = new Cluster(random(30, 40), center);
  smooth();

  infoFont = loadFont("Monospaced.plain-12.vlw");
  textFont(infoFont, 12);
}

void draw() {
  physics.update();
  background(255);

  cluster.display();
  cluster.renderText();
  cluster.panel();

  ui();
}

void ui() {
  fill(0);
  textAlign(LEFT);
  text("Facebook Users as a Proportion of the Population with Internet Access, Europe, 2010", 10, 20);
  fill(59, 89, 152);
  ellipse(15, 40, 10, 10);
  fill(0);
  text("Internet Users as a % of Population", 30, 45);
  fill(255);
  strokeWeight(1);
  stroke(59, 89, 152);
  ellipse(15, 55, 10, 10);
  fill(0);
  text("Facebook Users as a % of Population", 30, 60);
  text("r   Refresh", 12, 75);
  text("c   Display Country Names", 12, 90);
  text("Source: http://culturalpolicies.net", 10, height-15);
}

void keyPressed() {
  if (key=='r') {
    setup();
  }
  if (key==' '){
    save(frameCount+".jpg");
    println("saved "+frameCount);
  }
}


