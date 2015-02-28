
class Ball {
  
  PVector pos, mov;
  int size, id;
  boolean sticky;
  int indexCell; // index of the cell this ball belongs to
  color ballColor = color(255, 255, 255);
  int lastBouncedBy;        // id of the last cell touched by this ball;
  
  Ball (int _id) {
    pos = new PVector(0, 0);
    mov = new PVector(0, 0);
    sticky = true;
    id = _id;
    size = 6;
    lastBouncedBy = id;
  }

  void setPos(float _posX, float _posY) {
    pos.set(_posX, _posY, 0);
  }
  
  void setColor(color _c) {
    ballColor = _c;
  }
  
  void updateCellIndex(int _index) {
    indexCell = _index;
  }
  
  void draw() {
    checkBallCollision(); // ball vs. ball collision
    checkGoalCollision(); // ball vs. goal collision
    update();
    fill(ballColor);
    ellipse(pos.x, pos.y, size, size);
  }  
    
  void checkBallCollision() {
    
    // vector math for circle to circle collisions & force restitution
    
    for (int i = 0; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      if (c.idCell != this.id) {
        float dist = PVector.dist(this.pos, c.ball.pos);
        if ( dist < ((this.size + c.ball.size) / 2)) { // basic collision detection
          PVector cn = PVector.sub(this.pos, c.ball.pos); // Collision Normal Vector
          float n = sqrt((cn.x * cn.x) + (cn.y * cn.y));
          cn.div(n);
          this.mov.add(cn);
          c.ball.mov.sub(cn);
        }
      }
    }
  }
  
  void checkGoalCollision() {
    for (int i = 0; i < cells.size(); i++) {
      Cell c = (Cell) cells.get(i);
      float dist = PVector.dist(this.pos, c.pos);
      if ( ( dist < ((this.size + c.size) / 2)) && (!sticky) ) { // basic collision detection
        c.scoreMinus();
        c.modifyColor(ballColor);
        setSticky();
        for (int j = 0; j < cells.size(); j++) { // point goes to last cell that hit the ball
          Cell cc = (Cell) cells.get(j);
          if (cc.idCell == lastBouncedBy) cc.scorePlus();
        }
      }
    }
  }

  void update() {
    if (sticky) {
      Cell c = (Cell) cells.get(indexCell);
      pos.set( c.getStickyBallPos().x, c.getStickyBallPos().y, 0);
    } else {
      pos.add(mov);
    }
    
    /* uncomment for looping over screen boundaries
    if (pos.x < 0) pos.x = width;   // loop left to right
    if (pos.x > width) pos.x = 0;   // loop right to left
    if (pos.y < 0) pos.y = height;  // loop top to bottom
    if (pos.y > height) pos.y = 0;  // loop bottom to top */
    
    // screen boundaries bouncing 
    // *2, / 2 to avoid balls stucked in constant inversion of movement  
    if (pos.y < size * 2) mov.y = -mov.y;        // top bounce
    if (pos.y > height - (size / 2) ) mov.y = -mov.y; // bottom bounce
    if (pos.x < size * 2) mov.x = -mov.x;        // left bounce
    if (pos.x > width - (size / 2) ) mov.x = -mov.x;  // right bounce     
    
  }

  void stickRelease() {
    sticky = false;
    Cell c = (Cell) cells.get(indexCell);
    mov.set( ( ( (c.getStickyBallPos().x - c.pos.x) / c.size) * 3),
             ( ( (c.getStickyBallPos().y - c.pos.y) / c.size) * 3), 0);
  }
  
  void setSticky() {
    sticky = true;
  }
  
  // when a collision is detected in Paddle, bounce(...) will apply new forces
  // to the ball movement vector
  void bounce (Cell cell, PVector tip1, PVector tip2) {
    PVector n = new PVector(tip2.x - tip1.x, tip2.y - tip1.y);
    n.set( -n.y, n.x, 0);
    n.normalize();
    float dotVec = mov.dot(n) * 2;
    n.mult(dotVec);
    PVector mvn = new PVector(mov.x - n.x, mov.y - n.y);
    mov.set(mvn.x, mvn.y, 0);
    cell.addMove(new PVector (-mvn.x, -mvn.y, 0)); // send back forces to the cell 
  }
  
}

