
float y = 0;
Head head;
Eyes[] eye;
Pupil[] pupil;
Tongue tongue;
Body body;
Leg[] leg;
Lotus lotus;

float var1 = random(-100, 100);  //  variation
float var2 = random(-100, 100);
float var3 = random(-100, 100);

float my = 4;
float size = 100;

float dist = 0;
boolean isclick = false;
boolean isjump = false;

float jumpx = 0, jumpy = 0, jumpz = 0;



void setup() {
  size(1500, 1200, P3D);
  frameRate(15);


  eye = new Eyes[2];
  pupil = new Pupil[2];
  leg = new Leg[4];
  

  head = new Head(0, 0, 0, size);
  eye[0] = new Eyes(-65, 50, -70, 30);
  eye[1] = new Eyes(35, 50, -75, 30); 
  pupil[0] = new Pupil(-70, 50, -90, 12);
  pupil[1] = new Pupil(30, 50, -95, 12);
  body = new Body(0, 60, 0, 80, 11, 1);  
  
  
  
  leg[0] = new Leg(120, -60, 100, 30, 10, 0.7, -210); 
  leg[1] = new Leg(-120, -60, 100, 30, 10, 0.7, 210); 
  leg[2] = new Leg(-40, 0, 100, 30, 12, 0.5, 0); 
  leg[3] = new Leg(40, 0, 100, 30, 12, 0.5, 0); 
  
  
  lotus = new Lotus(0, 0, -90, 60, 10, 2, 2);

  
  

  patch = new PVector[RESOLUTION][RESOLUTION][RESOLUTION];
  for (int i=0; i< RESOLUTION; i++) {
    for (int j=0; j< RESOLUTION; j++) {
      for (int k=0; k< RESOLUTION; k++) {

        patch[i][j][k] = new PVector();
      }
    }
  }


  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle();
  }
}


void draw() {
  background(#83B2D1);
  lights();
  stroke(255);
  strokeWeight(2);
  translate(width/2, height/2, 0);
  rotateX(PI);

  rotateY(radians(mouseX)/2);
  //rotateX(radians(-1.5));
  float inc1 = map(noise(var1), 0, 1, 1, 1.2);
  float inc2 = 1;//map(noise(var2), 0, 1, 0.8, 1.2);
  float inc3 = 1; //map(noise(var3), 0, 1, 0.8, 1.2);




  head.render(inc1, inc2, inc3, my);
  eye[0].render(inc1, inc2, inc3, my);
  eye[1].render(inc1, inc2, inc3, my);
  pupil[0].render(inc1, inc2, inc3, my);
  pupil[1].render(inc1, inc2, inc3, my);
  body.render();
  
  for (int i=0; i<4; i++){
  leg[i].render();
  }
  
  lotus.render(inc1);
  
  head.jump();
  
  
  
  
  var1 ++;
  var2 --;
  var3 += 1.3;

  


  if (isclick == true) {
    if (dist < 900) {
      dist += 150;
    } else if (dist >= 900) {
      isclick = false;
    }
  }

  if (isclick == false) {

    dist -= 200;

    if (dist <0) dist = 0;
  }

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



  tongue = new Tongue(-20, 10, 0, -dist, 8, 0.2);
  tongue.render();


  
  
  
  


  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


  
  pushMatrix();
  translate(0,-50,0);
  // design a patch
  PVector lBottom = new PVector(-width/2 - 300, -200, -1000); // left bottom
  PVector mBottom = new PVector(100, -110, -1300); // middle bottom
  PVector rBottom = new PVector(width/2 + 600, -200, -900); // right bottom
  PVector lMiddle = new PVector(-width/2 - 200, -120, 200); // left middle
  PVector mMiddle = new PVector(300, -120, -100); // middle middle
  //PVector mMiddle = new PVector(mouseX, mouseY, 100); // middle middle
  PVector rMiddle = new PVector(width/2 + 100, -120, 400); // right middle
  PVector lTop = new PVector(-width/2 - 700, -200, 900); // left top
  PVector mTop = new PVector(50, -130, 1000); // middle top
  PVector rTop = new PVector(width/2 + 400, -200, 1500); // right top
  fill(125, 180, 245);
  createPatch(patch, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop);
  renderPatch(patch);
  popMatrix();


  pushMatrix();
  translate(0,-100,0);
  PVector lBottom2 = new PVector(-width/2 - 10000, -120, -10000); // left bottom
  PVector mBottom2 = new PVector(0, -120, -10000); // middle bottom
  PVector rBottom2 = new PVector(width/2 + 10000, -120, -10000); // right bottom
  PVector lMiddle2 = new PVector(-width/2 - 10000, -130, 0); // left middle
  PVector mMiddle2 = new PVector(0, -130, 0); // middle middle
  //PVector mMiddle = new PVector(mouseX, mouseY, 100); // middle middle
  PVector rMiddle2 = new PVector(width/2 + 10000, -130, 0); // right middle
  PVector lTop2 = new PVector(-width/2 - 10000, -140, 10000); // left top
  PVector mTop2 = new PVector(0, -140, 10000); // middle top
  PVector rTop2 = new PVector(width/2 + 10000, -140, 10000); // right top
  fill(151, 250, 125);
  createPatch(patch, lBottom2, mBottom2, rBottom2, lMiddle2, mMiddle2, rMiddle2, lTop2, mTop2, rTop2);
  renderPatch(patch);
  popMatrix();
  

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



  for (int i=0; i<particles.length; i++) particles[i].draw();
  for (int i=0; i<particles.length; i++) particles[i].update();
}

void mousePressed() {
  isclick = true;

  println(isclick);
}


void keyPressed(){
  isjump = true;
  
}
class Body
{
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
  float lay;
  float degX = 0;
  float t=1;
 
  Body(float xpos, float ypos, float zpos, float zSize, float layer, float sSize)
  {
    xf=xpos;
    yf=ypos;
    zf=zpos;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;
 
    sl=sSize;
  }
 
  void render(){
 
    
    noStroke();
    
    fill(150, 210, 50);
 
    pushMatrix();
    rotateX(radians(degX));
    rotateX(PI/2);
    
    translate(0, 0, 0 - jumpy);
    
    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=1) {
        float theta = radians(deg);
        r= (-(i-lay+3)*(i-lay+3)+50)*sl;
        x = xf + r * 2 * cos(theta);  
        y = yf + r * 2 * sin(theta);
        z = zf + hmd * i * 1.8;   
        vertex(x, y, z);
 
        r= (-(i-lay+4)*(i-lay+4)+50)*sl;
        x = xf+r*2*cos(theta);
        y = yf+r*2*sin(theta); 
        z = zf + hmd * (i+1) * 1.8;
        
        if (i<lay-1)
        {
          vertex(x, y, z);
        } 
      }   
      endShape();
    }
 
    popMatrix();
  }
 
 void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    }
    
    else if (isjump == false){
     if (jumpy <= 0){
      isjump = false;
      jumpy = 0;
     } 
      if (jumpy > 0){
       jumpy -= 20; 
      }
    }
  }
  
}
class Eyes {

  float delta = 10;  // point density
  float radius;  // slime Eyes radius
  float xp, yp, zp;    // slime's x, y, z position



  Eyes (float xpos, float ypos, float zpos, float r) {

    xp = xpos;
    yp = ypos;
    zp = zpos;
    radius = r;
  }



  void render(float inc1, float inc2, float inc3, float my) {
    inc1 = inc1*10;
    inc2 = inc2*10;
    inc3 = inc3*10;
    pushMatrix();
    translate(xp + inc1, yp + inc2 + jumpy, zp + inc3);
    rotateY(8);

    noStroke();
    fill(0);
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 360; deg +=delta) {
        if (deg >= 180 && deg <= 360) {
          fill(255, 249, 242);
          float theta = radians(deg);

          float x = radius * sin(phi)*cos(theta);
          float y = radius * sin(phi)*sin(theta);
          float z = radius * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta);
          y = radius * sin(phi2)*sin(theta);
          z = radius * cos(phi2);

          vertex(x, y, z);
        } else {
          fill(150, 220, 80);  
          float theta = radians(deg);

          float x = radius * sin(phi)*cos(theta);
          float y = radius * sin(phi)*sin(theta);
          float z = radius * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta);
          y = radius * sin(phi2)*sin(theta);
          z = radius * cos(phi2);

          vertex(x, y, z);
        }
      }
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    }
    
    else if (isjump == false){
     if (jumpy <= 0){
      isjump = false;
      jumpy = 0;
     } 
      if (jumpy > 0){
       jumpy -= 20; 
      }
    }
  }
  
}

Particle[] particles = new Particle[300];
  


class Particle {
  float x, y;   
  float vx,vy;
  float timer;  
  float dt = 2;
  float g = 1;
  float r = 5; 
  boolean on=false;
    
  Particle() { }
  
 
  void initialize()
  {
    on = true;
    x = random(-width - 3000, width + 3000);
    y = random(900,950);
    vy = random(0,1);
    vx=0;
    timer = 255;
    dt = random(0.1,5);
  }
    
  void draw()
  {
    if(!on) return;
    fill(64,timer); stroke(255,timer);
    for (int i = 0; i <= 10; i ++) {
      
      pushMatrix();
      translate(i,0,random(-3000,3000));
      line(x,y,x,y+60);
      popMatrix();
      
    }
    
  }
    
  void update()
  {
     
    if(!on) { if(random(0,1) < 0.5) initialize(); return; }
      
    timer -= dt;  
      
     
    vy -= g;
    y += vy;
      
     
    
     
    if (timer < 0) {
      on = false;
    }
  }
    
 
}
class Tongue
{
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
  float lay;
  float degX = 0;
  float t=1;
 
  Tongue(float xpos, float ypos, float zpos, float zSize, float layer, float sSize)
  {
    xf=xpos;
    yf=ypos;
    zf=zpos;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;
 
    sl=sSize;
  }
 
  void render(){
 
    
    noStroke();
    
    fill(220, 100, 120);
 
    pushMatrix();
    translate(0,jumpy,0);
    rotateX(radians(degX));
    rotateZ(PI/2);
    
    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=1) {
        float theta = radians(deg);
        r= (-(i-lay+3)*(i-lay+3)+50)*sl;
        x = xf + r * cos(theta);  
        y = yf + r * 2 * sin(theta);
        z = zf + hmd * i * 1.3;   
        vertex(x, y, z);
 
        r= (-(i-lay+4)*(i-lay+4)+50)*sl;
        x = xf+r*cos(theta);
        y = yf+r*2*sin(theta); 
        z = zf + hmd * (i+1) * 1.3;
        
        if (i<lay-1)
        {
          vertex(x, y, z);
        }
      }   
      endShape();
    }
 
    popMatrix();
  }
  
  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    }
    
    else if (isjump == false){
     if (jumpy <= 0){
      isjump = false;
      jumpy = 0;
     } 
      if (jumpy > 0){
       jumpy -= 20; 
      }
    }
  }
 
  
}
class Head {

  float delta = 1.5;  // point density
  float radius;  // slime radius
  float xp, yp, zp;    // slime's x, y, z position


  Head (float xpos, float ypos, float zpos, float r) {

    xp = xpos;
    yp = ypos;
    zp = zpos;
    radius = r;
  }


  void render(float inc1, float inc2, float inc3, float my) {
    pushMatrix();
    translate(xp, yp + jumpy, zp);
    rotateY(8);

    noStroke();
    fill(150, 220, 50);
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 360; deg +=delta) {
        if (deg >= 320 && deg <= 360) {
          
          fill(252, 230, 207);

          float theta = radians(deg);
          float x = radius * sin(phi)*cos(theta* inc1);
          float y = radius * sin(phi)*sin(theta* inc2);
          float z = radius * inc3 * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta* inc1);
          y = radius * sin(phi2)*sin(theta* inc2);
          z = radius * inc3 * cos(phi2);

          vertex(x, y, z);
        } else {
          fill(150, 220, 50);
          
          float theta = radians(deg);
          float x = radius * sin(phi)*cos(theta* inc1);
          float y = radius * sin(phi)*sin(theta* inc2);
          float z = radius * inc3 * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta* inc1);
          y = radius * sin(phi2)*sin(theta* inc2);
          z = radius * inc3 * cos(phi2);

          vertex(x, y, z);
        }
      }
    }
    endShape(CLOSE);
    popMatrix();
  }

  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    }
    
    else if (isjump == false){
     if (jumpy <= 0){
      isjump = false;
      jumpy = 0;
     } 
      if (jumpy > 0){
       jumpy -= 20; 
      }
    }
  }
}
class Leg{
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
  float lay;
  float degX = 0;
  float t=1;
  float radian=0;
 
  Leg(float xpos, float ypos, float zpos, float zSize, float layer, float sSize, float radius)
  {
    xf=xpos;
    yf=ypos;
    zf=zpos;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;
    sl=sSize;
    
    radian = radius;
  }
 
  void render(){
 
    
    noStroke();
    
    fill(150, 210, 50);
 
    pushMatrix();
    rotateX(radians(degX));
    rotateX(PI/2);
    rotateZ(radians(radian));
    
    translate(0, 0, 0 - jumpy);
    
    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=1) {
        float theta = radians(deg);
        r= (-(i-lay+3)*(i-lay+3)+50)*sl;
        x = xf + r * 1 * cos(theta);  
        y = yf + r * 1.5 * sin(theta);
        z = zf + (hmd) * i;   
        vertex(x, y, z);
 
        r= (-(i-lay+4)*(i-lay+4)+50)*sl;
        x = xf + r * 1 * cos(theta);
        y = yf + r * 1.5 * sin(theta); 
        z = zf + (hmd) * (i+5);
        
        if (i<lay-1)
        {
          vertex(x, y, z);
        } 
      }   
      endShape();
    }
 
    popMatrix();
  }
 
 void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    }
    
    else if (isjump == false){
     if (jumpy <= 0){
      isjump = false;
      jumpy = 0;
     } 
      if (jumpy > 0){
       jumpy -= 20; 
      }
    }
  }
  
}
class Lotus {
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
  float lay;
  float degX = 0;
  float t=1;
  float ls=0;

  Lotus(float xpos, float ypos, float zpos, float zSize, float layer, float sSize, float lSize)
  {
    xf=xpos;
    yf=ypos;
    zf=zpos;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;

    sl=sSize;
    
    ls = lSize;
    
    
  }

  void render(float inc1) {


    noStroke();

    fill(150, 210, 50);

    pushMatrix();
    rotateX(radians(degX));
    rotateX(PI/2);

    translate(0, 0, 0 - jumpy);

    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=1) {
        if (deg >= 0 && deg <= 320) {
          float theta = radians(deg);
          r= (-(i-lay+3)*(i-lay+3)+50)*sl;
          x = xf + r * ls * cos(theta);  
          y = yf + r * ls * sin(theta);
          z = zf + (hmd-7) * i * 3 * inc1;   
          vertex(x, y, z);

          r= (-(i-lay+4)*(i-lay+4)+50)*sl;
          x = xf + r * ls * cos(theta);
          y = yf + r * ls * sin(theta); 
          z = zf + (hmd-7) * (i+1) * 3 * inc1;

          if (i<lay-1)
          {
            vertex(x, y, z);
          }
        }
      }
      endShape();
    }

    popMatrix();
  }

  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    } else if (isjump == false) {
      if (jumpy <= 0) {
        isjump = false;
        jumpy = 0;
      } 
      if (jumpy > 0) {
        jumpy -= 20;
      }
    }
  }
}
PVector[][][] patch;
int RESOLUTION = 30; // patch resolution
float x = 1;


float bernstein(float p1, float p2, float p3, float t) {
  // quadratic bernstein interpolation
  float result= p1*(1-t)*(1-t) + p2*2*(1-t)*t + p3*t*t;
  return result;
}



PVector uv(int x, int y, int z) {
  // convert (x,y) in range 0 ~ (RESOLUTION-1) to (u,v) in 0~1 scale
  float u = (float)x / (RESOLUTION-1);
  float v = (float)y / (RESOLUTION-1);
  float q = (float)z / (RESOLUTION-1);
  PVector uv = new PVector(u, v, q);
  return uv;
}





PVector getPosInBezierPatch(PVector uv, PVector lBottom, PVector mBottom, PVector rBottom, 
PVector lMiddle, PVector mMiddle, PVector rMiddle, 
PVector lTop, PVector mTop, PVector rTop) {
  // return actural (x,y) that corresponds to (u,v) in a patch defined
  // by (leftBottom, rightBottom, leftTop, rightTop)
  float u = uv.x;
  float v = uv.y;
  //float q = uv.z;
  PVector pos = new PVector();
  float u1 = bernstein(lBottom.x, mBottom.x, rBottom.x, u);
  float u2 = bernstein(lMiddle.x, mMiddle.x, rMiddle.x, u);
  float u3 = bernstein(lTop.x, mTop.x, rTop.x, u);
  pos.x = bernstein(u1, u2, u3, v);
  u1 = bernstein(lBottom.y, mBottom.y, rBottom.y, u);
  u2 = bernstein(lMiddle.y, mMiddle.y, rMiddle.y, u);
  u3 = bernstein(lTop.y, mTop.y, rTop.y, u);
  pos.y = bernstein(u1, u2, u3, v);
  u1 = bernstein(lBottom.z, mBottom.z, rBottom.z, u);
  u2 = bernstein(lMiddle.z, mMiddle.z, rMiddle.z, u);
  u3 = bernstein(lTop.z, mTop.z, rTop.z, u);
  pos.z = bernstein(u1, u2, u3, v);
  return pos;
}



void createPatch(PVector[][][] patch, PVector lBottom, PVector mBottom, PVector rBottom, 
PVector lMiddle, PVector mMiddle, PVector rMiddle, 
PVector lTop, PVector mTop, PVector rTop) {
  for (int iz=0; iz<RESOLUTION; iz++) {
    for (int iy=0; iy<RESOLUTION; iy++) {
      for (int ix=0; ix<RESOLUTION; ix++) {
        PVector uv = uv(ix, iy, iz);
        PVector pos = getPosInBezierPatch(uv, lBottom, mBottom, rBottom, lMiddle, mMiddle, rMiddle, lTop, mTop, rTop);
        patch[iy][ix][iz].x = pos.x;
        patch[iy][ix][iz].y = pos.y;
        patch[iy][ix][iz].z = pos.z;
      }
    }
  }
}



void renderPatch(PVector[][][] patch) {
  //fill(255, 0, 0);
  noStroke();
  for (int iz=0; iz<RESOLUTION-1; iz++) {
    beginShape(QUAD_STRIP); // try POINTS
    for (int iy=0; iy<RESOLUTION; iy++) {

      for (int ix=0; ix<RESOLUTION; ix++) {
        
        vertex(patch[iz][iy][ix].x, patch[iz][iy][ix].y, patch[iz][iy][ix].z);
        vertex(patch[iz+1][iy][ix].x, patch[iz+1][iy][ix].y, patch[iz+1][iy][iz].z);
      }
    }
    endShape();
  }
}
class Pupil {

  float delta = 10;  // point density
  float radius;  // slime Eyes radius
  float xp, yp, zp;    // slime's x, y, z position



  Pupil (float xpos, float ypos, float zpos, float r) {

    xp = xpos;
    yp = ypos;
    zp = zpos;
    radius = r;
  }



  void render(float inc1, float inc2, float inc3, float my) {
    inc1 = inc1*10;
    inc2 = inc2*10;
    inc3 = inc3*10;
    pushMatrix();
    translate(xp + inc1, yp + inc2 + jumpy, zp + inc3);
    rotateY(8);

    noStroke();
    fill(0);
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 360; deg +=delta) {
        if (deg >= 180 && deg <= 360) {
          fill(10);
          float theta = radians(deg);

          float x = radius * sin(phi)*cos(theta);
          float y = radius * sin(phi)*sin(theta);
          float z = radius * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta);
          y = radius * sin(phi2)*sin(theta);
          z = radius * cos(phi2);

          vertex(x, y, z);
        }
      }
    }
    endShape(CLOSE);
    popMatrix();
  }


  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    } else if (isjump == false) {
      if (jumpy <= 0) {
        isjump = false;
        jumpy = 0;
      } 
      if (jumpy > 0) {
        jumpy -= 20;
      }
    }
  }
}


