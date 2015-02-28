
/**
 * Created by IntelliJ IDEA.
 * User: hellochar
 * Date: 11/9/11
 * Time: 6:11 PM
 */

import daily._, nov._, oct._
import peasy.PeasyCam
import zhang.Methods
import org.zhang.lib.{P5Util, MyPApplet}
import org.zhang.geom.{Vec2, Vec3}
import java.awt.event.KeyEvent

class Nov9 extends MyPApplet with Savable with SphereUtils with SphereSurfaceUI {
  import processing.core.PApplet._, processing.core.PConstants._;

  def DT = .1f;
  def DRAG = .007f

  class Ball(var loc:Vec3) {
    private var plane = LocalPlane(loc)
    private var vel = Vec2();
    private var force = Vec2();

    /**
     * Preconditions: plane's center == loc.
     * This method calculates the force that this Ball will feel, expressed in LP coordinates.
     */
    def run(point:Vec3, POW:Float) {
      force = plane(point) ofMag POW//Vec2.invR2(Vec2.ZERO, plane.toPlane(point)) * -POW;
    }

    /**
     * Preconditions: plane's center == loc
     * This method mutates this ball's location and velocity, and updates its LP variable to be that of the new loc.
     */
    def update() {
      vel = (vel + force * DT) * (1 - DRAG); //mutate velocity
      loc = plane(vel * DT); //mutate location
      val newPlane = LocalPlane(loc); //get new LP
      vel = newPlane.convertAngle(vel, plane); //convert vel to new LP
      plane = newPlane; //update LP
      force = Vec2();
    }

    def draw() {
      noStroke(); fill(0);
      sphere(loc /** (1 + vel.mag / 100)*/, .5f);
    }
  }

  val NUMBER = 1200

  def randomColor = color(random(255), random(255), random(255))
  var balls = (0 until NUMBER).map(x => new Ball(Vec2.fromPolar(100, x * TWO_PI / NUMBER).xy));
  lazy val cam = new PeasyCam(this, 300);

  def reset() {
    balls = (0 until NUMBER).map(x => new Ball(Vec2.fromPolar(100, x * TWO_PI / NUMBER).xy));
  }

  val mkl = new zhang.MultiKeyListener();
  addKeyListener(mkl);

  override def setup() {
    size(500, 500, P3D)
    cam;
  }

  override def draw() {
    background(64);
    sphereDetail(30)
//    lights();
    noStroke(); fill(255); sphere(100);
    val q = mkl.isPressed(KeyEvent.VK_Q)
    if(q || mkl.isPressed(KeyEvent.VK_W)) {
      getIntersect(mouseX, mouseY, 100).foreach(p => {
          strokeWeight(5); stroke(if(q) color(255, 0, 0) else color(0, 255, 0));
          smallCircle(p, 10);
          balls foreach (_.run(p, if(q) 15 else -15 ))
        })
    }
    balls foreach (_.update())
    sphereDetail(3)
    balls foreach (_.draw())
    println(frameRate)
    pollSave()
  }

  override def keyPressed() {
    super.keyPressed();
    if(key == 'r') reset();
  }
}
