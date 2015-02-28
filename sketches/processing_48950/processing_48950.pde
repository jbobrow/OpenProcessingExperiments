
bspNode split_space (bspLeaf space) {
  int dir = (int)random(3);
  float w_amnt = space.dimensions.x/2;
  float h_amnt = space.dimensions.y/2;
  float d_amnt = space.dimensions.z/2;
  bspNode rval;
  switch (dir) {
    case 0: rval = new bspNode(new bspLeaf(space.location.x,
                                           space.location.y,
                                           space.location.z,
                                           w_amnt,
                                           space.dimensions.y,
                                           space.dimensions.z),
                               new bspLeaf(space.location.x + w_amnt,
                                           space.location.y,
                                           space.location.z,
                                           w_amnt,
                                           space.dimensions.y,
                                           space.dimensions.z));
            break;
    case 1: rval = new bspNode(new bspLeaf(space.location.x,
                                           space.location.y,
                                           space.location.z,
                                           space.dimensions.x,
                                           h_amnt,
                                           space.dimensions.z),
                               new bspLeaf(space.location.x,
                                           space.location.y + h_amnt,
                                           space.location.z,
                                           space.dimensions.x,
                                           h_amnt,
                                           space.dimensions.z));
            break;
    case 2: rval = new bspNode(new bspLeaf(space.location.x,
                                           space.location.y,
                                           space.location.z,
                                           space.dimensions.x,
                                           space.dimensions.y,
                                           d_amnt),
                               new bspLeaf(space.location.x,
                                           space.location.y,
                                           space.location.z + d_amnt,
                                           space.dimensions.x,
                                           space.dimensions.y,
                                           d_amnt));
            break;
    default: rval = null;
             break;
  }
  return rval;
}

bspNode bsp_in_space (bspLeaf space, int depth) {
  if (depth == 1) return split_space(space);
  else {
    bspNode rval = split_space(space);
    rval.leftChild  = bsp_in_space((bspLeaf)rval.leftChild,  depth-1);
    rval.rightChild = bsp_in_space((bspLeaf)rval.rightChild, depth-1);
    return rval;
  }
}

float findpt2 (float loc, float side) {
  return loc + (side/2.0);
}

float average2(float n, float m) {
    return (n+m)/2;
}

PVector draw_tree(Object tree_part) {
  if (tree_part instanceof bspLeaf) {
    bspLeaf p = (bspLeaf)tree_part;
    float dx = findpt2(p.location.x, p.dimensions.x);
    float dy = findpt2(p.location.y, p.dimensions.y);
    float dz = findpt2(p.location.z, p.dimensions.z);
    // begin draw code
    pushMatrix();
      translate(dx,dy,dz);
      fill(((abs(dx) < 20)? 20 : (abs(dx) > 255) ? 255 : dx),
           ((abs(dy) < 80)? 80 : (abs(dy) > 255) ? 255 : dy),
           ((abs(dz) < 50)? 50 : (abs(dz) > 255) ? 255 : dz),
           100);
      box(20);
    popMatrix();
    // end draw code
    return new PVector(dx,dy,dz);
  } else if (tree_part instanceof bspNode) {
    bspNode p = (bspNode)tree_part;
    PVector l = draw_tree(p.leftChild);
    PVector r = draw_tree(p.rightChild);
    float dx = average2(l.x, r.x);
    float dy = average2(l.y, r.y);
    float dz = average2(l.z, r.z);
    // begin draw code
    stroke(128);
    line(l.x, l.y, l.z, r.x, r.y, r.z);
    noStroke();
    // end draw code
    return new PVector(dx, dy, dz);
  } else {
    return new PVector(0,0,0);
  }
}

bspNode tree;
float zoom;

void setup () {
  size(400,400,P3D);
  background(200);
  tree = bsp_in_space(new bspLeaf(-400,-400,-400,800,800,800), 7);
  zoom = 0;
}

void draw () {
  lights();
  background(200);
  pushMatrix();
  translate(200,200,zoom - 200);
  rotateY(mouseX * ((PI * 2)/400));
  rotateX(mouseY * ((PI * 2)/400));
  draw_tree(tree);
  popMatrix();
}

void mouseDragged() {
  zoom = mouseY*1.5;
}

void keyPressed() {
  tree = bsp_in_space(new bspLeaf(-400,-400,-400,800,800,800), 7);
}

