
int[][]connect_ary;
float min_dist;
float cur_dist;
int rx;
int ry;
int rwidth;
int rheight;
int generating;
int savecount;

void setup() {
  
  background(0);
  size(240, 240);
  stroke(150);
  strokeWeight(5);
  strokeCap(ROUND);
  smooth();
  noFill();
  
  generating = 24;
  generate();
  
}

void draw() {
  
  if (generating>0) {
    generate();
    generating--;
  }
  
  noStroke();
  fill(255,0,0);
  rx=width-30;
  ry=height-30;
  rwidth=20;
  rheight=20;
  if (mouseX>rx&&mouseX<rx+rwidth&&mouseY>ry&&mouseY<ry+rheight)
    fill(255,0,0);
  else
    fill(150);
  rect(rx, ry, rwidth, rheight);
    
}

void generate() {
  background(0);
  connect_ary = new int[0][2];
  Node[] node_ary = new Node[int(random(3,7))];
  Node closestnode = new Node(0,0);
  
  for (int i=0; i<node_ary.length; i++) {
    node_ary[i] = new Node(random(10, width-10),random(10,height-10));
  }

  for (int i=0; i<node_ary.length; i++) {
    min_dist = dist(0,0,width,height);
    for (int j=0; j<node_ary.length; j++) {
      if (i!=j && !areConnected(j,i)) {
        cur_dist = dist(node_ary[i].x, node_ary[i].y, node_ary[j].x, node_ary[j].y);
        if (cur_dist < min_dist) {
          min_dist = cur_dist;
          closestnode.x = node_ary[j].x;
          closestnode.y = node_ary[j].y;
          setConnected(i, j);   
        }
      }
    }
    stroke(150);
    noFill();
    bezier(node_ary[i].x, node_ary[i].y, 
    node_ary[i].x + random(-50, 50), node_ary[i].y + random(-50,50), 
    closestnode.x + random(-10, 10), closestnode.y + random(-10,10), 
    closestnode.x, closestnode.y); 
  }
  
}

void setConnected(int i, int j) {
    int[] connection = {i, j};
    connect_ary = (int[][]) append(connect_ary, connection);
}

boolean areConnected(int j, int i) {
  for (int[] element: connect_ary) {
    if (element[0]==j && element[1]==i)
      return true;
  }
  return false;
}

void printArray(int[][] a)
{
  for (int[] element: a) {
    for (int element2: element)
      print(element2);
    print("\n");
  }
}

void keyPressed() {
  if (key == TAB) {
    savecount++;
    save("landmark_" + savecount+ ".jpg");
  }
}

void mousePressed() {
  if (mouseX>rx&&mouseX<rx+rwidth&&mouseY>ry&&mouseY<ry+rheight) {
    generating = 24;
    generate();
  }
}

class Node{
  float x;
  float y;
  Node(float x, float y) {
    this.x = x;
    this.y = y;
  }
}

