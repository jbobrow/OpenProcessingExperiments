

class Traveller {
  PVector start, dest, pos;
  int next = 0;
  ArrayList pnts;
  float speed;
  float r;
  int id;
  float frac;
  color c;

  Traveller(float _x, float _y, int _id) {
    id = _id;
    r = random(15, 30);
    start = new PVector(_x, _y);
    pos = new PVector(_x, _y);
    randomDest();
    c = color(random(127,255),random(127,255),random(127,255));
  }

  void draw() {


    fill(c, 50);
    stroke(c, 200);

    for (int i = 0 ; i < pnts.size();i++) {
      PVector tmp = (PVector)pnts.get(i);
      point(tmp.x, tmp.y);
    }
    avoid();
    ellipse(pos.x, pos.y, r, r);

    line(dest.x-r/4, dest.y, dest.x+r/4, dest.y);
    line(dest.x, dest.y-r/4, dest.x, dest.y+r/4);
    
    
    fill(c);
    text(id+1,pos.x-2,pos.y+4);
    

    move();
  }

  void move() {
    PVector n = (PVector)pnts.get(next);



    if (dist(n.x, n.y, pos.x, pos.y)<1) {
      // pnts.remove(next);
      next++;
    }

    PVector dir = new PVector(n.x-pos.x, n.y-pos.y);
    dir.normalize();
    dir.mult(SPEED);
    pos.add(dir);


    if (next>pnts.size()-1) {
      randomDest();
    }
    
    hardAvoid();
  }

  void avoid() {

    for (int i = 0 ; i < travellers.size();i++) {
      Traveller t = (Traveller)travellers.get(i);

      if (t.id!=id) {
        for (int a = 0 ; a < t.pnts.size();a++) {
          PVector p = (PVector)t.pnts.get(a);
          for (int b = 0 ; b < pnts.size();b++) {
            PVector pnt = (PVector)pnts.get(b);
            //if(abs(a-b)<10){

            float d = dist(pnt.x, pnt.y, p.x, p.y);
            if (d<r/2.0+t.r/2.0) {
              float d1 = dist(pos.x, pos.y, pnt.x, pnt.y);
              float d2 = dist(t.pos.x, t.pos.y, p.x, p.y);
              float D = abs(d2-d1);

              //if (a>next&&b>next) {
                pnt.x -= (p.x-pnt.x)/(D/2.0+10.0);
                pnt.y -= (p.y-pnt.y)/(D/2.0+10.0);
              //}
              //}
            }
          }
        }
      }
    }



    for (int a = 1 ; a < pnts.size();a++) {
      PVector one = (PVector)pnts.get(a-1);
      PVector two = (PVector)pnts.get(a);
      float x1 = one.x;
      float y1 = one.y;

      float x2 = two.x;
      float y2 = two.y;


      x1 += (one.x-two.x)/2.1;
      y1 += (one.y-two.y)/2.1;
      x2 += (two.x-one.x)/2.1;
      y2 += (two.y-one.y)/2.1;


      float d = dist(one.x, one.y, two.x, two.y);
      if (d>frac) {
        one.x += (x2-one.x)/TIGHT;
        one.y += (y2-one.y)/TIGHT;
        two.x += (x1-two.x)/TIGHT;
        two.y += (y1-two.y)/TIGHT;
      }
      else {
        one.x -= (x2-one.x)/TIGHT;
        one.y -= (y2-one.y)/TIGHT;
        two.x -= (x1-two.x)/TIGHT;
        two.y -= (y1-two.y)/TIGHT;
      }
    }


    PVector first = (PVector)pnts.get(0);
    first.x += (start.x-first.x);
    first.y += (start.y-first.y);

    PVector last = (PVector)pnts.get(pnts.size()-1);
    last.x += (dest.x-last.x);
    last.y += (dest.y-last.y);
  }
  
  void hardAvoid(){
    
   for(int i = 0 ; i < travellers.size();i++){
    Traveller tmp = (Traveller)travellers.get(i);
    if(tmp!=this){
     float d = dist(pos.x,pos.y,tmp.pos.x,tmp.pos.y);
     if(d<tmp.r/2+r/2){
      pos.x -= (tmp.pos.x-pos.x)/10.0;
      pos.y -= (tmp.pos.y-pos.y)/10.0;
     } 
    }
   } 
  }

  void randomDest() {
    start = new PVector(pos.x, pos.y);
    next = 0;
    switch(quart()) {
    case 0: 
      dest = new PVector(random(width/2, width), random(height/2, height)); 
      break;
    case 1: 
      dest = new PVector(random(0, width/2), random(height/2, height)); 
      break;
    case 2: 
      dest = new PVector(random(width/2, width), random(0, height/2)); 
      break;
    case 3: 
      dest = new PVector(random(0, width/2), random(0, height/2)); 
      break;
    }
    pnts = new ArrayList();


    frac = 1/dist(start.x, start.y, dest.x, dest.y)*res;

    for (float i = 0 ; i <= 1.0;i+=frac) {
      pnts.add(new PVector(lerp(start.x, dest.x, i), lerp(start.y, dest.y, i)));
    }
  }

  int quart() {

    // 01
    // 23

    int q = 0;

    if (start.x>width/2&&start.y<height/2)
      q = 1;

    if (start.x<width/2&&start.y>height/2)
      q = 2;

    if (start.x>width/2&&start.y>height/2)
      q = 3;

    return q;
  }
}


