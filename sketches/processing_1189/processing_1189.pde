
import org.jbox2d.dynamics.contacts.*;
import org.jbox2d.collision.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.dynamics.*;

class ProcessingDebugDraw extends DebugDraw {
  public ProcessingDebugDraw screen; //static rendering context for debug drawing from within other code

  private boolean firstTime = true;
  public PApplet g;
  public PFont m_font;
  public float fontHeight;
  // World 0,0 maps to transX, transY on screen
  public float transX = 320.0f;
  public float transY = 240.0f;
  public float scaleFactor = 20.0f;
  public float yFlip = -1.0f; //flip y coordinate

  public void setCamera(float x, float y, float scale) {
    transX = PApplet.map(x,0.0f,-1.0f,g.width*.5f,g.width*.5f+scale);
    transY = PApplet.map(y,0.0f,yFlip*1.0f,g.height*.5f,g.height*.5f+scale);
    scaleFactor = scale;
  }

  public ProcessingDebugDraw(PApplet pApplet) {
    screen = this;
    g = pApplet;
    m_font = g.createFont("LucidaGrande-Bold",12);//-Bold-14.vlw");
    fontHeight = 14.0f;
  }

  public Vec2 worldToScreen(Vec2 world) {
    float x = PApplet.map(world.x, 0f, 1f, transX, transX+scaleFactor);
    float y = PApplet.map(world.y, 0f, 1f, transY, transY+scaleFactor);
    if (yFlip == -1.0f) y = PApplet.map(y,0f,g.height, g.height,0f);
    return new Vec2(x, y);
  }
  public Vec2 worldToScreen(float x, float y) {
    return worldToScreen(new Vec2(x,y));
  }

  public Vec2 screenToWorld(Vec2 screen) {
    float x = PApplet.map(screen.x, transX, transX+scaleFactor, 0f, 1f);
    float y = screen.y;
    if (yFlip == -1.0f) y = PApplet.map(y,g.height,0f,0f,g.height);
    y = PApplet.map(y, transY, transY+scaleFactor, 0f, 1f);
    return new Vec2(x,y);
  }
  public Vec2 screenToWorld(float x, float y) {
    return screenToWorld(new Vec2(x,y));
  }

  /* (non-Javadoc)
   	 * @see org.jbox2d.dynamics.DebugDraw#drawCircle(org.jbox2d.common.Vec2, float, javax.vecmath.Color3f)
   	 */

  public void drawCircle(Vec2 center, float radius, Color3f c3f) {
    center = worldToScreen(center);
    radius *= scaleFactor;
    g.noFill();
    float k_segments = 16.0f;
    float k_increment = 2.0f * (float)Math.PI / k_segments;
    float theta = 0.0f;
    g.stroke(c3f.x, c3f.y, c3f.z);
    g.noFill();
  
    g.ellipse(center.x, center.y, radius, radius);
  }


  /* (non-Javadoc)
   	 * @see org.jbox2d.dynamics.DebugDraw#drawSolidCircle(org.jbox2d.common.Vec2, float, org.jbox2d.common.Vec2, javax.vecmath.Color3f)
   	 */

  public void drawSolidCircle(Vec2 center, float radius, Vec2 axis,
  Color3f c3f) {
    center = worldToScreen(center);
    radius = radius * scaleFactor;
    axis = new Vec2(axis.x, axis.y*yFlip);

    float k_segments = 16.0f;
    float k_increment = 2.0f * (float)Math.PI / k_segments;
    float theta = 0.0f;
    g.fill(0.5f*c3f.x, 0.5f*c3f.y, 0.5f*c3f.z, 0.5f*255.0f);
    g.stroke(c3f.x,c3f.y,c3f.z, 255.0f);
  
    g.ellipse(center.x, center.y, radius*2, radius*2);
    Vec2 p = new Vec2(center.x + radius * axis.x, center.y + radius * axis.y);
    g.beginShape(PApplet.LINES);
    g.vertex(center.x, center.y);
    g.vertex(p.x, p.y);
    g.endShape();
  }

  /* (non-Javadoc)
   	 * @see org.jbox2d.dynamics.DebugDraw#drawPolygon(org.jbox2d.common.Vec2[], int, javax.vecmath.Color3f)
   	 */

  public void drawPolygon(Vec2[] vertices, int vertexCount, Color3f c3f) {
    g.stroke(c3f.x, c3f.y, c3f.z);
    g.noFill();
    for (int i = 0; i < vertexCount; ++i) {
      int ind = (i+1<vertexCount)?i+1:(i+1-vertexCount);
      Vec2 v1 = worldToScreen(vertices[i]);
      Vec2 v2 = worldToScreen(vertices[ind]);
      g.line(v1.x, v1.y, v2.x, v2.y);
    }

  }

  /* (non-Javadoc)
   	 * @see org.jbox2d.dynamics.DebugDraw#drawSolidPolygon(org.jbox2d.common.Vec2[], int, javax.vecmath.Color3f)
   	 */

  public void drawSolidPolygon(Vec2[] vertices, int vertexCount, Color3f c3f) {
    g.noStroke();
    g.fill(0.5f * c3f.x, 0.5f * c3f.y, 0.5f * c3f.z, 0.5f*255.0f);
    g.beginShape(PApplet.POLYGON);
    for (int i = 0; i < vertexCount; ++i) {
      Vec2 v = worldToScreen(vertices[i]);
      g.vertex(v.x, v.y);
    }
    g.endShape();

    g.stroke(c3f.x, c3f.y, c3f.z, 255.0f);
    for (int i = 0; i < vertexCount; ++i) {
      int ind = (i+1<vertexCount)?i+1:(i+1-vertexCount);
      Vec2 v1 = worldToScreen(vertices[i]);
      Vec2 v2 = worldToScreen(vertices[ind]);
      g.line(v1.x, v1.y, v2.x, v2.y);
    }
  }


  public void drawSegment(Vec2 p1, Vec2 p2, Color3f c3f) {
    p1 = worldToScreen(p1);
    p2 = worldToScreen(p2);
    g.stroke(c3f.x, c3f.y, c3f.z);
    g.beginShape(PApplet.LINES);
    g.vertex(p1.x, p1.y);
    g.vertex(p2.x, p2.y);
    g.endShape();
  }

  /* (non-Javadoc)
   	 * @see org.jbox2d.dynamics.DebugDraw#drawXForm(org.jbox2d.common.XForm)
   	 */

  public void drawXForm(XForm xf) {
    Vec2 p1 = xf.position.clone(), p2 = new Vec2();
    float k_axisScale = 0.4f;
    g.beginShape(PApplet.LINES);
    Vec2 p1world = worldToScreen(p1);
    g.stroke(1.0f, 0.0f, 0.0f);
    g.vertex(p1world.x, p1world.y);
    p2.x = p1.x + k_axisScale * xf.R.col1.x;
    p2.y = p1.y + k_axisScale * xf.R.col1.y;
    Vec2 p2world = worldToScreen(p2);
    g.vertex(p2world.x, p2world.y);

    g.stroke(0.0f, 1.0f, 0.0f);
    g.vertex(p1world.x, p1world.y);
    p2.x = p1.x + k_axisScale * xf.R.col2.x;
    p2.y = p1.x + k_axisScale * xf.R.col2.y;
    p2world = worldToScreen(p2);
    g.vertex(p2.x, p2.y);

    g.endShape();

  }


  public void drawString(float x, float y, String s, Color3f c3f) {
    //g.textFont(m_font, 36);
    //if (true) return;
    if (firstTime) {
      g.textFont(m_font);
      if (g.g instanceof PGraphics3D) g.textMode(PApplet.SCREEN);
      firstTime = false;
    }
    g.fill(c3f.x,c3f.y,c3f.z);
    //g.fill(255.0f);
    g.text(s, x, y);
  }


  public void drawPoint(Vec2 position, float f, Color3f c3f) {
    position = worldToScreen(position);
    float k_segments = 5.0f;
    float k_increment = 2.0f * (float)Math.PI / k_segments;
    float k_radius = 3.0f;
    float theta = 0.0f;
    g.fill(c3f.x, c3f.y, c3f.z);
    g.noStroke();
    g.beginShape(PApplet.POLYGON);
    for (int i = 0; i < k_segments; ++i) {
      float vx = position.x + k_radius * (float)Math.cos(theta);
      float vy = position.y + k_radius * (float)Math.sin(theta);
      g.vertex(vx, vy);
      theta += k_increment;
    }
    g.endShape();
  }

  /**
   * 	 * First image is centered on position, then
   * 	 * localScale is applied, then localOffset, and
   * lastly rotation.
   * <BR><BR>
   * Thus localOffset should be specified in world
   * units before scaling is applied.
   * For instance, if you want a MxN image to have its corner
   * at body center and be scaled by S, use a localOffset
   * of (M*S/2, N*S/2) and a localScale of S.
   * <BR><BR>
   * 
   */
  public void drawImage(PImage image, Vec2 position, float rotation, float localScale,
  Vec2 localOffset, float halfImageWidth, float halfImageHeight) {
    position = worldToScreen(position);
    localOffset = worldToScreenVector(localOffset);
    localScale *= scaleFactor;
    g.pushMatrix();
    g.translate(position.x, position.y);
    g.rotate(-rotation);
    g.translate(localOffset.x, localOffset.y);
    g.scale(localScale);
    g.image(image, -halfImageWidth, -halfImageHeight);
    g.popMatrix();
  }

  public Vec2 worldToScreenVector(Vec2 world) {
    return world.mul(scaleFactor);
  }
  public Vec2 worldToScreenVector(float x, float y) {
    return worldToScreenVector(new Vec2(x,y));
  }

}






