
class Field {
  ArrayList pnts, orig;

  PVector pos;


  Field() {

    pnts = new ArrayList();
    orig = new ArrayList();


    for (int i = 0 ; i < width*height;i+=4) {
      pnts.add(new PVector(i%width, i/width));
      orig.add(new PVector(i%width, i/width));
    }
  }


  void draw() {

    for (int i =0 ; i < pnts.size();i++) {
      PVector pos = (PVector)pnts.get(i);
      PVector org = (PVector)orig.get(i);
      pos.x = org.x;//(org.x-pos.x)/(3.0);
      pos.y = org.y;//(org.y-pos.y)/(3.0);
    }

  stroke(0,15);

    for (int z = 0 ; z < p.size();z++) {
      Particle tmp = (Particle)p.get(z);

      float X = tmp.rpos.x;
      float Y = tmp.rpos.y;

      for (int i =0 ; i < pnts.size();i++) {
        PVector pos = (PVector)pnts.get(i);
        PVector org = (PVector)orig.get(i);
        float d = dist(X, Y, pos.x, pos.y)+1.0;
        //float d2 = dist(org.y, org.x, pos.x, pos.y)+1.0;

       // stroke(lerpColor(#000000, #003333, d/700.0), map(d, 0, width, 100, 5));

        // pos.x -= (X-pos.x)/((log(d/10.0+1.01)*(2.0)));
        // pos.y -= (Y-pos.y)/((log(d/10.0+1.01)*(2.0)));





        pos.x += (X-pos.x)/(p.size()*d/200.0);
        pos.y += (Y-pos.y)/(p.size()*d/200.0);

        if (d<100)
          point(pos.x, pos.y);
      }
    }
  }
}


