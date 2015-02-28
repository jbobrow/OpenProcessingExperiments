
class Car extends Vec2D {
  Vec3D currNormal = Vec3D.Y_AXIS.copy();
  Vec3D pos;
  IsectData3D isec;

  float currTheta;
  float targetTheta;
  float targetSpeed;
  float speed;
  float x2D, y2D;

  public Car(float x, float y) {
    super(x, y);
    pos = new Vec3D(0, 500, 0);
  }

  public void accelerate(float a) {
    targetSpeed += a;
    targetSpeed = MathUtils.clip(targetSpeed, -20, 20);
  }
  public void draw() {
    // create an axis aligned box and convert to mesh
    TriangleMesh box = new AABB(new Vec3D(), new Vec3D(20, 10, 10)).toMesh();
    // align to terrain normal
    box.pointTowards(currNormal);
    // rotate into direction of movement
    box.rotateAroundAxis(currNormal, currTheta);
    // move to correct position
    box.translate(pos);
    // and draw
    fill(255, 0, 0);
    gfx.mesh(box);
  }
  public void steer(float t) {
    targetTheta += t;
  }
  public void update() {
    // slowly decay target speed
    targetSpeed *= 0.992f;
    // interpolate steering & speed
    currTheta += (targetTheta - currTheta) * 0.1f;
    speed += (targetSpeed - speed) * 0.1f;
    // update position
    addSelf(Vec2D.fromTheta(currTheta).scaleSelf(speed));
    // constrain position to terrain size in XZ plane
    AABB b = mesh.getBoundingBox();
    constrain(new Rect(b.getMin().to2DXZ(), b.getMax().to2DXZ()).scale(0.99f));
    // compute intersection point on terrain surface
    isec = terrain.intersectAtPoint(x, y);
    // println(isec);
    if(isec.isIntersection) {
      // smoothly update normal
      currNormal.interpolateToSelf(isec.normal, 0.25f);
      // move bot slightly above terrain
      Vec3D newPos = isec.pos.add(0, 10, 0);
      pos.interpolateToSelf(newPos, 0.25f);
    }
    x2D = (((x + b.getMax().to2DXZ().x) / (2 * b.getMax().to2DXZ().x)) * 100);
    y2D = (((y + b.getMax().to2DXZ().y) / (2 * b.getMax().to2DXZ().y)) * 100);
  }
}



