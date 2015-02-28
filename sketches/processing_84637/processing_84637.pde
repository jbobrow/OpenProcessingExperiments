
int N = 45;
int v_space = 14;
int P = 45; // edge formation probability out of 100
int bwidth = 50;
int[][] graph = new int[N][N];
// each entry of graph corresponds to a vertex with a 
// four-bit number corresponding to existence of adjacent edges in the
// order UDLR. So 5 = 1001 means that this vertex is connected to the 
// vertex above it and to the right.
int[] near_v1 = new int[2];
int[] near_v2 = new int[2];
boolean[][] visited = new boolean[N][N];

PFont f;


void graph_setup() {
  
  // initiate graph array to 0
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      graph[i][j] = 0;
    }
  }
  // set edge existence in direction of increasing index
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      // "down" edge
      if (j < N-1) {
        if (int(random(100))<P) {
          graph[i][j] = graph[i][j] | 4; // down edge
          graph[i][j+1] = graph[i][j+1] | 8; // up edge
        }
      }
      // "right" edge
      if (i < N-1) {
        if (int(random(100))<P) {
          graph[i][j] = graph[i][j] | 1; // right edge
          graph[i+1][j] = graph[i+1][j] | 2; // left edge
        }
      }
    }
  }
}

int vertex_x(int i) {
  return v_space*(i+1);
}
int vertex_y(int j) {
  return v_space*(j+1);
}

void setup() {
  size((N+1)*v_space, (N+1)*v_space+bwidth);
  stroke(0);
  background(255);
  
  f = createFont("Arial",24,true);
  textFont(f);
  
  graph_setup(); 
}

// finds the vertex (vertices) near the mouse. If there is only one 
// vertex, set it to near_v1. If there are two, set near_v1 and near_v2.
boolean near_v(int X, int Y) {
  if ((X < v_space) || (Y<v_space) ||
      (X > N*v_space) || (Y > N*v_space)){
    return false;
  }
  near_v1[0]=-1;
  near_v1[1]=-1;
  if ((X % v_space)<3 || (-X % v_space)<3) {
    near_v1[0] = round(float(X)/v_space)-1;
  }
  if ((Y % v_space)<3 || (-Y % v_space)<3) {
    near_v1[1] = round(float(Y)/v_space)-1;
  }
  // if near a unique vertex
  if ((near_v1[0]>-1) && (near_v1[1]>-1)) {
    near_v2[0] = -1;
    near_v2[1] = -1;
    return true;
  } else if (near_v1[0]>-1) { // if near an edge
    near_v2[0]=near_v1[0];
    near_v1[1]=Y/v_space-1;
    near_v2[1]=Y/v_space;
    // check for edge between them
    if ((graph[near_v1[0]][near_v1[1]] & 4) > 0) {
      return true;
    }
    return false;
  } else if (near_v1[1]>-1) {
    near_v2[1]=near_v1[1];
    near_v1[0]=X/v_space-1;
    near_v2[0]=X/v_space;
    if ((graph[near_v1[0]][near_v1[1]] & 1) > 0) {
      return true;
    }
    return false;
  } else {
    return false;
  }
}

void draw_neighbors(int i,int j) {
  if (visited[i][j]) {
    return;
  }
  
  visited[i][j]=true;
  if ((graph[i][j] & 8) > 0) {
    line(vertex_x(i),vertex_y(j),vertex_x(i),vertex_y(j-1));
    draw_neighbors(i,j-1);
  }
  if ((graph[i][j] & 4) > 0) {
    line(vertex_x(i),vertex_y(j),vertex_x(i),vertex_y(j+1));
    draw_neighbors(i,j+1);
  }
  if ((graph[i][j] & 2) > 0) {
    line(vertex_x(i),vertex_y(j),vertex_x(i-1),vertex_y(j));
    draw_neighbors(i-1,j);
  }
  if ((graph[i][j] & 1) > 0) {
    line(vertex_x(i),vertex_y(j),vertex_x(i+1),vertex_y(j));
    draw_neighbors(i+1,j);
  }
}
    

void highlight_component(int i, int j) {
  strokeWeight(5);
  stroke(255,0,0);
  
  for (int a = 0; a < N; a++) {
    for (int b = 0; b < N; b++) {
      visited[a][b] = false;
    }
  }
  
  draw_neighbors(i,j);
  
}

void draw() {
  background(255);
  strokeWeight(2);
  
  rectMode(CORNERS);
  fill(50);
  stroke(50);
  rect(0,height-bwidth,width,height);
  
  fill(255);
  textAlign(LEFT,CENTER);
  textSize(24);
  text("Edge formation probability: "+P+" out of 100.",
        20,height-bwidth/2-4);
  
  // arrow buttons
  fill(220);
  stroke(220);
  rectMode(CORNER);
  if ((mouseX>=470)&&(mouseY>=height-45)&&(mouseX<=486)&&(mouseY<=height-29)) {
    fill(170);
    stroke(170);
  }
  rect(470,height-45, 17,17);
  if ((mouseX>=470)&&(mouseY>=height-23)&&(mouseX<=486)&&(mouseY<=height-7)) {
    fill(170);
    stroke(170);
  } else {
    fill(220);
    stroke(220);
  }
  rect(470,height-23, 17,17);
  //arrows
  fill(50);
  stroke(50);
  beginShape();
  vertex(474, height-31);
  vertex(483, height-31);
  vertex(478, height-42);
  endShape(CLOSE);
  beginShape();
  vertex(474, height-21);
  vertex(483, height-21);
  vertex(478, height-10);
  endShape(CLOSE);
  
  
  // graw percolation graph
  stroke(0);
  fill(0);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      strokeWeight(3);
      if(graph[i][j]>0)
        //point(vertex_x(i),vertex_y(j));
      strokeWeight(2);
      // right edge
      if ((graph[i][j] & 1) > 0) {
        line(vertex_x(i),vertex_y(j),vertex_x(i+1),vertex_y(j));
      }
      // down edge
      if ((graph[i][j] & 4) > 0) {
        line(vertex_x(i),vertex_y(j),vertex_x(i),vertex_y(j+1));
      }
    }
  }
  
  
  // check if the mouse is near a vertex
  if (near_v(mouseX, mouseY)) {
    highlight_component(near_v1[0],near_v1[1]);
  }
  
  
  // help button
  fill(220);
  stroke(220);
  ellipseMode(CENTER);
  ellipse(width-30,height-bwidth/2,30,30);
  textAlign(CENTER,CENTER);
  stroke(50);
  fill(50);
  text("?",width-30,height-28);
  
  if (dist(mouseX,mouseY,width-30,height-25)<15) {
    fill(220);
    stroke(220);
    rectMode(CORNERS);
    rect(30,30,width-30,height-bwidth-30);
    fill(50);
    textSize(30);
    textAlign(CENTER,CENTER);
    text("Clusters in Percolation Graphs",width/2,70);
    textSize(24);
    text("by Adrian Sanborn",width/2,110);
    
    textSize(16);
    textAlign(LEFT,TOP);
    text("Here we have illustrated a problem of Bond Percolation. On this 45 by 45 graph, each edge is independently drawn with probability P and left vacant with probability 1 - P. For different values of P, what clusters of connected vertices will we find? \n\nMathematical theory tells us the striking fact that, in an infinite graph, an infinite cluster will always exist when P > 0.5 and will never exist when P < 0.5. Even in this small finite example, we observe this bifurcation distinctly as P changes by just a few hundredths. For P around 0.45, few large clusters exist, while for P around 0.55, one cluster typically encompasses almost the entire graph.\n\nClick the up and down arrows or use the UP and DOWN keys on the keyboard to change P. Click anywhere to generate a new graph with the same P. Mouse-over the graph to highlight clusters.",
    50,160,width-50,height-bwidth-50);
  }
  
  
}

void mousePressed() {
  if ((mouseX>=470)&&(mouseY>=height-45)&&(mouseX<=486)&&(mouseY<=height-29)) {
    if(P<100) P++;
    graph_setup();
  }
  if ((mouseX>=470)&&(mouseY>=height-23)&&(mouseX<=486)&&(mouseY<=height-7)) {
    if(P>0) P--;
    graph_setup();
  }
  if (mouseY<height-bwidth) {
    graph_setup();
  }
}

void keyPressed() {
  if (keyCode==UP) {
    if(P<100) P++;
    graph_setup();
  }
  if (keyCode==DOWN) {
    if(P>0) P--;
    graph_setup();
  }
}

