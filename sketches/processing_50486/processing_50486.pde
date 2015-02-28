
class Hub extends Particle {

  HubsPS neighbours;
  Hub currentlyPointingAt;
  int ownLetter;
  boolean corner = false;

  Hub(PVector location, int letter) {
    super(location);

    ownLetter = letter;

    neighbours = new HubsPS();

    diameter = 25;
    colour = color(160, 20, 0);
  }

  void onKeyPress(int keyCode) {
    //println(keyCode + " "+ ownLetter);
    if (keyCode == ownLetter) {
      turnPointAt();
    }
  }

  void turnPointAt() {
    //println("turn!");
    int c = neighbours.size();

    int neighbourIndex = neighbours.particles.indexOf(currentlyPointingAt);
    int nextNeighbourIndex = ((neighbourIndex + 1) % c);
    currentlyPointingAt = (Hub) neighbours.particles.get(nextNeighbourIndex);
  }

  void render() {
    noFill();
    fill(colour);
    ellipse(loc.x, loc.y, diameter, diameter);

    int c = neighbours.size();
    for (int k = 0; k < c; k++) {
      Hub hub = (Hub) neighbours.particles.get(k);
      strokeWeight(1);
      stroke(200, 60);
      line(loc.x, loc.y, hub.loc.x, hub.loc.y);
    }

    // show currently pointing at line

    strokeWeight( random(1) );
    PVector dLine = PVector.sub(currentlyPointingAt.loc, loc);
    dLine.normalize();
    dLine.mult(50);
    stroke(255, 255, 0);
    strokeWeight(2);
    line(loc.x, loc.y, loc.x+dLine.x, loc.y+dLine.y);

    stroke( random(0, 255), 255, random(0, 255) );    
    strokeWeight(1);
    ellipse(currentlyPointingAt.loc.x, currentlyPointingAt.loc.y, 3, 2);

    fill(255);    
    //println(ownLetter);
    textSize(24);
    text(hubLettersLabel[ownLetter], loc.x+15, loc.y+20);
  }
}


