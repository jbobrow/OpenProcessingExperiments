
int colorism = 0;
boolean running = true;

void setup() {
  size(200, 200);
  colorMode(HSB);
  background(random(255), 255, 255);
  fill(255);
}



void draw() {
  if (running) {
    background(colorism, 255, 255);

    colorism++;
    if (colorism > 255) {
      colorism = 0;
    }
    String[] art = {
      "this", "that", "one", "the"
    };
    String[] nou = {
      "forest", "tree", "flower", "sky", "grass", "mountain", "hare", "home", "sun", "moon", "dwarf", 
      "fairy", "bear", "magician", "ant", "ocean"
    };
    String[] adj = {
      "happy", "rotating", "red", "fast", "elastic", "smily", "unbelievable", "infinite", 
      "intelligent", "shy", "broken", "awesome", "bitter", "embellished", "emotional", "enchanted", 
      "energetic", "enlightened", "gorgeous", "graceful", "glorious", "glossy", "glum", "golden"
    };
    String[] ver = {
      "runs", "is thinking", "was flying", "observes", "is looking", "lies", "admires", "is shining"
    };
    String[] pre = {
      "above", "inside", "behind", "in front of", "under", "towards", "on"
    };

    int n = int(random(4)); 
    int m = int(random(24));
    int o = int(random(16)); 
    int p = int(random(8));
    int q = int(random(7)); 
    int r = int(random(4)); 
    int s = int(random(24));
    int t = int(random(16)); 


    text(art[n], 10, 20);
    text(adj[m], 10, 35);
    text(nou[o], 10, 50);
    text(ver[p], 10, 65);
    text(pre[q], 10, 80);
    text(art[r], 10, 95);
    text(adj[s], 10, 110);
    text(nou[t], 10, 125);
  }
}

void mousePressed() {
  running = false;
}  



