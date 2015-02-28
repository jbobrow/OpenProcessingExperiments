
// maze prototype
ArrayList<PVector> path = new ArrayList<PVector>();
ArrayList<PVector> obstacle = new ArrayList<PVector>();
ArrayList<PVector> numbers = new ArrayList<PVector>();
boolean dragging = false;
PVector zorbit = new PVector();
PVector mouse = new PVector();
PVector oldMouse = new PVector();

PImage tree;
PImage bg;
PImage zorbitimg;

int currentNum = 1;

//
void setup() {
  size(440,440);
  smooth();
  
  bg = loadImage("mazebg.png");
  tree = loadImage("tree.png");
  zorbitimg = loadImage("zorbit.png");
  
  zorbit = new PVector(220,220);
  
  for(int i = 0; i < 6; i++) {
    PVector o = new PVector(random(height), random(width));
    obstacle.add(o);
  }
  
  for(int i = 0; i < 5; i++) {
    PVector n = new PVector(random(height), random(width));
    numbers.add(n);
  }
}


//
void draw() {
  // bg
  background(100);
  image(bg,0,0);
  
  // mouse pos
  mouse = new PVector(mouseX, mouseY);
  

  
  // draw numbers
  int nums = currentNum;
  for(PVector n : numbers) {
    pushStyle();
    ellipseMode(CENTER);
    fill(255,100);
    stroke(0);
    strokeWeight(2);
    ellipse(n.x, n.y, 40.0,40.0);
    stroke(0); fill(0);
    textSize(24);
    textAlign(CENTER);
    text(str(nums),n.x,n.y+10);
    nums++;
    popStyle();
  }
  
  // draw zorbit
  pushStyle();
  ellipseMode(CENTER);
//  ellipse(zorbit.x, zorbit.y, 30.0,30.0);
  popStyle();
  image(zorbitimg, zorbit.x - zorbitimg.width/2, zorbit.y - zorbitimg.height/2);
  
  // update Zorbit
  if(path.size() > 0) {
    PVector p = path.get(0);
    PVector dir = p.get();
    dir.sub(zorbit);
    dir.normalize();
    dir.mult(1.6);
    zorbit.add(dir);
    if(zorbit.dist(p) < 5.0) path.remove(0);
  }
  // collect nums
  for(int i = numbers.size()-1; i >= 0; i--) {
    PVector n = numbers.get(i);
    if(n.dist(zorbit) < 30.0) {
      if(i==0) {
        numbers.remove(0);
        currentNum++;
      } else {
      }
    }
  }
  
  
  // draw obstacles
  for(PVector o : obstacle) {
    pushStyle();
    ellipseMode(CENTER);
    fill(0,20);
    stroke(0,0);
    strokeWeight(2);
    ellipse(o.x, o.y, 40.0,40.0);
    image(tree,o.x - tree.width/2, o.y - tree.height);
    popStyle();
  }
  
  // draw path
  pushStyle();
  noFill();
  stroke(255);
  strokeWeight(2.0);
  beginShape();
  vertex(zorbit.x, zorbit.y);
  for(PVector p : path) {
    vertex(p.x, p.y);
  }
  endShape();
  popStyle();

  // drag a path
  if(!dragging && mousePressed) {
    if(zorbit.dist(mouse) < 20.0) {
      path = new ArrayList<PVector>();
      dragging = true;
    }
  }
  if(dragging) {
    if(mouse.dist(oldMouse)>10.0) {
      path.add(new PVector(mouse.x, mouse.y));
      oldMouse = mouse.get();
    }
  }
  for(PVector o : obstacle) {
    if(mouse.dist(o) < 20.0) dragging = false;
  }
  if(!mousePressed) dragging = false;
}



