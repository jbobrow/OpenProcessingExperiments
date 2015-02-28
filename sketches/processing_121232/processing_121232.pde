
// center point
float centerX1 = 0, centerY1 = 0;
public float centerX2 = 0, centerY2 = 0;

float radius = 45, rotAngle = -90;
float springing = .0009, damping = .98;

// soft-body dynamics
float organicConstant1 = 1;
float organicConstant2 = 1;

//mouseclicked
float vx[] = new float[3];
float vy[] = new float[3];
float v_max, v_min;

float a = random(-8);

//17760
ArrayList particules; 
int compteur = 0;

//Day13
float R = 23;
ArrayList<Circle> circles;

void setup() {
  size(640, 640);
  //center shape in window
  centerX1 = width/2;
  centerY1 = height/2;
  noStroke();
  smooth();
  //17760
  colorMode(HSB);
  particules = new ArrayList();
  //Day13
  circles = new ArrayList<Circle>();
}

void draw() {
  //fade background
  fill(#2D2D46, 100);
  rect(0,0,width, height);
  
  //mouseclicked
  v_max = 50;
  v_min = -50;
  for (int i=0; i<3; i++){
    // random velocity
    vx[i] = random(v_min, v_max);
    vy[i] = random(v_min, v_max);
  }

 //Day13
 for (int i=0; i<circles.size(); i++) {
    circles.get(i).render();
    circles.get(i).move();
  }
  for (int i=0; i<circles.size(); i++ ) {
    if (circles.get(i).isStale()) {
      circles.remove(i);
      i--;
    }
  }
}
//Day13
void mouseClicked() {
  if (mouseButton==LEFT) {
    circles.add(new Circle(mouseX, mouseY, R));
  }
  if (mouseButton==RIGHT) {
    for (int i=0;i<circles.size();i++) {
      circles.get(i).toggleGravity();
    }
  }
}




// define the Circle class
class Circle {
  //Shape1
  int nodes = 6;
  float accelX1, accelY1;
  // class data/variables
  float centerX1, centerY1;
  float pCenterX1, pCenterY1;
  float vx, vy, ax, ay;
  float radius, elasticity;
  float v_max, v_min;
  boolean gravity;
  //Shape1corner nodes
  float nodeStartX[] = new float[nodes];
  float nodeStartY[] = new float[nodes];
  float[]nodeX = new float[nodes];
  float[]nodeY = new float[nodes];
  float[]angle = new float[nodes];
  float[]frequency = new float[nodes];
  //Particule
  float hue;

  // Constructor, builds the object when it is declared.
  Circle(float x, float y, float r) {
    v_max = 10;
    v_min = -10;
    centerX1 = x;
    centerY1 = y;
    // random velocity
    vx = random(v_min, v_max);
    vy = random(v_min, v_max);
    ax = 0;
    ay = 0.3;
    radius = r;
    // 1 is a perfectly elastic collision, no energy lost
    // 0.9 means about 10% of the velocity in the direction of the collision is lost
    elasticity = 0.9;
    gravity = true;
    //Particule
    hue = random(0,256);
  }

  void render() {
    /*    for (int i=0; i<nodes; i++){
      frequency[i] = random(5, 6);
    }*/
      
    //  calculate node  starting locations
    for (int i=0; i<nodes; i++){
      nodeStartX[i] = centerX1+cos(radians(rotAngle))*radius;
      nodeStartY[i] = centerY1+sin(radians(rotAngle))*radius;
      rotAngle += 360.0/nodes;
    }
    //Particule
    hue = (hue + 1) % 256;
    if (gravity) {
      fill(hue,100,255);
    }
    else {
      fill(255,20);
    }
    // draw polygon
    curveTightness(organicConstant1);
    beginShape();
    for (int i=0; i<nodes; i++){
      curveVertex(nodeX[i], nodeY[i]);
    }
    for (int i=0; i<nodes-1; i++){
      curveVertex(nodeX[i], nodeY[i]);
    }
     endShape(CLOSE);
  }

  // update the position according to Newtonian motion
  void move() {
    //move center point
      float deltaX = centerX1;
      float deltaY = centerY1;
    if (gravity) {
        vx += ax;
        vy += ay;
    }
    
    // create springing effect
    deltaX *= springing;
    deltaY *= springing;
    accelX1 += deltaX;
    accelY1 += deltaY;

    // slow down springing
    accelX1 *= damping;
    accelY1 *= damping;
  
    // change curve tightness
    organicConstant1 = 1-((abs(accelX1)+abs(accelY1))*.1);
  
    //move nodes
    for (int i=0; i<nodes; i++){
      nodeX[i] = nodeStartX[i]+sin(radians(angle[i]))*(accelX1*2);
      nodeY[i] = nodeStartY[i]+sin(radians(angle[i]))*(accelY1*2);
      //angle[i]+=frequency[i];
      }
    //kokomadeShape1
    
    centerX1 += vx;  // syntactically equivalent to x = x+vx
    centerY1 += vy;
    // top wall collision
    if (centerY1<radius) {
      centerY1 = 2*radius - centerY1;
      vy = -vy*elasticity;
    }

    // bottom wall collision
    if (centerY1>height-radius) {
      centerY1 = 2*(height-radius) - centerY1;
      vy = -vy*elasticity;
    }

    // left wall collision
    if (centerX1<radius) {
      centerX1 = 2*radius - centerX1;
      vx = -vx*elasticity;
    }

    // right wall collision
    if (centerX1>width-radius) {
      centerX1 = 2*(width-radius) - centerX1;
      vx = -vx*elasticity;
    }
  }

  // return true if the circle is off the bottom of the 
  // screen, false otherwise
  boolean isStale() {
    return (centerY1 > height + radius);
  }

  // toggle the gravity, turn gravity on and off
  void toggleGravity() {
    gravity = !gravity;
  }
  
  
}




