
import org.jbox2d.util.nonconvex.*;
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.testbed.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.p5.*;
import org.jbox2d.dynamics.*;
Physics physics;
Body penguin;
Vec2 startPoint;
CollisionDetector detector; 
boolean dragging = false;
PImage back,peng;
int score=0;
int ballSize = 60;
void setup() 
{
  size(1020,650);
  frameRate(60);
  back=loadImage("water.jpg");
  peng=loadImage("pink3.png");
    imageMode(CENTER);
     physics = new Physics(this, width, height, 0, -10, width*2, height*2, width, height, 100);
physics.setCustomRenderingMethod(this, "myCustomRenderer");
  physics.setDensity(10.0);
  startPoint = new Vec2(width/2,height/2 );
  startPoint = physics.screenToWorld(startPoint);
   penguin = physics.createCircle(width/2, -100, ballSize/2);


  
}

void mouseDragged()
{
  // tie the droid to the mouse while we are dragging
  dragging = true;
  penguin.setPosition(physics.screenToWorld(new Vec2(mouseX, mouseY)));
}
void mouseReleased()
{
  dragging = false;
  Vec2 impulse = new Vec2();
  impulse.set(startPoint);
  impulse = impulse.sub(penguin.getWorldCenter());
  impulse = impulse.mul(50);
  penguin.applyImpulse(impulse, penguin.getWorldCenter());
}
void myCustomRenderer(World world)
{
 

  Vec2 screenStartPoint = physics.worldToScreen(startPoint);
  Vec2 screenDroidPos = physics.worldToScreen(penguin.getWorldCenter());
  float droidAngle = physics.getAngle(penguin);
  pushMatrix();
  translate(screenDroidPos.x, screenDroidPos.y);
  rotate(-radians(droidAngle));
  image(peng, 0, 0, ballSize, ballSize);
  popMatrix();

}
void draw()
{
  image(back, width/2, height/2, width, height);
  fill(255);
  text("Score: " + score, 20, 20);
 
}



