


class Gormur {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float gravity;
  float mass;
  float radius = 10;
  float stiffness = 0.4;
  float damping = 0.4;
  int classnum=0;
  
  Gormur(int c, float xpos, float ypos, float m, float g, float st) {
    x = xpos;
    y = ypos;
    mass = m;
    gravity = g;
    stiffness= st;
    classnum=c;
  }

  void update(float targetX, float targetY) {
    float forceX = (targetX - x) * stiffness;
    float ax = forceX / mass;
    vx = damping * (vx + ax);
    x += vx;
    float forceY = (targetY - y) * stiffness;
    forceY += gravity;
    float ay = forceY / mass;
    vy = damping * (vy + ay);
    y += vy;
  
  }

  void display(float nx, float ny) {
    noStroke();
    fill (127,167,193,200);
    ellipse(x, y, radius*2, radius*2);
    stroke(255);
    line(x, y, nx, ny);
 
      if (y>height/1.4){
     w=200; 
    }else if((y<height/1.4) && (y>height/1.5)) {
    w=200;
    }else if(y<height/1.5){
      w=0;
    }
 
    if (y<height/4.05){
     u=200; 
    }else if(y>height/4.05)  {
    u=0;
    }
 
 
   pushMatrix();
   stroke(236, 80);
    translate(x,0);
    fill(x*0.4,200,(x+200)/6,w);
    rect(0, height/1.5, x, height/3);
    noFill();
    pushMatrix();
      translate(0, 50);
      smyrill(classnum);
      translate(0, height/1.2);
      kyrtill(1);
    popMatrix();
    if(r==6){
    fill(x*0.4,200,(x+200)/6,u);
    rect(0, 0, segLength, height/4);
    translate(0,-280);
    smyrill(classnum);
    translate(segLength/6, 280);
    kyrtill(6);
    }
    
    popMatrix();

  }
}

