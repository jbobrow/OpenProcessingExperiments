
class Graph {
  float[] xs;
  float[] ys;
  int l;
  boolean[][] adj;

  Graph(int n) {
    l = n;
    xs = new float[n];
    ys = new float[n];
    adj = new boolean[n][n];
  }

  int order() {
    return l;
  }

  boolean isAdjacent(int u, int v) {
    return adj[max(u%l, v%l)][min(u%l, v%l)];
  }

  void join(int u, int v) {
    adj[max(u%l, v%l)][min(u%l, v%l)] = true;
  }

  void unjoin(int u, int v) {
    adj[max(u%l, v%l)][min(u%l, v%l)] = false;
  }

  float getX(int u) {
    return xs[u%l];
  }

  float getY(int u) {
    return ys[u%l];
  }

  void setX(int u, float x) {
    xs[u%l] = x;
  }

  void setY(int u, float y) {
    ys[u%l] = y;
  }

  void display() {
    /*
    for (int i=0; i<l; i++) {
      ellipse(xs[i], ys[i], 8, 8);
      for (int j=0; j<i; j++) {
        if ((xs[i] > width + 4 && xs[j] > width + 4) || (xs[i] < -4 && xs[j] < -4) || (ys[i] > height + 4 && ys[j] > height + 4) || (ys[i] < -4 && ys[j] < -4)) {
          adj[i][j] = false;
        }
        if (adj[i][j]) {
          line(xs[i], ys[i], xs[j], ys[j]);
        }
      }
    }*/
    
    beginShape();
    for (int i=0; i<l; i++) {
      vertex(xs[i],ys[i]);
    }
    endShape();
    
    /*
    if (l>0) {
      beginShape();
      vertex(xs[0], ys[0]);
      for (int i=1; i<l-1; i++) {
        bezierVertex(xs[i-1], ys[i-1], xs[i+1], ys[i+1], 0.5*(xs[i]+xs[i+1]), 0.5*(ys[i]+ys[i+1]));
      }
      vertex(xs[l-1], ys[l-1]);
      endShape();
    }*/
    
    
  }

  Graph theta() {
    int n = 0;
    float x = 0;
    float y = 0;
    int[] is = new int[l*(l-1)/2];
    int[] js = new int[l*(l-1)/2];
    for (int i=0; i<l; i++) {
      for (int j=0; j<i; j++) {
        if (adj[i][j]) {
          is[n] = i;
          js[n] = j;
          n++;
        }
      }
    }
    Graph lineGraph = new Graph(n);
    for (int u=0; u<n; u++) {
      x = (xs[is[u]]+xs[js[u]])/2;
      y = (ys[is[u]]+ys[js[u]])/2;
      lineGraph.setX(u, x);
      lineGraph.setY(u, y);
      for (int v=0; v<u; v++) {
        if (is[u] == is[v] || js[u] == js[v] || is[u] == js[v] || js[u] == is[v]) {
          lineGraph.join(u, v);
        }
        else {
          lineGraph.unjoin(u, v);
        }
      }
    }
    return lineGraph;
  }

  Graph phi(float s) {
    float t = 1 - s/2;
    int n = 0;
    float x0 = 0;
    float y0 = 0;
    float x1 = 0;
    float y1 = 0;
    int[] is = new int[l*(l-1)/2];
    int[] js = new int[l*(l-1)/2];
    for (int i=0; i<l; i++) {
      for (int j=0; j<i; j++) {
        if (adj[i][j]) {
          is[n] = i;
          js[n] = j;
          n++;
        }
      }
    }
    Graph lineGraph = new Graph(2*n);
    for (int u=0; u<n; u++) {
      x0 = t*xs[is[u]] + (1-t)*xs[js[u]];
      y0 = t*ys[is[u]] + (1-t)*ys[js[u]];
      x1 = (1-t)*xs[is[u]] + t*xs[js[u]];
      y1 = (1-t)*ys[is[u]] + t*ys[js[u]];
      lineGraph.setX(2*u+1, x0);
      lineGraph.setY(2*u+1, y0);
      lineGraph.setX(2*u, x1);
      lineGraph.setY(2*u, y1);
      lineGraph.join(2*u+1, 2*u);
      for (int v=0; v<u; v++) {
        if (is[u] == is[v]) {
          lineGraph.join(2*u+1, 2*v+1);
        }
        if (js[u] == js[v]) {
          lineGraph.join(2*u, 2*v);
        }
        if (is[u] == js[v]) {
          lineGraph.join(2*u+1, 2*v);
        }
        if (js[u] == is[v]) {
          lineGraph.join(2*u, 2*v+1);
        }
      }
    }
    return lineGraph;
  }
}










Graph g = new Graph(10);

boolean[] dirs = new boolean[10];


boolean b = true;
float t = 0;
float targetX;
float targetY;
int c;
int d;

void setup() {
  size(500, 500);
  background(150);
  smooth();
  strokeWeight(5);
  strokeCap(ROUND);
  strokeJoin(BEVEL);
  stroke(255);
  //fill(255);
  noFill();

  t = 0;
  
  g = new Graph(10);
  
  for (int i=0; i<10; i++) {
    boolean retry = true;
    while (retry) {
      retry = false;
      g.setX(i, random(50, width-50));
      g.setY(i, random(50, height-50));
      for (int j=0; j<i; j++) {
        if (dist(g.getX(i), g.getY(i), g.getX(j), g.getY(j)) <= 50) {
          retry = true;
        }
      }
    }
    dirs[i] = random(0, 1)>0.5;
    for (int j=0; j<i; j++) {
      if (/*dist(g.getX(i), g.getY(i), g.getX(j), g.getY(j)) <= 350 && dist(g.getX(i), g.getY(i), g.getX(j), g.getY(j)) >= 10 && random(0, 1)<0.8*/ j+1 == i) {
        g.join(i, j);
      }
      else {
        g.unjoin(i, j);
      }
    }
  }
}


void draw() {
  for (int i=0; i<g.order(); i++) {
    targetX = 50;
    targetY = 50;
    c = 0;
    d = 0;
    for (int j=0; j<g.order(); j++) {
      if (g.getX(i)>g.getX(j)) {
        c++;
      }
      if (g.getX(i)<g.getX(j)) {
        c--;
      }
      if (g.getY(i)>g.getY(j)) {
        d++;
      }
      if (g.getY(i)<g.getY(j)) {
        d--;
      }
    }
    if (c > 0) {
      targetX = width - 50;
    }
    if (d >= 0) {
      targetY = height - 50;
    }
    g.setX(i, g.getX(i) + 0.01*(targetX-g.getX(i)));
    g.setY(i, g.getY(i) + 0.01*(targetY-g.getY(i)));
    /*if (dirs[i] /*i%2==0*//*) {
     g.setX(i, g.getX(i) + cos(0.01*t*TWO_PI));
     g.setY(i, g.getY(i) + sin(0.01*t*TWO_PI));
     }
    else {
     g.setX(i, g.getX(i) + sin(0.01*t*TWO_PI));
     g.setY(i, g.getY(i) + cos(0.01*t*TWO_PI));
     }*/
  }
  Graph p = g.phi(t*0.01);
  if (t >= 100) {
    for (int i=0; i<g.order(); i++) {
      dirs[i] = random(0, 1)>0.5;
    }
  }
  
  if (g.order() <= 1) {
    setup();
  }

  /*
 if (t >= 100) {
   p = g.theta();
   }
   if (t <= 0) {
   p = g.phi(0);
   }*/

  background(150);
  p.display();
  if (t < 0) {
    //b = true;
    //delay(1000);
  }
  if (t > 100) {
    //b = false;
    //delay(1000);
    t = 0;
    g = g.theta();
  }
  if (b) {
    t++;
  }
  else {
    t--;
  }



  if (keyPressed && key == ' ') {
    setup();
  }
}



