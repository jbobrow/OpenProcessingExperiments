
// drag and drop objects with simple physics
float groundY;
int dragging = 0;
ArrayList<DragBox> boxes = new ArrayList<DragBox>();

// init
void setup() {
  size(640,480);
  groundY = height - 20.0;
  for(int i = 0; i < 5; i++) {
    DragBox db = new DragBox();
    db.pos.x = random(width);
    db.size.y = 30 + floor(random(4.0))*30.0;
    boxes.add(db);
  }
  rectMode(CENTER);
}

// draw
void draw() {
  // bg
  background(255);
  // ground
  line(0, groundY - 20.0, width, groundY - 20.0);
  // boxes
  for(int i = 0; i < boxes.size(); i++) {
    DragBox db = boxes.get(i);
    db.dropShadow();
  }
  for(int i = boxes.size() - 1; i >= 0; i--) {
    DragBox db = boxes.get(i);
    db.update();
  }
  for(int i = 0; i < boxes.size(); i++) {
    DragBox db = boxes.get(i);
    db.draw();
  }
}

// dragbox
class DragBox {
  
  PVector pos, vel, size, offset;
  boolean dragged = false;
  
  DragBox() {
    pos = new PVector(0.0, 0.0);
    vel = new PVector(0.0, 0.0);
    size = new PVector(60.0, 60.0);
  }
  
  void update() {
    // pickup
    if(dragging == 0 && mousePressed == true) {
      PVector dif = PVector.sub(pos, new PVector(mouseX, mouseY));
      if(abs(dif.x) < size.x*0.5 && abs(dif.y) < size.y*0.5) {
        dragged = true;
        dragging = 1;
        offset = dif;
      }
    }
    if(dragged) {
      pos = new PVector(mouseX, mouseY);
      pos.add(offset);
      vel = new PVector();
      if(mousePressed == false) {
        dragging = 0;
        dragged = false;
      }
    }
    if(!dragged) {
      // fall
      vel.y += 0.2;
      // bounce
      if(pos.y > groundY - size.y*0.5) {
        pos.y = groundY - size.y*0.5;
        if(vel.y > 1.0)
          {vel.y *= -0.3;}
        else
          {vel.y = 0.0;}
      }
      // move
      pos.add(vel);
    }
  }
  
  void draw() {
    rect(pos.x, pos.y, size.x, size.y);
  }
  
  void dropShadow() {
    pushStyle();
    noStroke();
    fill(200);
    rect(pos.x, groundY, size.x+5.0, 10.0);
    popStyle();
  }
  
}
