
class ColorLib {
  color[] c;
  ArrayList <ColorComp> combinations = new ArrayList();
  ArrayList <Integer> ids = new ArrayList();

  int duoStart = 0;
  float percantageOfMonoColored = 20;

  ColorLib(color[] c) {
    this.c = c;

    setColorCombinations();
    setIDs();
  }

  Integer getRandomIndex () {
    Integer i = new Integer (0);
    float dice = random (100);
    if (dice < percantageOfMonoColored) i = ids.get ((int) random (1, duoStart));
    else i = ids.get ((int) random (duoStart, combinations.size()));
    return i;
  }

  color getColor () {
    return getColor(0);
  }

  color getColor(int id) {
    id = constrain (id, 0, ids.size()-1);
    return combinations.get(id).getColor() [0];
  }

  color[] getColorAtID(int id) {
    id = constrain (id, 0, ids.size()-1);

    return combinations.get(id).getColor();
  }

  void setIDs () {
    for (int i = 0; i < combinations.size (); i++) {
      ids.add (new Integer(i));
    }
  }

  void setColorCombinations () {


    // MONOCOLO
    for (color ct : c) {
      combinations.add(new  ColorComp (ct));
    }

    duoStart += combinations.size();

    // DUO 
    for (int i = 1; i < c.length; i++) {
      for (int j = i + 1; j < c.length; j++) {
        combinations.add(new ColorComp (c[i], c[j]));
      }
    }


    for (int i = c.length-1; i > 0; i--) {
      for (int j = i-1; j > 0; j--) {
        combinations.add(new ColorComp (c[i], c[j]));
      }
    }
  }
}

class ColorComp {
  color[] c = new color [2];

  ColorComp (color c) {
    this.c[0] = c;
    this.c[1] = c;
  }

  ColorComp (color c1, color c2) {
    c[0] = c1;
    c[1] = c2;
  }

  color[] getColor () {
    return c;
  }
}


