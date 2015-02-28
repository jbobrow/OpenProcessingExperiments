
/*

"Shiva Dances In the Red Light Bulb"

Copyright (c) 2010 Donald E. Llopis <machinezilla@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/

//import processing.opengl.*;

float center_x, center_y;
float dt;

float theta;

Shiva shiva0;
Shiva shiva1;

Shiva curShiva;
Shiva prevShiva;

final int MAX_SHIVAS = 12;
PVector [] shivaPos = new PVector[MAX_SHIVAS];

boolean pause;
int startTime;
int pauseTime;

void setup() {
  size(400, 400);

  center_x = width / 2;
  center_y = height / 2;

  dt = 0.0;
  theta = 0.0;
  
  // setup shiva positions
  shivaPos[0] = new PVector(0.0, 0.0);
  float theta = 0.0;
  for (int i=0; i<MAX_SHIVAS; i++) {    
    float x = Shiva.RING_RADIUS * cos(theta);
    float y = Shiva.RING_RADIUS * sin(theta);    
    shivaPos[i] = new PVector(x, y);
    theta += PI / 6.0;
  }

  shiva0 = new Shiva(shivaPos);
  shiva1 = new Shiva(shivaPos);  
  curShiva = shiva0;
  prevShiva = shiva1;

  pause = true;
  startTime = millis();
  pauseTime = 250;
}


void draw() {
  background(0);
  fill(255, 0, 0);
  translate(center_x, center_y);
  scale(1.0, -1.0);

  if (pause) {
    int now = millis() - startTime;
    if (now > pauseTime) {     
      pause = false;
      int n = (int) random(0, 100);
      if (n < 25) {
        initShivaTransitionToParent();
      }
      else {
        initShivaTransitionToChild((int)random(0,MAX_SHIVAS));
      }
    }
  }

  curShiva.update();
  prevShiva.update();

  if (!pause 
    && (curShiva.state == Shiva.SHIVA_HIDDEN) 
    && (prevShiva.state == Shiva.SHIVA_IDLE)) {

    // start timer again and flip shiva's
    pause = true;
    pauseTime = (int) random(10, 150);
    startTime = millis();
    Shiva tmpShiva = curShiva;
    curShiva = prevShiva;
    prevShiva = tmpShiva;
  }
}


void initShivaTransitionToParent() {
  prevShiva.setRandomId();
  prevShiva.setScaleInPos(prevShiva.startPos.x * -2.0, prevShiva.startPos.y * -2.0);
  prevShiva.resetShiva();
  prevShiva.state = Shiva.SHIVA_SCALE_IN;

  curShiva.state = Shiva.SHIVA_SCALE_OUT;
  curShiva.setScaleOutPos(prevShiva.startPos.x * 2.0, prevShiva.startPos.y * 2.0);
  curShiva.resetShiva();
}

void initShivaTransitionToChild(int childId) {  
  prevShiva.setId(childId);
  prevShiva.setScaleInPos(prevShiva.startPos.x, prevShiva.startPos.y);
  prevShiva.resetShiva();
  prevShiva.state = Shiva.SHIVA_SCALE_IN;

  curShiva.state = Shiva.SHIVA_SCALE_OUT;
  curShiva.setScaleOutPos(prevShiva.startPos.x * -2.0, prevShiva.startPos.y * -2.0);
  curShiva.resetShiva();
  curShiva.hideChildId = prevShiva.id;
}

class Shiva {

  public PVector startPos;
  public PVector scaleInPos;
  public PVector scaleOutPos;

  float tx, ty;

  float parentScale;
  final float childScale = 1.0 / 5.0;

  public int id;
  public int hideChildId;

  public static final float RING_RADIUS = 150.0;
  public static final float SHIVA_RADIUS = 50.0;

  int maxChildren;
  final float dTheta = PI / 6;
  float dt;
  
  // shiva states
  public static final int SHIVA_IDLE = 0;
  public static final int SHIVA_SCALE_IN = 1;
  public static final int SHIVA_SCALE_OUT = 2;
  public static final int SHIVA_HIDDEN = 3;

  public int state;

  public Shiva(PVector [] shivaPos) {
    maxChildren = shivaPos.length;
    id = (int) random(0, maxChildren);    
    startPos = shivaPos[id];
    tx = 0.0;
    ty = 0.0;    
    dt = 0.0;
    state = SHIVA_IDLE;
    parentScale = 1.0;
    scaleInPos = new PVector(0.0, 0.0);
    scaleOutPos = new PVector(0.0, 0.0);
    hideChildId = -1;
  }

  public void setScaleInPos(float x, float y) {
    scaleInPos.x = x;
    scaleInPos.y = y;
    tx = x;
    ty = y;
    dt = 0.0;
  }

  public void setScaleOutPos(float x, float y) {
    scaleOutPos.x = x;
    scaleOutPos.y = y;
    tx = x;
    ty = y;
    dt = 0.0;
  }

  public void setRandomId() {
    id = (int) random(0, maxChildren);
    updateStartPos();
  }

  public void setId(int id) {
    this.id = id;
    updateStartPos();
  }

  private void updateStartPos() {
    startPos = shivaPos[id];
  }

  public void resetShiva() {
    dt = 0.0;
    hideChildId = -1;
  }

  public void update() {

    switch (state) {

    case SHIVA_SCALE_IN:
      dt += 0.03;
      scaleIn();      
      break;

    case SHIVA_SCALE_OUT:
      dt += 0.025;
      scaleOut();
      break;
    }

    if (dt > 1.0) {
      dt = 0.0;
      if (state == SHIVA_SCALE_OUT) {      
        state = SHIVA_HIDDEN;
      }
      else {
        state = SHIVA_IDLE;
        hideChildId = -1;
      }
    }

    if (state != SHIVA_HIDDEN) {
      draw();
    }
  }

  void scaleIn() {
    tx = lerp(scaleInPos.x, 0.0, dt);
    ty = lerp(scaleInPos.y, 0.0, dt);
    parentScale = lerp(childScale, 1.0, dt);
  }

  void scaleOut() {
    tx = lerp(0.0, scaleOutPos.x, dt);
    ty = lerp(0.0, scaleOutPos.y, dt);
    parentScale = lerp(1.0, childScale, dt);
  }

  public void draw() {
    float theta;
    pushMatrix();   
    translate(tx, ty);
    scale(parentScale);      
    ellipse(0, 0, SHIVA_RADIUS, SHIVA_RADIUS);   

    theta = 0.0;
    for (int i=0, curId = 0; i<maxChildren; i++, curId ++) {
      pushMatrix();
      rotate(theta);
      translate(RING_RADIUS, 0.0);
      scale(childScale);
      if (hideChildId != curId) {
        ellipse(0, 0, SHIVA_RADIUS, SHIVA_RADIUS);
      }
      popMatrix();
      theta += dTheta;
    }
    popMatrix();
  }
}


