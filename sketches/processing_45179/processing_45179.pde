
class AngryFace extends SadFace { // define the subclass AngryFace extends from subclass SadFace, which is from base class Face

  AngryFace() {
    super();
    b = 50;
    c = color(255, 0, 0);
    vel = new PVector(random(-10, 10), random(-10, 10));
  }
}


