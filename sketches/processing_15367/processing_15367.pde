
class Box extends Particle {
  boolean exploded;
  ParticleSystem fragments;  
  int boxType;
  int w;
  int h;
  
  // l = location, t = box type
  Box(PVector l, int t) {
    super(l);
    vel.z = random(2, 4);
    timer = 600;
    exploded = false;
    boxType = t;
        
    w = round(map(boxTypeImages[boxType].width, 0,200, 0, 50));   
    h = round(map(boxTypeImages[boxType].height, 0,200, 0, 50));   
  }

  void explode() {
    exploded = true;

    int columns = 4;
    int rows = 3;
    
    fragments = new ParticleSystem();
    // make fragments. Loop columns
    
    PImage boxImg = boxTypeImages[boxType];   
    float cellw = boxImg.width / columns;
    float cellh = boxImg.height/ rows;
    
    for ( int i = 0; i < columns; i++) {
      // Begin loop for rows        
      for ( int j = 0; j < rows; j++) {
        PImage imgData;   
        float x, y;
        Fragment p;
        PVector l;
        
        x = i*cellw;  // x position
        y = j*cellh;  // y position        

        imgData = boxImg.get(floor(x), floor(y), floor(cellw), floor(cellh));        
        l = loc.get();
        //l.x += random(-10,10);
        //l.y += random(-10,10);
        l.x += (cellw/3 * i) - (w/2);
        l.y += (cellh/3 * j) - (h/2);
        p = new Fragment(l, imgData);
        p.vel.set(new PVector((l.x-loc.x)*random(0.05,0.3), (l.y-loc.y)*random(0.05,0.3), random(-1,1)));
        fragments.addParticle(p);
      }
    }
  }

  // Method to display
  void render() {
    if (exploded) {
      fragments.run();
    }
    else {

      noStroke();
      translate(loc.x, loc.y, loc.z);    
            
        /* // text
        textFont(fontA, 12);
        textAlign(CENTER);
        fill(255);
        textMode(MODEL);
        String labeltxt = boxTypes[boxType];
        text(labeltxt, 0, 5, 10);
        */
        imageMode(CENTER);
        image(boxTypeImages[boxType], 0, 0, w, h);

      translate(-loc.x, -loc.y, -loc.z);
    }    
  }
}



