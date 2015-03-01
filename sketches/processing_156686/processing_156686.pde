
ArrayList<Tenticle> tenticles = new ArrayList<Tenticle>();

/* 
 Every iteration in our loop adds the previous length of the tenticle. Then we use this number as the
 x coord so no matter what width the tenticle is, there will be no overlap.
 */
float w = 0;

void setup() {
  size(640, 640);
  noFill();
  /* We must first create a tenticle by hand because our loop will count to tenticle.size() which will equal 0. (NOT GOOD) */
  tenticles.add(new Tenticle(new PVector(0, height), (int)random(20, 110)));
  
  for (int i = 0; i < tenticles.size(); i++) {
    /* Can not calculate ahead of time how many we need. But a good estimate is fine */
    if (tenticles.size() < 20) {
      /* Get the previous tenticle object */
      Tenticle t = (Tenticle) tenticles.get(tenticles.size()-1);
      /* Next objects length */
      int nextTLen = (int)random(20, 110);
      /* 
       Previous number + (previous tenticles len or width * next tenticles length).
      
       NOTE : We divide by 2 because len is diameter. We want the radius. 
       If you don't understand see what happens without it.
       */
      w = w + (t.len + nextTLen)/2;
      /* Put "w" as our x coord and DONE! */
      tenticles.add(new Tenticle(new PVector(w, height), nextTLen));
    }
  }
}

void draw() {
  background(0);
  /* A fancy for loop that does the same thing as a usual for loop. (THE ARRAYLIST MUST BE IN THIS FORMAT) */
  for (Tenticle t : tenticles) {
    t.draw();
  }
}

class Tenticle {
  PVector loc;
  int len;

  Tenticle(PVector loc, int len) {
    this.loc = loc;
    this.len = len;
  }

  void draw() {
    /* Yuo might recognise the code as the same one as the tenticle star */
    for (int q = 0; q < len; q+=2) {
      /* The angle is to make the movement */
      float angle = cos(radians(len-q+frameCount)) * q/2;
      /* Multiply by the to create length */
      float x2 = sin(radians(angle))*(q*3);
      float y2 = cos(radians(angle))*(q*3);
      stroke(q*2, 50+q*2, q*2);
      ellipse(loc.x+x2, loc.y-y2, len-q, len-q);
    }
  }
}



