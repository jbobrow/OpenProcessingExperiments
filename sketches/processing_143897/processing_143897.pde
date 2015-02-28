
/*
*** K-Means Algorithm ***

Parameters:
max_width and max_height: best set in same relation as window-size
number of probes (samples)
distribution of probes: in clusters or randomly
number of clusters
number of ks: under "setting up the Ks"

Change max_width and max_height as needed. Best to keep in the same relation as the window-size.
Count of probes (samples) set in setup()
Probes can be distributed as clusters (number of clusters can be changes) or randomly.
The number of ks can also be modifyed:
*/

PVector[] v;
PVector[] k; 
color[] k_col;

float scale = 1;
float max_width = 1000, max_height = 600;

void setup() {
  v = new PVector[4000]; // Count of probes
  //create_probes_random();
  create_probes_clustered(10);

  // Setting up the Ks
  k = new PVector[4];
  k_col = new color[k.length];
  for (int i = 0; i < k.length; i++) {
    // Defining positions for Ks
    k[i] = new PVector((int)random(max_width), (int)random(max_height));
    // Defining colors for Ks
    k_col[i] = color((int)random(100, 255), (int)random(100, 255), (int)random(100, 255));
  }


  // Defining the scaling
  max_width = 0;
  max_height = 0;
  for (int i = 0; i < v.length; i++) {
    max_width = v[i].x > max_width ? v[i].x : max_width;
    max_height = v[i].y > max_height ? v[i].y : max_height;
  }

  size(1000, 600);  
  max_width = width / max_width;
  max_height = height / max_height;
  scale = (max_width <= max_height ? max_width : max_height);  

  frameRate(5);
}

void create_probes_random() {
  // Setting up the Points
  for (int i = 0; i < v.length; i++) {
    int x = (int)random(1, max_width-1);
    int y = (int)random(1, max_height-1);
    v[i] = new PVector(x, y, 0);
  }
}

void create_probes_clustered(int cluster_count) {
  int ratio = ceil(v.length / cluster_count);
  System.out.println("[ratio | " + ratio + "]");
  int total_count = 0;
  for (int i = 0; i < cluster_count; i++) {
    int deviation_x = round(max_width/20);
    int deviation_y = round(max_width/20);
    int center_x = (int)random(deviation_x, max_width - deviation_x);
    int center_y = (int)random(deviation_y, max_height - deviation_y);
    for (int j = 0; j < ratio; j++) {
      int x = (int)(center_x + randomGaussian()*deviation_x);
      int y = (int)(center_y + randomGaussian()*deviation_y);
      v[total_count] = new PVector(x, y, 0);
      total_count++;
    }
  }
  for (total_count=total_count; total_count < v.length; total_count++) {
    int x = (int)random(1, max_width-1);
    int y = (int)random(1, max_height-1);
    v[total_count] = new PVector(x, y, 0);
  }
}
void adapt_classes() {
  for (int j = 0; j < v.length; j++) {
    for (int i = 0; i < k.length; i++) {
      int current_class = (int)v[j].z;
      if (current_class != i) {
        // System.out.print("\n[point | " + j + "] \n [activated on class | " + i + "] ");
        v[j].z = distance(v[j], k[i]) < distance(v[j], k[current_class]) ? i : current_class;
        // System.out.print("\n [moved | " + current_class + " -> " +  (int)v[j].z + "] ");
      }
    }
  }
}

float distance(PVector v1, PVector v2) {
  float zaehler = v1.x - v2.x;
  float nenner = v1.y - v2.y;
  float distance = sqrt(zaehler * zaehler + nenner * nenner);

  distance = distance < 0 ? -distance : distance;  
  // System.out.print("\n [distance | " + zaehler + " / " + nenner + " = " + distance + "] ");
  return distance;
}


void modify_k() {
  // System.out.print("\nModifying Ks");
  for (int i = 0; i < k.length; i++) {
    k[i].x = 0;
    k[i].y = 0;
    k[i].z = 0;
  }

  for (int i = 0; i < v.length; i++) {
    int current_class = (int)v[i].z;
    k[current_class].x += v[i].x;
    k[current_class].y += v[i].y;
    k[current_class].z ++;
  }

  for (int i = 0; i < k.length; i++) {
    k[i].x = k[i].x / k[i].z;
    k[i].y = k[i].y / k[i].z;
    // System.out.print("\n [" + k[i].x + " | " + k[i].y + " | " + k[i].z + "] ");
    k[i].z = 0;
  }
}

void draw() {
  // System.out.println("\n// // // Drawing");

  fill(0);
  background(255);
  strokeWeight(0);

  // Drawing 
  
  // Points
  // System.out.print("\nClasses of Points:   ");
  for (int i = 0; i < v.length; i++) {
    int current_class = floor(v[i].z);
    // System.out.print("[" + i + " | " + current_class +  "] ");
    fill(k_col[current_class]);
    ellipse(v[i].x*scale, v[i].y*scale, 6, 6);
  }
  // System.out.print("\n");
  
  // K's
  fill(color(255, 0, 0));
  for (int i = 0; i < k.length; i++) {
    ellipse(k[i].x*scale, k[i].y*scale, 10, 10);
    text(i, k[i].x*scale+10, k[i].y*scale+5);
  }
  adapt_classes();
  modify_k();
}

