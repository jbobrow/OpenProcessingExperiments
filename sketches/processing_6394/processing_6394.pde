

Lightning lightning;
boolean kaboom = false;
float startx,starty;
PGraphics ground;

public void setup() {
  size(512, 512, P3D);
  lightning = new Lightning();
  ground = createGraphics(width,height,P2D);
  ground.smooth();
  clearGround();
}

void draw() {
  background(0,0,32);
  if (kaboom) {
    ambientLight(220,220,220);
  } 
  else {
    ambientLight(196,196,196);
  }
  translate(width/2,height/2,-width/2);
  rotateX(-PI/4);

  // the "infinite" plane
  pushMatrix();
  translate(0,height/2,0);
  fill(255,196,64);
  box(2000,10,1000);
  popMatrix();

  rotateY(map(mouseX,0,width,-PI,PI));

  // the canvas..
  pushMatrix();
  translate(0,height/2,0);
  fill(0,0,32);
  box(width,100,height);
  translate(0,-51,0);
  fill(255);
  drawGround();
  popMatrix();

  // the lightning
  pushMatrix();
  translate(startx,-height/2,starty);
  lightning.draw();
  if (kaboom) {
    lightning.grow(10);
    if (random(lightning.root.energy)> 400) {
      lightning.clear();
      kaboom = false;
    }
  }
  popMatrix();
}

void clearGround() {
  ground.beginDraw();
  ground.background(255,128,0);
  ground.endDraw();
}

void drawGround() {
  noStroke();
  beginShape();
  texture(ground);
  vertex(-width/2,0,-height/2,0,0);
  vertex(width/2,0,-height/2,width,0);
  vertex(width/2,0,height/2,width,height);
  vertex(-width/2,0,height/2,0,height);
  endShape(CLOSE);
}

void drawGroundStrike(float x, float y, int energy) {
  ground.beginDraw();
  ground.noStroke();
  ground.fill(energy,energy-128,0,128-energy);
  ground.ellipse(width/2+startx+x, height/2+starty+y, energy>>1, energy>>1);
  ground.endDraw();
}


void keyPressed() {
  if (key == ' ') {
    clearGround();
  }
}

void mousePressed() {
  startx = random(-width/2,width/2);
  starty = random(-width/2,height/2);
  kaboom = true;
}

// the lightning is a structure made of segments
class Lightning {
  Segment root;

  public Lightning() {
    root = new Segment();
  }

  void clear() {
    root.energy = 0;
    root.nextSegments.clear();
  }

  // the "energy" that we add to the structure is the number of segments
  // that are added randomly
  void grow(int energy){
    growSegment(root,energy);
  }

  // we traverse the structure and distribute the energy in the segments.
  void growSegment(Segment segment,int energy) {
    segment.energy += energy;
    if (segment.energy == energy) {
      makeSegment(segment,energy);
    } 
    else {
      int branches = segment.nextSegments.size();
      for (int i=0; i<branches; i++) {
        int branchEnergy = (i == branches-1) ? energy : (int)(random(1)*energy);
        growSegment((Segment)segment.nextSegments.get(i),branchEnergy);
        energy -= branchEnergy;
      }
    }
  }

  // we make segments keeping the rotation and energy.
  // the energy represents the total number of childs of that part of the tree.
  void makeSegment(Segment previousSegment, int energy) {
    if (energy>0) {
      energy -= 1;
      Segment s = new Segment();
      previousSegment.nextSegments.add(s);
      s.energy = energy;
      int branches = random(1) > 0.07 ? 1 : 2;
      for (int i=0; i<branches; i++) {
        s.vAngle = random(-PI/2,PI/2);
        s.hAngle = random(0,TWO_PI);
        int branchEnergy = (i == branches-1) ? energy : (int)(random(1)*energy);
        makeSegment(s,branchEnergy);
        energy -= branchEnergy;
      }
    }
  }

  void draw() {
    stroke(255,255,128);
    drawSegment(root, 0,0,0);
    noStroke();
  }

  void drawSegment(Segment segment, float x, float y, float z) {
    strokeWeight(max(min(segment.energy,4),1));
    for (int i=0; i<segment.nextSegments.size(); i++) {
      float nextx = x + 10 * cos(segment.hAngle) * sin(segment.vAngle);
      float nextz = z + 10 * sin(segment.hAngle) * sin(segment.vAngle);
      float nexty = y + 10 * cos(segment.vAngle);
      if (y<height) {
        line(x,y,z,nextx,nexty,nextz);
      } 
      else {
        drawGroundStrike(x,z,segment.energy);
      }
      drawSegment((Segment)segment.nextSegments.get(i),nextx,nexty,nextz);
    }
  }

}

// each segment keeps a list of childs and rotation information
class Segment {
  ArrayList nextSegments = new ArrayList();
  float hAngle;
  float vAngle;
  int energy;
}



