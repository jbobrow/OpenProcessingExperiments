
import processing.opengl.*;
import javax.media.opengl.*;

PGraphics tex;
List<Agent> agents;
long time;
int groundArea = 1000;
int agentArea = 700;
int agentNumber = 300;

// for boid theory
int DIST_THRESHOLD1 = 10;
int DIST_THRESHOLD2 = 20;
int DIST_THRESHOLD3 = 30;
float FACTOR_COHESION = 100;
float FACTOR_SEPARATION = 10;
float FACTOR_ALINGMENT = 10;
float VELOCITY_LIMIT = 3;
float TRAIL_SCALE = 2;
float rCohesion = 1.0; // pull to center of agent
float rSeparation = 0.8; // avoid bunching up
float rAlignment = 0.1; // match average agent speed

void setup(){
  size(800, 600, OPENGL);
  tex = createTexture();
  
  agents = new ArrayList<Agent>();
  for(int i = 0; i < agentNumber; ++i){
    float x = random(-agentArea, agentArea);
    float z = random(-agentArea, agentArea);
    agents.add(new Agent(new PVector(x, 0, z)));
  }  
}

void draw(){
  background(0);
  
  // camera setting
  float angle = 0.05f * radians(time);
  camera(800, -200, 0,
         0, 0, 0,
         0, 1, 0);
  rotateY(angle);

  pushStyle();
  
  // enable additive synthesis
  PGraphicsOpenGL pgl = (PGraphicsOpenGL)g;
  GL gl = pgl.beginGL();
  gl.glDisable(GL.GL_DEPTH_TEST);
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);
  pgl.endGL();
  
  // draw agents
  noStroke();
  fill(0);
  for(int i = 0; i < agents.size(); ++i){
    agents.get(i).update();
  }
  
  popStyle();
  
  // draw ground and axis
  pushStyle();
  stroke(255, 255, 255, 100);
  for(int x = -groundArea; x <= groundArea; x += groundArea/10)
    line(x, 0, -groundArea, x, 0, groundArea);
  for(int z = -groundArea; z <= groundArea; z += groundArea/10)
    line(-groundArea, 0, z, groundArea, 0, z);
  
  popStyle();
  
  time++;
}

PGraphics createTexture(){
  PGraphics tex = createGraphics(100, 100, P2D);
  float r = tex.width * 2 / 3;
  
  tex.beginDraw();
  tex.background(0);
  tex.noStroke();
  tex.fill(100, 255, 150);
  tex.ellipse(tex.width/2, tex.height/2, r, r);
  tex.filter(BLUR, 10.0);
  tex.endDraw();
  return tex;
}

class Agent{
  private final float TERRITORY_SIZE = 2000;
  private final float NOISE_SCALE = 0.001f;
  private final float AGENT_SIZE = random(50);
  
  private PVector center;
  private PVector offset;
  private PVector pos;
  
  private long elapse;
  float xOffset, zOffset; // for noise injection
  
  PVector vCohesion;
  PVector vSeparation;
  PVector vAlignment;
  PVector velocity;
  
  Agent(PVector center){
    this.center = center;
    pos = new PVector();
    offset = new PVector();
    xOffset = random(TERRITORY_SIZE);
    zOffset = random(TERRITORY_SIZE);
    vCohesion = new PVector();
    vSeparation = new PVector();
    vAlignment = new PVector();
    velocity = new PVector();
  }
  
  PVector getPos(){
    return pos;
  }
  
  PVector getVelocity(){
    return velocity;
  }
  
  void update(){
    // redraw agent
    // apply boid theory
    vCohesion.x = vCohesion.y = vSeparation.x = vSeparation.y = vAlignment.x = vAlignment.y = 0;

    /**
     *  Boid Theory
     *  1. Cohesion: distance itself from objects -> close to others
     *  2. Separation: too close to objects -> keep it away from each other
     *  3. Alignment: run parallel to others
     **/
    cohesion();
    separation();
    alignment();
    
    velocity.x += rCohesion * vCohesion.x + rSeparation * vSeparation.x + rAlignment * vAlignment.x;
    velocity.z += rCohesion * vCohesion.z + rSeparation * vSeparation.z + rAlignment * vAlignment.z;
    
    limitVelocity();
    
    // tercel_method (use perlin noise) + boid theory
    elapse++;
    offset.x = (noise((elapse + xOffset + velocity.x) * NOISE_SCALE) -0.5f) * TERRITORY_SIZE;
    offset.z = (noise((elapse + zOffset + velocity.z) * NOISE_SCALE) -0.5f) * TERRITORY_SIZE;
    
    pushMatrix();
    pos.set(center.x + offset.x, center.y - AGENT_SIZE + 0.5, center.z + offset.z);
    translate(pos.x, pos.y, pos.z);
    
    // billboarding  
    PMatrix3D billboardMat = (PMatrix3D)g.getMatrix();
    // set unit matrix as rotation factor
    billboardMat.m00 = billboardMat.m11 = billboardMat.m22 = 1;
    billboardMat.m01 = billboardMat.m02 = 
    billboardMat.m10 = billboardMat.m12 = 
    billboardMat.m20 = billboardMat.m21 = 0;
  
    resetMatrix();
    applyMatrix(billboardMat);
    
    beginShape(QUADS);
    texture(tex);
    vertex(-0.5f * AGENT_SIZE, -AGENT_SIZE, 0, 0, 0);
    vertex(-0.5f * AGENT_SIZE, 0, 0, 0, tex.height-1);
    vertex(0.5f * AGENT_SIZE, 0, 0, tex.width, tex.height-1);
    vertex(0.5f * AGENT_SIZE, -AGENT_SIZE, 0, tex.width, 0);
    endShape();
    
    popMatrix();
  }

  void limitVelocity(){
    float velocitySize = sqrt(sq(velocity.x) + sq(velocity.z));
    if(velocitySize > VELOCITY_LIMIT){
      velocity.x = (velocity.x/velocitySize)*VELOCITY_LIMIT;
      velocity.z = (velocity.z/velocitySize)*VELOCITY_LIMIT;
    }
  }
  
  void cohesion(){
    float len = 0;
    int count = 0;
    
    for(int i=0; i < agentNumber; ++i){
      Agent a = agents.get(i);
      if(this != a){
        len = dist(this.pos.x, this.pos.z, a.getPos().x, a.getPos().z);
        if(len > DIST_THRESHOLD2 && len < DIST_THRESHOLD3){
          vCohesion.x += a.getPos().x;
          vCohesion.z += a.getPos().z;
          count++;
        }
      }
    }
    
    if(count > 0){
      vCohesion.x /= count;
      vCohesion.z /= count;
      vCohesion.x = (vCohesion.x - this.pos.x) / FACTOR_COHESION;
      vCohesion.z = (vCohesion.z - this.pos.z) / FACTOR_COHESION;
    }
  }
  
  void separation(){
    float len = 0;
    
    for(int i=0; i < agentNumber; ++i){
      Agent a = agents.get(i);
      if(this != a){
        len = dist(this.pos.x, this.pos.z, a.getPos().x, a.getPos().z);
        if(len < DIST_THRESHOLD1){
          vSeparation.x -= (a.getPos().x - this.pos.x)/FACTOR_SEPARATION;
          vSeparation.z -= (a.getPos().z - this.pos.z)/FACTOR_SEPARATION;
        }
      }
    }
  }

  void alignment(){
    float len = 0;
    int count = 0;
    
    for(int i=0; i < agentNumber; ++i){
      Agent a = agents.get(i);
      if(this != a){
        len = dist(this.pos.x, this.pos.z, a.getPos().x, a.getPos().z);
        if(len > DIST_THRESHOLD1 && len < DIST_THRESHOLD2){
          vAlignment.x += a.getVelocity().x;
          vAlignment.z += a.getVelocity().z;
          count++;
        }
      }
    }
  
    if(count > 0){
      vAlignment.x /= count;
      vAlignment.z /= count;
      vAlignment.x = (vAlignment.x - velocity.x)/FACTOR_ALINGMENT;
      vAlignment.z = (vAlignment.z - velocity.z)/FACTOR_ALINGMENT;
    }
  }
}

