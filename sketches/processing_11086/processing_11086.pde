

  color col1 = color(240);
  color col2 = color(200, 50, 50);
  color col3 = color(50, 60, 130);
  color col4 = color(250, 150, 50);
  color col5 = color(0);

// -----------------------------------------------------

class cRobot {
  int nr_seg = 10;
  cSegment [] segment;
  float t0;
  float dir = 0;
  float [] dedir;
  PVector pos = new PVector(0, 0, 0);
  
  cRobot() {
    segment = new cSegment[nr_seg];
    for (int i=0; i<segment.length; i++) {
      segment[i] = new cSegment();
    }
    segment[0].testa = true;
    dedir = new float[nr_seg];
    for (int i=0; i<dedir.length; i++) {
      dedir[i] = 0;
    }
  }

  void _step(float time_) {
    t0 = time_;
    float time = time_ - int(time_);
    float timeb = time + 0.5;
    if (timeb > 1.0) timeb -= 1.0;
    
    for (int i=0; i<segment.length; i+=2) {
      segment[i]._step(time);    
      segment[i+1]._step(timeb);
    }
    
    pos.x += -120.0*de_time*cos(dir);
    pos.z +=  120.0*de_time*sin(dir);
    for (int i=dedir.length-1; i>0; i--) {
      dedir[i] = dedir[i] + de_time * (dedir[i-1] - dedir[i]);
    }
    dedir[0] = 0.5*sin(0.2*t0);
    dir += de_time*dedir[0];
  }
  
  void _draw() {
    pushMatrix();
    translate(pos.x, 29, pos.z);
    rotateY(dir);
    for (int i=0; i<segment.length; i++) {
      translate(40,0,0);
      rotateY(-dedir[i]);
      translate(40,0,0);
      segment[i]._draw();
    }
    popMatrix();
  }
}

// -----------------------------------------------------

class cSegment {
  cLeg [] leg;
  float alfa, beta;
  boolean testa = false;  
  
  cSegment() {
    leg = new cLeg[2];
    for (int i=0; i<leg.length; i++) {
      leg[i] = new cLeg();
    }    
  }

  void _step(float time_) {
    float time = time_ * 2.0;
    if (time < 1) {
      alfa = -0.3 + 0.6*time;
      beta = PI * time;
    }
    else {
      alfa =  0.3 - 0.6*(time - 1);
      beta = PI * (time - 1);
    }    
    
    time = time_;
    leg[0]._step(time);
    time += 0.5;
    if (time > 1.0) time -= 1.0;
    leg[1]._step(time);
  }
  
  void _draw() {
    pushMatrix();
    translate(0, -9*sin(beta), -9*(1-abs(sin(beta+HALF_PI))));
    rotateY(alfa);
    pushMatrix();
    cilindroX(new PVector(-25,  0,  0), 50, 10, col4);
    cilindroY(new PVector(20, 9, 0), 50, 0.5, col1);
    cilindroY(new PVector(-40, -11,  0), 22, 4, col2);
    cilindroX(new PVector(-40, -7,  0), 15, 3, col1);
    cilindroX(new PVector(-40,  7,  0), 15, 3, col1);
    cilindroX(new PVector(25,  0,  0), 15, 3, col1);
    if (testa) {
      pushMatrix();
      translate(-40, -5, 0);
      rotateY(-1.5*alfa);
      cilindroX(new PVector(-30, 10,  0), 30, 3, col1);
      sfera(new PVector(-30, 0, 0), 18, col1);
      sfera(new PVector(-38, 10, -12), 5, col5);
      sfera(new PVector(-38, 10,  12), 5, col5);
      rotateX(0.3);
      cilindroY(new PVector(-30, 0, 0), 50, 0.5, col1);
      rotateX(-0.6);
      cilindroY(new PVector(-30, 0, 0), 50, 0.5, col1);
      popMatrix();
    }
    popMatrix();
    translate(0, 0, 10);
    rotateY(-HALF_PI);
    leg[0]._draw();
    translate(-20, 0, 0);
    rotateY(PI);
    leg[1]._draw();
    popMatrix();
  }
}

// -----------------------------------------------------

class cLeg {
  float alfa;
  float beta;
  
  cLeg() {
  }
  
  void _step(float time_) {
    float time = time_ * 4.0;
    if (time < 1) {
      alfa =  0.5 + 0.3*time;
      beta = -1.8 - 0.4*time;
    }
    else if (time < 2) {
      alfa =  0.8 - 0.3*(time - 1);
      beta = -2.2 + 0.4*(time - 1);
    }
    else if (time < 3) {
      alfa =  0.5 + 0.8*(time - 2);
      beta = -1.8 + 0.5*(time - 2);
    }
    else {
      alfa =  1.3 - 0.8*(time - 3);
      beta = -1.3 - 0.5*(time - 3);
    }    
  }
  
  void _draw() {
    cilindroX(new PVector( 0,  0,   0), 20, 5, col1);
    cilindroZ(new PVector(20,  0, -15), 30, 5, col2);
    pushMatrix();
    translate(20, 0, 0);
    rotateZ(alfa);
    cilindroX(new PVector( 0,  0,  -8), 50, 3, col1);
    cilindroX(new PVector( 0,  0,   8), 50, 3, col1);
    cilindroZ(new PVector(50,  0, -15), 30, 4, col2);
    translate(50, 0, 0);
    rotateZ(beta);
    cilindroX(new PVector( 0,  0,   0), 50, 3, col1);
    cilindroY(new PVector(50, -5,   0), 15, 4, col3);
    popMatrix();
  }
}

// -----------------------------------------------------


