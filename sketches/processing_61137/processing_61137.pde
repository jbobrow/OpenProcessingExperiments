
// piece of lightning

class Bolt extends Node {
  int gen;    //generation
  float len;  //length of the piece

  Bolt(int gen) {
    this.gen=gen;
    len = random(50, 200) + gen*2;

    // avoid infinite recursion and having the matrix stack getting too big (pushMatrix is only allowed 32 times)
    if (gen < 7) {
      createChildren();
    }
  }

  void draw(PGraphics b, PGraphics g) {

    // if there are children, apply their transformations and have them draw themselves
    if (children != null) {
      for (int i = 0; i < children.length; i++) {
        b.pushMatrix();
        g.pushMatrix();

        b.applyMatrix(children[i].trf);
        g.applyMatrix(children[i].trf);

        children[i].draw(b, g);

        b.popMatrix();
        g.popMatrix();
      }
    }

    //draw a rectangle with a gradient as the lightning piece
    for (int i = 3; i > 0; i--) {
      b.fill(mainHue, 1 - i/3., 1);//, 100+gen*2-i*4);
      b.noStroke();
      b.rect(-i/0.5, 0, i*4+0.2, len);
    }

    //draw an opaque gray line over the lightning in the glow buffer
    g.noStroke();
    g.fill(mainHue, 0.6, 0.7+gen/40.);
    g.rect(-20-gen, 0, 40+gen*2, len);
    g.ellipse(0, 0, 40+gen/4, 40+gen/4);
  }

  void createChildren() {

    // create a single piece at a sharp angle at the end of this piece
    if (random(0.0, 1.0) < 0.9) {
      children = new Bolt[1];
      children[0] = new Bolt(gen+1);
      children[0].trf.translate(0, len);
      if (random(0.0, 1.0) < 0.5) {
        children[0].trf.rotate(random(0.5, 1.2));
      } 
      else {
        children[0].trf.rotate(-random(0.5, 1.2));
      }
      children[0].trf.scale(0.95);
    } 
    // or create two smaller pieces at the end of this one
    else {
      children = new Bolt[2];
      children[0] = new Bolt(gen+1);
      children[0].trf.translate(0, len);
      children[0].trf.rotate(random(0.7, 1.2));
      children[0].trf.scale(0.7);

      children[1] = new Bolt(gen+1);
      children[1].trf.translate(0, len);
      children[1].trf.rotate(-random(0.7, 1.2));
      children[1].trf.scale(0.8);
    }
  }
}



