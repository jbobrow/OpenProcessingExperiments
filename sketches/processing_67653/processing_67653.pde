
// Which Face Is Which
// Daniel Shiffman
// April 25, 2011
// http://www.shiffman.net

class Face {
  
  // A Rectangle
  Rectangle r;
  
  // Am I available to be matched?
  boolean available;
  
  // Should I be deleted?
  boolean delete;
  
  // How long should I live if I have disappeared?
  int timer = 16;
  
  // Assign a number to each face
  int id;
  
  int hu;
  
  // Make me
  Face(int x, int y, int w, int h) {
   // noStroke();
    r = new Rectangle(x,y,w,h);
    available = true;
    delete = false;
    id = faceCount;
    faceCount++;
    hu=int(random(360));
  }

  // Show me
  void display() {
    noStroke();
    fill(hu,65,55);
    //stroke(0,0,255);
    ellipse(r.x*scl+((r.width*scl)/2), r.y*scl+((r.height*scl)/2), r.width*scl, r.height*scl);
   // fill(255,timer*2);
    
    //text(""+id,r.x*scl+10,r.y*scl+30);
  }

  // Give me a new location / size
  // Oooh, it would be nice to lerp here!
  void update(Rectangle newR) {
    noStroke();
    r = (Rectangle) newR.clone();
  }

  // Count me down, I am gone
  void countDown() {
    timer--;
  }

  // I am deed, delete me
  boolean dead() {
    if (timer < 0) return true;
    return false;
  }
}


