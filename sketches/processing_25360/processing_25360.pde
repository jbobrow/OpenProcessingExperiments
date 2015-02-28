
//-----------------the obstacles in the game and the cowboys at the end
class Debris {

  PImage[] debris;

  int index;

  PVector mover, vel;

  float speed;

  //--------------------distance for collision  
  float colDist;

  //-----------------------------------------------------------------setup etc
  //----------------------------------------------------------works out which image, whether it spawns high or low, and how fast it travels.
  Debris(PApplet p, String s, int _index, int _y, float _speed) {

    XMLElement file = new XMLElement(p,s);

    loadImages(file);

    this.index = _index;

    mover = new PVector (width + (debris[0].width/2), 0);
    vel = new PVector (- _speed, 0);

    //-----------------------------this is so that cactus are only ever on the ground as well as setting randomly whether stuff spawns high or low   
    if(_y == 1 || index == 0) {
      mover.y = 218;
    } 
    else if (_y > 1) {
      mover.y = 190;
    }
  }

  //--------------------------------an alternate constructor for the cowboys, so they can be placed wherever and so they don't move
  Debris(PApplet n, String m, int _indexC, float _mX) {

    XMLElement fileC = new XMLElement(n,m);

    loadImages(fileC);

    this.index = _indexC;

    mover = new PVector (_mX, 218);
    vel = new PVector (0, 0);
  }

  //--------------------just draws thems
  void draw() {
    image(debris[index], mover.x, mover.y);
  }

  //------------------------updates stuff
  void update(Tumbleweed a) {
    //--------------------------so only if it is not the cowboys does it add vel or check for collision
    if(index != 5 && index!= 6) {
      mover.add(vel);

      //---------------------------------distance beween Debis and Tumbleweed
      colDist = dist(a.getMX(), a.getMY(), mover.x, mover.y);

      collisionCheck(a);
    }
  }

  //--------------------checkss the collision, if the Debris is within the tumbleweed, then it sets the Tumbleweed's stun state to true, thus moving him back with Debris  
  void collisionCheck(Tumbleweed b) {

    if(colDist < b.getHalfWidth()) {
      b.setStun(true);
    }
  }

  //---------------------------------loads the images
  void loadImages(XMLElement x) {

    XMLElement deb = x.getChild("debris");
    XMLElement[] filesDeb = deb.getChildren("file");

    debris = new PImage[filesDeb.length];

    for(int i = 0; i < debris.length; i++) debris[i] = loadImage(filesDeb[i].getStringAttribute("name"));
  }
}


