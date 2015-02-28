
final float TIMESTEP               = 0.001f;
final float THRUSTFACTOR           = 3;
final boolean CHASESETUP           = true;
final int SPAWN_AREA_R             = 100;

final int MAX_NUM_UNITS            = 20;
final int UNIT_LENGTH              = 4;
final int OBSTACLE_RADIUS_FACTOR   = 8;
final int OBSTACLE_RADIUS          = OBSTACLE_RADIUS_FACTOR * UNIT_LENGTH;
final int COLLISION_VISIBILITY_FACTOR = 25;

final int WIDEVIEW_RADIUS_FACTOR    = 200;
final int NARROWVIEW_RADIUS_FACTOR  = 50;
final int LIMITEDVIEW_RADIUS_FACTOR = 30;

final int SEPARATION_FACTOR         = 5;
final int BACK_VIEW_ANGLE_FACTOR    = 1;
final int FRONT_VIEW_ANGLE_FACTOR   = 1;

final int NUM_OBSTACLES             = 8;

final float rho = 0.0023769f;         // 地上の空気密度 slugs/ft^3
final float tol = 0.000000000000001f; // 許容誤差

RigidBody2D[] units;
PVector       target;
PVector[]     obstacles;

boolean initialize() {
  obstacles = new PVector[NUM_OBSTACLES];
  
  units = new RigidBody2D[MAX_NUM_UNITS];
  
  for(int i = 0; i < MAX_NUM_UNITS; i++) {
    units[i] = new RigidBody2D();
    
    units[i].mass = 10;
    units[i].inertia = 10;
    units[i].inertiaInverse = 1 / 10;
    units[i].position.x = random(width / 2 - SPAWN_AREA_R, width / 2 + SPAWN_AREA_R);
    units[i].position.y = random(height / 2 - SPAWN_AREA_R, height / 2 - SPAWN_AREA_R);
    units[i].width = UNIT_LENGTH / 2;
    units[i].length = UNIT_LENGTH;
    units[i].height = UNIT_LENGTH;
    units[i].orientation = random(TWO_PI);
    units[i].cd.y  = -0.12f * units[i].length; units[i].cd.x  =  0.0f;                   // 回転中心座標
    units[i].ct.y  = -0.50f * units[i].length; units[i].ct.x  =  0.0f;                   // 推進ベクトル
    units[i].cpt.y =  0.5f  * units[i].length; units[i].cpt.x = -0.5f + units[i].width;  // 左舷操舵ベクトル
    units[i].cst.y =  0.5f  * units[i].length; units[i].cst.x =  0.5f + units[i].width;  // 右舷操舵ベクトル
    
    units[i].projectedArea = (units[i].length + units[i].width) * units[i].height;
    
    units[i].leader = false;
    
    if(i > MAX_NUM_UNITS / 2) {
      units[i].interceptor = true;
      units[i].thrustForce = THRUSTFORCE * 1.5f;
    } else {
      units[i].interceptor = false;
      units[i].thrustForce = THRUSTFORCE;
    }
  }
  
  for(int i = 0; i < NUM_OBSTACLES; i++) {
    obstacles[i] = new PVector();
    
    obstacles[i].x = random(OBSTACLE_RADIUS * 4, width  - OBSTACLE_RADIUS * 4);
    obstacles[i].y = random(OBSTACLE_RADIUS * 4, height - OBSTACLE_RADIUS * 4);
  }
  return true;  
}

void doUnitAI(int i) {
  PVector pave = new PVector();  // 平均位置ベクトル
  PVector vave = new PVector();  // 平均速度ベクトル
  PVector fs   = new PVector();  // 最終操舵力
  PVector pfs  = new PVector();  // fsの適用位置
  PVector d    = new PVector();
  PVector u    = new PVector();
  PVector v    = new PVector();
  PVector w    = new PVector();
  double  m    = 0;
  int     nf;
  boolean inView;
  boolean doFlock = wideView | limitedView | narrowView;
  int     radiusFactor = 0;
  
  int n = 0;
  pfs.y = units[i].length / 2.0f;
  nf    = 0;
  
  for(int j = 1; j < MAX_NUM_UNITS; j++) {
    if(i != j) {
      inView = false;
      d = PVector.sub(units[j].position, units[i].position);
      w = rotate2D(-units[i].orientation, d);
      
      if(((w.y > 0) && (abs(w.x) < abs(w.y) * FRONT_VIEW_ANGLE_FACTOR))) 
        if(d.mag() <= (units[i].length * NARROWVIEW_RADIUS_FACTOR))
          nf++;
      
      if(wideView) {
        inView = ((w.y > 0) || ((w.y < 0) && (abs(w.x) > abs(w.y) * BACK_VIEW_ANGLE_FACTOR)));
        radiusFactor = WIDEVIEW_RADIUS_FACTOR;
      }
      
      if(limitedView) {
        inView = (w.y > 0);
        radiusFactor = LIMITEDVIEW_RADIUS_FACTOR;
      }
      
      if(narrowView) {
        inView = (((w.y > 0) && (abs(w.x) < abs(w.y) * FRONT_VIEW_ANGLE_FACTOR)));
        radiusFactor = NARROWVIEW_RADIUS_FACTOR;
      }
      
      if(inView && (units[i].interceptor == units[j].interceptor)) {
        if(d.mag() <= (units[i].length * radiusFactor)) {
          pave.add(units[j].position);
          vave.add(units[j].velocity);
          n++;
        }
      }
      
      if(inView) {
        if(d.mag() <= (units[i].length * SEPARATION_FACTOR)) {
          if(w.x < 0) m =  1;
          if(w.x > 0) m = -1;
          
          fs.x += m * STEERINGFORCE * (units[i].length * SEPARATION_FACTOR) / d.mag();
        }
      }
    }
  }
  
  // Cohesion Rule:
  if(doFlock && (n > 0)) {
    pave.div(n);
    v.set(units[i].velocity.x, units[i].velocity.y, units[i].velocity.z);
    v.normalize();
    u = PVector.sub(pave, units[i].position);
    u.normalize();
    w = rotate2D(-units[i].orientation, u);
    if(w.x < 0) m = -1;
    if(w.x > 0) m =  1;
    if(abs(v.dot(u)) < 1.0f) 
      fs.x += m * STEERINGFORCE * acos(v.dot(u)) / PI;
  }
  
  // Alignment Rule:
  if(doFlock && (n > 0)) {
    vave.div(n);
    u.set(vave.x, vave.y, vave.z);
    u.normalize();
    v.set(units[i].velocity.x, units[i].velocity.y, units[i].velocity.z);
    v.normalize();
    w = rotate2D(-units[i].orientation, u);
    if(w.x < 0) m = -1;
    if(w.x > 0) m =  1;
    if(abs(v.dot(u)) < 1.0f) 
      fs.x += m * STEERINGFORCE * acos(v.dot(u)) / PI;
  }

  // 追跡 if the unit is a leader
  if(chase) {
    if(nf == 0)
      units[i].leader = true;
    else
      units[i].leader = false;
    
    if((units[i].leader || !doFlock)) {
      if(!units[i].interceptor) {
        // Chase
        u.set(units[0].position.x, units[0].position.y, units[0].position.z);
        d = PVector.sub(u, units[i].position);
        w = rotate2D(-units[i].orientation, d);
        if(w.x < 0) m = -1;
        if(w.x > 0) m =  1;
        fs.x += m * STEERINGFORCE;
      } else {
        // Intercept
        PVector s1, s2, s12;
        float   tClose;
        PVector vr12;
        
        vr12 = PVector.sub(units[0].velocity, units[i].velocity);
        s12  = PVector.sub(units[0].position, units[i].position);
        tClose = s12.mag() / vr12.mag();
        
        s1 = PVector.add(units[0].position, PVector.mult(units[0].velocity, tClose));
        target = s1;
        s2 = PVector.sub(s1, units[i].position);
        w = rotate2D(-units[i].orientation, s2);
        if(w.x < 0) m = -1;
        if(w.x > 0) m =  1;
        fs.x += m * STEERINGFORCE;
      }
    }
  }
  
  // 衝突回避
  PVector a, p, b;
  for(int j = 0; j < NUM_OBSTACLES; j++) {
    u.set(units[i].velocity.x, units[i].velocity.y, units[i].velocity.z);
    u.normalize();
    v = PVector.mult(u, COLLISION_VISIBILITY_FACTOR * units[i].length);
    
    a = PVector.sub(obstacles[j], units[i].position);
    p = PVector.mult(u, a.dot(u));
    b = PVector.sub(p, a);
    
    if((b.mag() < OBSTACLE_RADIUS) && (p.mag() < v.mag())) {
      w = rotate2D(-units[i].orientation, a);
      w.normalize();
      if(w.x < 0) m =  1;
      if(w.x > 0) m = -1;
      fs.x += m * STEERINGFORCE * (COLLISION_VISIBILITY_FACTOR * units[i].length) / a.mag();
    }
  }
  
  units[i].fa = fs;
  units[i].pa = pfs;
}

void updateSimulation() {
  float dt = TIMESTEP;
  
  units[0].setThrusters(false, false, 1);

  if(keyPressed && key == CODED) {
    if(keyCode == RIGHT)
      units[0].setThrusters(true, false, 0.5f);
    if(keyCode == LEFT)
      units[0].setThrusters(false, true, 0.5f);
  }
  
  for(int c = 0; c < 60; c++) {
    units[0].updateBodyEuler(dt);
    
    if(units[0].position.x > width)  units[0].position.x = 0;
    if(units[0].position.x < 0)      units[0].position.x = width;
    if(units[0].position.y > height) units[0].position.y = 0;
    if(units[0].position.y < 0)      units[0].position.y = height;
    
    for(int i = 1; i < MAX_NUM_UNITS; i++) {
      doUnitAI(i);
      units[i].updateBodyEuler(dt);
  
      if(units[i].position.x > width)  units[i].position.x = 0;
      if(units[i].position.x < 0)      units[i].position.x = width;
      if(units[i].position.y > height) units[i].position.y = 0;
      if(units[i].position.y < 0)      units[i].position.y = height;    
    }
  }
  
  drawCraft(units[0], 0xFF00FF00);
  for(int i = 1; i < MAX_NUM_UNITS; i++) {
    if(units[i].leader)
      drawCraft(units[i], 0xFFFF0000);
    else {
      if(units[i].interceptor)
        drawCraft(units[i], 0xFFFF00FF);
      else
        drawCraft(units[i], 0xFF0000FF);
    }
  }
  
  drawObstacles();
}

void drawCraft(RigidBody2D craft, int clr) {
  PVector[] vList = new PVector[5];
  
  float wd = craft.width;
  float lg = craft.length;
  vList[0] = new PVector( wd / 2,  lg / 2);
  vList[1] = new PVector( wd / 2, -lg / 2);
  vList[2] = new PVector(-wd / 2, -lg / 2);
  vList[3] = new PVector(-wd / 2,  lg / 2);
  vList[4] = new PVector(      0,  lg / 2 * 1.5f);
  
  for(int i = 0; i < 5; i++) {
    PVector v1 = rotate2D(craft.orientation, vList[i]);
    vList[i] = PVector.add(v1, craft.position);
  }
  
  pushStyle();
  stroke(clr);
  strokeWeight(2);
  line(vList[0].x, vList[0].y, vList[1].x, vList[1].y);
  line(vList[1].x, vList[1].y, vList[2].x, vList[2].y);
  line(vList[2].x, vList[2].y, vList[3].x, vList[3].y);
  line(vList[3].x, vList[3].y, vList[4].x, vList[4].y);
  line(vList[4].x, vList[4].y, vList[0].x, vList[0].y);
  popStyle();
  
}

void drawObstacles() {
  stroke(255);
  for(int i = 0; i < NUM_OBSTACLES; i++) {
    ellipse(obstacles[i].x, obstacles[i].y, OBSTACLE_RADIUS, OBSTACLE_RADIUS);
  }
}

